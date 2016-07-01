package com.pas.cloud.sample.bean;

import java.io.Serializable;
import java.math.BigDecimal;

public class OrderLine implements Serializable {

    private static final long serialVersionUID = 2300754647209250837L;
    private Integer id;

    private Integer productId;

    private int quantity;

    private BigDecimal unitPrice;

    public OrderLine() {

    }

    public OrderLine(Integer productId, Integer quantity,BigDecimal unitPrice) {
        this.productId = productId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public Integer getProductId() {
        return productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public BigDecimal getTotalAmount() {
        return unitPrice.multiply(BigDecimal.valueOf(quantity));
    }

    public Integer getId() {
        return id;
    }
}
