package com.pas.cloud.sample.request;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.tuple.Pair;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-7-1 上午9:44:05
 */
public class PlaceOrderRequest {

    private Integer payerUserId;

    private Integer shopId;

    private BigDecimal redPacketPayAmount;

    private List<Pair<Integer, Integer>> productQuantities = new ArrayList<Pair<Integer, Integer>>();

    public Integer getPayerUserId() {
        return payerUserId;
    }

    public void setPayerUserId(Integer payerUserId) {
        this.payerUserId = payerUserId;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public BigDecimal getRedPacketPayAmount() {
        return redPacketPayAmount;
    }

    public void setRedPacketPayAmount(BigDecimal redPacketPayAmount) {
        this.redPacketPayAmount = redPacketPayAmount;
    }

    public List<Pair<Integer, Integer>> getProductQuantities() {
        return productQuantities;
    }

    public void setProductQuantities(List<Pair<Integer, Integer>> productQuantities) {
        this.productQuantities = productQuantities;
    }
}