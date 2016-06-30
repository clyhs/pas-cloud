package com.pas.cloud.transaction.spring.support;


import org.springframework.beans.factory.annotation.Autowired;

import com.pas.cloud.transaction.TransactionManager;
import com.pas.cloud.transaction.TransactionRepository;
import com.pas.cloud.transaction.recover.RecoverConfig;
import com.pas.cloud.transaction.spring.recover.DefaultRecoverConfig;
import com.pas.cloud.transaction.support.TransactionConfigurator;

/**
 * Created by changmingxie on 11/11/15.
 */
public class TccTransactionConfigurator implements TransactionConfigurator {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired(required = false)
    private RecoverConfig recoverConfig = DefaultRecoverConfig.INSTANCE;

    private TransactionManager transactionManager = new TransactionManager(this);

    public TransactionManager getTransactionManager() {
        return transactionManager;
    }

    public TransactionRepository getTransactionRepository() {
        return transactionRepository;
    }

    public RecoverConfig getRecoverConfig() {
        return recoverConfig;
    }
}
