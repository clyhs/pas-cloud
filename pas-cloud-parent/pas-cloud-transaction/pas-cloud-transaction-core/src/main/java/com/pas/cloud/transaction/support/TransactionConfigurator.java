package com.pas.cloud.transaction.support;

import com.pas.cloud.transaction.TransactionManager;
import com.pas.cloud.transaction.TransactionRepository;
import com.pas.cloud.transaction.recover.RecoverConfig;


/**
 * Created by changmingxie on 11/10/15.
 */
public interface TransactionConfigurator {

    public TransactionManager getTransactionManager();

    public TransactionRepository getTransactionRepository();

    public RecoverConfig getRecoverConfig();

}
