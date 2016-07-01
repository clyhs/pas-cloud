/**
 * 
 */
package com.pas.cloud.sample.bean;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午1:44:02 
 */
public class RedPacketDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer selfUserId;

    private Integer oppositeUserId;

    private String orderTitle;

    private String merchantOrderNo;

    private BigDecimal amount;

	public Integer getSelfUserId() {
		return selfUserId;
	}

	public void setSelfUserId(Integer selfUserId) {
		this.selfUserId = selfUserId;
	}

	public Integer getOppositeUserId() {
		return oppositeUserId;
	}

	public void setOppositeUserId(Integer oppositeUserId) {
		this.oppositeUserId = oppositeUserId;
	}

	public String getOrderTitle() {
		return orderTitle;
	}

	public void setOrderTitle(String orderTitle) {
		this.orderTitle = orderTitle;
	}

	public String getMerchantOrderNo() {
		return merchantOrderNo;
	}

	public void setMerchantOrderNo(String merchantOrderNo) {
		this.merchantOrderNo = merchantOrderNo;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

}
