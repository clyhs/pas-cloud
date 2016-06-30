package com.pas.cloud.transaction.spring.support;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.pas.cloud.transaction.support.BeanFactory;
import com.pas.cloud.transaction.support.BeanFactoryAdapter;

/**
 * Created by changmingxie on 11/20/15.
 */
@Component
public class TccBeanPostProcessor implements ApplicationListener<ContextRefreshedEvent> {

    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        ApplicationContext applicationContext = contextRefreshedEvent.getApplicationContext();

        if (applicationContext.getParent() == null) {

            BeanFactoryAdapter.setBeanFactory(applicationContext.getBean(BeanFactory.class));
        }
    }
}
