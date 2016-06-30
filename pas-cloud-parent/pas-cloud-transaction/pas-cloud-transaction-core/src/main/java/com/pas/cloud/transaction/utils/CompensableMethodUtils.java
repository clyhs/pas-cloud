package com.pas.cloud.transaction.utils;

import com.pas.cloud.transaction.api.TransactionContext;
import com.pas.cloud.transaction.common.MethodType;



/**
 * Created by changmingxie on 11/21/15.
 */
public class CompensableMethodUtils {

    public static MethodType calculateMethodType( TransactionContext transactionContext, boolean isCompensable) {

        if (transactionContext == null && isCompensable) {
            //isRootTransactionMethod
            return MethodType.ROOT;
        } else if (transactionContext == null && !isCompensable) {
            //isSoaConsumer
            return MethodType.CONSUMER;
        } else if (transactionContext != null && isCompensable) {
            //isSoaProvider
            return MethodType.PROVIDER;
        } else {
            return MethodType.NORMAL;
        }
    }

    public static int getTransactionContextParamPosition(Class<?>[] parameterTypes) {

        int i = -1;

        for (i = 0; i < parameterTypes.length; i++) {
            if (parameterTypes[i].equals(TransactionContext.class)) {
                break;
            }
        }
        return i;
    }

    public static TransactionContext getTransactionContextFromArgs(Object[] args) {

        TransactionContext transactionContext = null;

        for (Object arg : args) {
            if (arg != null && TransactionContext.class.isAssignableFrom(arg.getClass())) {

                transactionContext = (TransactionContext) arg;
            }
        }

        return transactionContext;
    }
}
