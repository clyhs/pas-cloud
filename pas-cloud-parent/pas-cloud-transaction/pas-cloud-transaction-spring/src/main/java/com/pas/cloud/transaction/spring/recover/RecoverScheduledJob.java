package com.pas.cloud.transaction.spring.recover;


import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.springframework.scheduling.quartz.CronTriggerBean;
import org.springframework.scheduling.quartz.MethodInvokingJobDetailFactoryBean;

import com.pas.cloud.transaction.SystemException;
import com.pas.cloud.transaction.recover.TransactionRecovery;
import com.pas.cloud.transaction.support.TransactionConfigurator;

/**
 * Created by changming.xie on 6/2/16.
 */
public class RecoverScheduledJob {

    private TransactionRecovery transactionRecovery;

    private TransactionConfigurator transactionConfigurator;

    private Scheduler scheduler;

    public void init() {

        try {
            MethodInvokingJobDetailFactoryBean jobDetail = new MethodInvokingJobDetailFactoryBean();
            jobDetail.setTargetObject(transactionRecovery);
            jobDetail.setTargetMethod("startRecover");
            jobDetail.setName("transactionRecoveryJob");
            jobDetail.setConcurrent(false);
            jobDetail.afterPropertiesSet();

            CronTriggerBean cronTrigger = new CronTriggerBean();
            cronTrigger.setBeanName("transactionRecoveryCronTrigger");

            cronTrigger.setCronExpression(transactionConfigurator.getRecoverConfig().getCronExpression());
            
            cronTrigger.afterPropertiesSet();

            scheduler.scheduleJob((JobDetail) jobDetail.getObject(), cronTrigger);

            scheduler.start();

        } catch (Exception e) {
            throw new SystemException(e);
        }
    }

    public void setTransactionRecovery(TransactionRecovery transactionRecovery) {
        this.transactionRecovery = transactionRecovery;
    }

    public void setTransactionConfigurator(TransactionConfigurator transactionConfigurator) {
        this.transactionConfigurator = transactionConfigurator;
    }

    public Scheduler getScheduler() {
        return scheduler;
    }

    public void setScheduler(Scheduler scheduler) {
        this.scheduler = scheduler;
    }
}
