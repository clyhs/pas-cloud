package com.pas.cloud.transaction.repository;


import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.pas.cloud.transaction.Transaction;
import com.pas.cloud.transaction.TransactionRepository;
import com.pas.cloud.transaction.api.TransactionXid;

import javax.transaction.xa.Xid;

import org.apache.log4j.Logger;

import java.util.ConcurrentModificationException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Created by changmingxie on 10/30/15.
 */
public abstract class CachableTransactionRepository implements TransactionRepository {

	private static Logger log = Logger.getLogger(CachableTransactionRepository.class);
	
    private int expireDuration = 300;

    private Cache<Xid, Transaction> transactionXidCompensableTransactionCache;

    public int create(Transaction transaction) {
        int result = doCreate(transaction);
        
        log.info("**********create Transaction create************");
        
        if (result > 0) {
        	log.info("**********create Transaction success************");
        	log.info("**********create Transaction puttocache************");
            putToCache(transaction);
            log.info("**********create Transaction puttocache end************");
        }
        return result;
    }

    public int update(Transaction transaction) {
        int result = doUpdate(transaction);
        log.info("**********update Transaction update************");
        if (result > 0) {
        	log.info("**********update Transaction success************");
        	log.info("**********update Transaction puttocache************");
            putToCache(transaction);
            log.info("**********update Transaction puttocache end************");
        } else {
            //throw new ConcurrentModificationException();
        }
        return result;
    }

    public int delete(Transaction transaction) {
        int result = doDelete(transaction);
        log.info("**********delete Transaction update************");
        if (result > 0) {
        	log.info("**********delete Transaction success************");
        	log.info("**********delete Transaction removecache************");
            removeFromCache(transaction);
            log.info("**********delete Transaction removecache end************");
        }
        return result;
    }

    public Transaction findByXid(TransactionXid transactionXid) {
        Transaction transaction = findFromCache(transactionXid);

        if (transaction == null) {
            transaction = doFindOne(transactionXid);

            if (transaction != null) {
                putToCache(transaction);
            }
        }

        return transaction;
    }

    public List<Transaction> findAllUnmodifiedSince(Date date) {

        List<Transaction> transactions = doFindAllUnmodifiedSince(date);

        for (Transaction transaction : transactions) {
            putToCache(transaction);
        }

        return transactions;
    }
//
//    @Override
//    public void addErrorTransaction(Transaction transaction) {
//        putToErrorCache(transaction);
//    }
//
//    @Override
//    public void removeErrorTransaction(Transaction transaction) {
//        removeFromErrorCache(transaction);
//    }
//
//    @Override
//    public Collection<Transaction> findAllErrorTransactions() {
//        return findAllFromErrorCache();
//    }

    public CachableTransactionRepository() {
        transactionXidCompensableTransactionCache = CacheBuilder.newBuilder().expireAfterAccess(expireDuration, TimeUnit.SECONDS).maximumSize(1000).build();
//        errorTransactionXidCompensableTransactionCache = CacheBuilder.newBuilder().expireAfterAccess(expireDuration, TimeUnit.SECONDS).maximumSize(1000).build();
    }

    protected void putToCache(Transaction transaction) {
        transactionXidCompensableTransactionCache.put(transaction.getXid(), transaction);
    }

    protected void removeFromCache(Transaction transaction) {
        transactionXidCompensableTransactionCache.invalidate(transaction.getXid());
    }

    protected Transaction findFromCache(TransactionXid transactionXid) {
        return transactionXidCompensableTransactionCache.getIfPresent(transactionXid);
    }
//
//    protected void putToErrorCache(Transaction transaction) {
//        errorTransactionXidCompensableTransactionCache.put(transaction.getXid(), transaction);
//    }
//
//    protected void removeFromErrorCache(Transaction transaction) {
//        errorTransactionXidCompensableTransactionCache.invalidate(transaction.getXid());
//    }
//
//    protected Collection<Transaction> findAllFromErrorCache() {
//        return errorTransactionXidCompensableTransactionCache.asMap().values();
//    }

    public final void setExpireDuration(int durationInSeconds) {
        this.expireDuration = durationInSeconds;
    }

    protected abstract int doCreate(Transaction transaction);

    protected abstract int doUpdate(Transaction transaction);

    protected abstract int doDelete(Transaction transaction);

    protected abstract Transaction doFindOne(Xid xid);

    protected abstract List<Transaction> doFindAllUnmodifiedSince(Date date);
}
