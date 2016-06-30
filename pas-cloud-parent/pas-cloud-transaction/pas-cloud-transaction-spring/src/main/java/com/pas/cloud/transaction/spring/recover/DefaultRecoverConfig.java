package com.pas.cloud.transaction.spring.recover;

import com.pas.cloud.transaction.recover.RecoverConfig;


/**
 * Created by changming.xie on 6/1/16.
 */
public class DefaultRecoverConfig implements RecoverConfig {

    public static final RecoverConfig INSTANCE = new DefaultRecoverConfig();

    private int maxRetryCount = 30;

    private int recoverDuration = 120; //120 seconds

    private String cronExpression = "0 */1 * * * ?";

    public int getMaxRetryCount() {
        return maxRetryCount;
    }

    public int getRecoverDuration() {
        return recoverDuration;
    }

    public String getCronExpression() {
        return cronExpression;
    }

    public void setMaxRetryCount(int maxRetryCount) {
        this.maxRetryCount = maxRetryCount;
    }

    public void setRecoverDuration(int recoverDuration) {
        this.recoverDuration = recoverDuration;
    }

    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
    }
}
