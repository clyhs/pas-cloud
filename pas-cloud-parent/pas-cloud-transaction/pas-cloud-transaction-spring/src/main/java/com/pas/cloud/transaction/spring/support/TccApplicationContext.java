package com.pas.cloud.transaction.spring.support;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.pas.cloud.transaction.support.BeanFactory;

/**
 * Created by changmingxie on 11/22/15.
 */
@Component
public class TccApplicationContext implements BeanFactory, ApplicationContextAware {

    private ApplicationContext applicationContext;

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }

    public Object getBean(Class<?> aClass) {
        return this.applicationContext.getBean(aClass);
    }
}
