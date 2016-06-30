package com.pas.cloud.transaction.repository;


import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.pas.cloud.transaction.Transaction;
import com.pas.cloud.transaction.TransactionRepository;
import com.pas.cloud.transaction.api.TransactionXid;

import javax.transaction.xa.Xid;
import java.util.ConcurrentModificationException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Created by changmingxie on 10/30/15.
 */
public abstract class CachableTransactionRepository implements TransactionRepository {

    private int expireDuration = 300;

    private Cache<Xid, Transaction> transactionXidCompensableTransactionCache;

    public int create(Transaction transaction) {
        int result = doCreate(transaction);
        if (result > 0) {
            putToCache(transaction);
        }
        return result;
    }

    public int update(Transaction transaction) {
        int result = doUpdate(transaction);
        if (result > 0) {
            putToCache(transaction);
        } else {
            throw new ConcurrentModificationException();
        }
        return result;
    }

    public int delete(Transaction transaction) {
        int result = doDelete(transaction);
        if (result > 0) {
            removeFromCache(transaction);
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
