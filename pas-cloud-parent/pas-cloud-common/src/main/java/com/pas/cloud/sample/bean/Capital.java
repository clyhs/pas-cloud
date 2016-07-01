package com.pas.cloud.sample.bean;

import java.math.BigDecimal;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午1:51:02
 */
public class Capital {

    private Integer id;

    private Integer userId;

    private BigDecimal balanceAmount;

    public Integer getUserId() {
        return userId;
    }

    public BigDecimal getBalanceAmount() {
        return balanceAmount;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void transferFrom(BigDecimal amount) {
        this.balanceAmount = this.balanceAmount.subtract(amount);

        if (BigDecimal.ZERO.compareTo(this.balanceAmount) > 0) {
            throw new RuntimeException("not enough balance!");
        }
    }

    public void transferTo(BigDecimal amount) {
        this.balanceAmount = this.balanceAmount.add(amount);
    }

    public void cancelTransfer(BigDecimal amount) {
        transferTo(amount);
    }
}
