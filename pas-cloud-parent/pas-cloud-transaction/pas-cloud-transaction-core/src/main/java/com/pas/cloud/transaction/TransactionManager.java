package com.pas.cloud.transaction;



import com.pas.cloud.transaction.api.TransactionContext;
import com.pas.cloud.transaction.api.TransactionStatus;
import com.pas.cloud.transaction.common.TransactionType;
import com.pas.cloud.transaction.support.TransactionConfigurator;

/**
 * Created by changmingxie on 10/26/15.
 */
public class TransactionManager {

    private TransactionConfigurator transactionConfigurator;

    public TransactionManager(TransactionConfigurator transactionConfigurator) {
        this.transactionConfigurator = transactionConfigurator;
    }

    private ThreadLocal<Transaction> threadLocalTransaction = new ThreadLocal<Transaction>();

    public void begin() {

        Transaction transaction = new Transaction(TransactionType.ROOT);
        TransactionRepository transactionRepository = transactionConfigurator.getTransactionRepository();
        transactionRepository.create(transaction);
        threadLocalTransaction.set(transaction);
    }

    public void propagationNewBegin(TransactionContext transactionContext) {

        Transaction transaction = new Transaction(transactionContext);
        transactionConfigurator.getTransactionRepository().create(transaction);

        threadLocalTransaction.set(transaction);
    }

    public void propagationExistBegin(TransactionContext transactionContext) throws NoExistedTransactionException {
        TransactionRepository transactionRepository = transactionConfigurator.getTransactionRepository();
        Transaction transaction = transactionRepository.findByXid(transactionContext.getXid());

        if (transaction != null) {
            transaction.changeStatus(TransactionStatus.valueOf(transactionContext.getStatus()));
            threadLocalTransaction.set(transaction);
        } else {
            throw new NoExistedTransactionException();
        }
    }

    public void commit() {

        Transaction transaction = getCurrentTransaction();

        transaction.changeStatus(TransactionStatus.CONFIRMING);

        transactionConfigurator.getTransactionRepository().update(transaction);

        transaction.commit();
        transactionConfigurator.getTransactionRepository().delete(transaction);
    }

    public Transaction getCurrentTransaction() {
        return threadLocalTransaction.get();
    }

    public void rollback() {

        Transaction transaction = getCurrentTransaction();
        transaction.changeStatus(TransactionStatus.CANCELLING);

        transactionConfigurator.getTransactionRepository().update(transaction);


        transaction.rollback();
        transactionConfigurator.getTransactionRepository().delete(transaction);

    }
}
