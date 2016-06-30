package com.pas.cloud.util;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.tuple.Pair;

import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.OrderLine;


public class OrderFactory {


    public static Order buildOrder(long payerUserId, long payeeUserId, List<Pair<Long, Integer>> productQuantities) {

        Order order = new Order(payerUserId, payeeUserId);

        for (Pair<Long, Integer> pair : productQuantities) {
            order.addOrderLine(new OrderLine(pair.getLeft(), pair.getRight(), BigDecimal.valueOf(60)));
        }

        return order;
    }
}