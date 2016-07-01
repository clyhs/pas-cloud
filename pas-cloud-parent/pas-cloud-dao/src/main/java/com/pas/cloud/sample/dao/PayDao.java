/**
 * 
 */
package com.pas.cloud.sample.dao;


import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.RedPacketDto;
import com.pas.cloud.transaction.Compensable;

/**
 * @author chenly 
 *
 * @version createtime:2016-7-1 上午9:35:13 
 */
@Repository
public class PayDao {

	@Autowired
	private CapitalDao capitalDao;
	
	@Autowired
	private RedPacketDao redPacketDao;
	
	@Autowired
	private OrderDao orderDao;
	
	
	@Compensable(confirmMethod = "confirmMakePayment",cancelMethod = "cancelMakePayment")
    public void makePayment(Order order, BigDecimal redPacketPayAmount, BigDecimal capitalPayAmount) {
        System.out.println("order try make payment called");

        order.pay(redPacketPayAmount, capitalPayAmount);
        orderDao.update(order);

        capitalDao.record(null, buildCapitalDto(order));
        redPacketDao.record(null, buildRedPacketDto(order));
    }

    public void confirmMakePayment(Order order, BigDecimal redPacketPayAmount, BigDecimal capitalPayAmount) {

        System.out.println("order confirm make payment called");
        order.confirm();

        orderDao.update(order);
    }

    public void cancelMakePayment(Order order, BigDecimal redPacketPayAmount, BigDecimal capitalPayAmount) {

        System.out.println("order cancel make payment called");

        order.cancelPayment();

        orderDao.update(order);
    }
	
	
	private CapitalDto buildCapitalDto(Order order) {

        CapitalDto tradeOrderDto = new CapitalDto();
        tradeOrderDto.setAmount(order.getCapitalPayAmount());
        tradeOrderDto.setMerchantOrderNo(order.getMerchantOrderNo());
        tradeOrderDto.setSelfUserId(order.getPayerUserId());
        tradeOrderDto.setOppositeUserId(order.getPayeeUserId());
        tradeOrderDto.setOrderTitle(String.format("order no:%s", order.getMerchantOrderNo()));

        return tradeOrderDto;
    }

    private RedPacketDto buildRedPacketDto(Order order) {
        RedPacketDto tradeOrderDto = new RedPacketDto();
        tradeOrderDto.setAmount(order.getRedPacketPayAmount());
        tradeOrderDto.setMerchantOrderNo(order.getMerchantOrderNo());
        tradeOrderDto.setSelfUserId(order.getPayerUserId());
        tradeOrderDto.setOppositeUserId(order.getPayeeUserId());
        tradeOrderDto.setOrderTitle(String.format("order no:%s", order.getMerchantOrderNo()));

        return tradeOrderDto;
    }
}
