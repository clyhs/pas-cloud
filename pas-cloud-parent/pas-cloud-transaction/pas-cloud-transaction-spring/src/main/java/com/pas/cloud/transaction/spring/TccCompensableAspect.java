package com.pas.cloud.transaction.spring;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;

import com.pas.cloud.transaction.interceptor.CompensableTransactionInterceptor;

/**
 * Created by changmingxie on 10/30/15.
 */
@Aspect
public class TccCompensableAspect implements Ordered {

    private int order = Ordered.HIGHEST_PRECEDENCE;

    private CompensableTransactionInterceptor compensableTransactionInterceptor;

    @Pointcut("@annotation(com.pas.cloud.transaction.Compensable)")
    public void compensableService() {

    }

    @Around("compensableService()")
    public void interceptCompensableMethod(ProceedingJoinPoint pjp) throws Throwable {

        compensableTransactionInterceptor.interceptCompensableMethod(pjp);
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public void setCompensableTransactionInterceptor(CompensableTransactionInterceptor compensableTransactionInterceptor) {
        this.compensableTransactionInterceptor = compensableTransactionInterceptor;
    }
}
