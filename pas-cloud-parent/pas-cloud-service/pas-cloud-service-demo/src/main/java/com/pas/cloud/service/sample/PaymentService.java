/**
 * 
 */
package com.pas.cloud.service.sample;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pas.cloud.api.sample.CapitalService;
import com.pas.cloud.api.sample.RedPacketService;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.RedPacketDto;
import com.pas.cloud.sample.dao.OrderDao;
import com.pas.cloud.transaction.Compensable;

/**
 * @author chenly 
 *
 * @version createtime:2016-7-4 下午2:06:14 
 */
@Service
public class PaymentService {
	
	//@Reference(version="1.0.0")
	private CapitalService capitalService;
	
	//@Reference(version="1.0.0")
	private RedPacketService redPacketService;
	
	@Autowired
	private OrderDao orderDao;
	
	@Compensable(confirmMethod = "confirmMakePayment",cancelMethod = "cancelMakePayment")
    public void makePayment(Order order, BigDecimal redPacketPayAmount, BigDecimal capitalPayAmount) {
        System.out.println("order try make payment called");

        order.pay(redPacketPayAmount, capitalPayAmount);
        orderDao.update(order);

        capitalService.record(null, buildCapitalDto(order));
        redPacketService.record(null, buildRedPacketDto(order));
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
