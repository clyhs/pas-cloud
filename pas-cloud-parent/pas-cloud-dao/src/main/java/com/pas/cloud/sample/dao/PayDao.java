/**
 * 
 */
package com.pas.cloud.sample.dao;


import java.math.BigDecimal;

import org.apache.log4j.Logger;
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

	private static Logger log = Logger.getLogger(PayDao.class);
	@Autowired
	private CapitalDao capitalDao;
	
	@Autowired
	private RedPacketDao redPacketDao;
	
	@Autowired
	private OrderDao orderDao;
	
	
	@Compensable(confirmMethod = "confirmMakePayment",cancelMethod = "cancelMakePayment")
    public void makePayment(Order order, BigDecimal redPacketPayAmount, BigDecimal capitalPayAmount) {
        System.out.println("order try make payment called");

        log.info("***************开始付款...*****************");
        order.pay(redPacketPayAmount, capitalPayAmount);
        log.info("***************更新订单金额入库：红包、金额*****************");
        orderDao.update(order);
        log.info("***************订单金额入库更新成功*****************");
        

        log.info("***************开始记录金额buildCapitalDto(order)*****************");
        capitalDao.record(null, buildCapitalDto(order));
        log.info("***************开始记录红包buildRedPacketDto(order)*****************");
        redPacketDao.record(null, buildRedPacketDto(order));
        log.info("***************记录成功*****************");
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
