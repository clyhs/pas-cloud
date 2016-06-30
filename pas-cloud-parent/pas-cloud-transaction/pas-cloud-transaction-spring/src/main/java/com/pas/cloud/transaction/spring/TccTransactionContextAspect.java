package com.pas.cloud.transaction.spring;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;

import com.pas.cloud.transaction.interceptor.ResourceCoordinatorInterceptor;

/**
 * Created by changmingxie on 11/8/15.
 */
@Aspect
public class TccTransactionContextAspect implements Ordered {

    private int order = Ordered.HIGHEST_PRECEDENCE + 1;

    private ResourceCoordinatorInterceptor resourceCoordinatorInterceptor;

    @Pointcut("execution(public * *(com.pas.cloud.transaction.api.TransactionContext,..))||@annotation(org.mengyun.tcctransaction.Compensable)")
    public void transactionContextCall() {

    }

    @Around("transactionContextCall()")
    public void interceptTransactionContextMethod(ProceedingJoinPoint pjp) throws Throwable {

        resourceCoordinatorInterceptor.interceptTransactionContextMethod(pjp);
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public void setResourceCoordinatorInterceptor(ResourceCoordinatorInterceptor resourceCoordinatorInterceptor) {
        this.resourceCoordinatorInterceptor = resourceCoordinatorInterceptor;
    }
}
