package com.pas.cloud.util;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.tuple.Pair;

import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.OrderLine;


public class OrderFactory {


    public static Order buildOrder(Integer payerUserId, Integer payeeUserId, List<Pair<Integer, Integer>> productQuantities) {

        Order order = new Order(payerUserId, payeeUserId);

        
        
        for (Pair<Integer, Integer> pair : productQuantities) {
            order.addOrderLine(new OrderLine(pair.getLeft(), pair.getRight(), BigDecimal.valueOf(60)));
        }

        return order;
    }
}