package com.pas.cloud.transaction;


import com.pas.cloud.transaction.support.BeanFactoryAdapter;
import com.pas.cloud.transaction.utils.StringUtils;


import java.io.Serializable;
import java.lang.reflect.Method;

/**
 * Created by changmingxie on 10/30/15.
 */
public class Terminator implements Serializable {

    private static final long serialVersionUID = -164958655471605778L;
    private InvocationContext confirmInvocationContext;

    private InvocationContext cancelInvocationContext;

    public Terminator(InvocationContext confirmInvocationContext, InvocationContext cancelInvocationContext) {
        this.confirmInvocationContext = confirmInvocationContext;
        this.cancelInvocationContext = cancelInvocationContext;
    }

    public void commit() {

        invoke(confirmInvocationContext);
    }

    public void rollback() {
        invoke(cancelInvocationContext);
    }

    private Object invoke(InvocationContext invocationContext) {

        if (StringUtils.isNotEmpty(invocationContext.getMethodName())) {

            try {
                Object target = BeanFactoryAdapter.getBean(invocationContext.getTargetClass());

                if (target == null && !invocationContext.getTargetClass().isInterface()) {
                    target = invocationContext.getTargetClass().newInstance();
                }

                Method method = null;

                method = target.getClass().getMethod(invocationContext.getMethodName(), invocationContext.getParameterTypes());

                return method.invoke(target, invocationContext.getArgs());

            } catch (Exception e) {
                throw new SystemException(e);
            }
        }
        return null;
    }
}
