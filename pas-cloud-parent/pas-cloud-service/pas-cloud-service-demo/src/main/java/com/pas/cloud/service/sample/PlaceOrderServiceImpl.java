/**
 * 
 */
package com.pas.cloud.service.sample;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.api.sample.PlaceOrderService;
import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.Shop;
import com.pas.cloud.sample.dao.OrderDao;
import com.pas.cloud.sample.dao.ShopDao;
import com.pas.cloud.sample.request.PlaceOrderRequest;
import com.pas.cloud.util.DataSourceHolder;

/**
 * @author chenly 
 *
 * @version createtime:2016-7-1 上午9:53:53 
 */
@Service(version="1.0.0",retries=0,timeout=3600)
public class PlaceOrderServiceImpl implements PlaceOrderService {
	
	private static Logger log = Logger.getLogger(PlaceOrderServiceImpl.class);
	
	@Autowired
	private ShopDao shopDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private PaymentService paymentService;

	/* (non-Javadoc)
	 * @see com.pas.cloud.api.sample.PlaceOrderService#changeDataSource(java.lang.String)
	 */
	public void changeDataSource(String dataSource) {
		// TODO Auto-generated method stub
		DataSourceHolder.setDataSource(dataSource);
	}

	/* (non-Javadoc)
	 * @see com.pas.cloud.api.sample.PlaceOrderService#placeOrder(long, long, java.util.List, java.math.BigDecimal)
	 */
	public void placeOrder(Integer payerUserId, Integer shopId,
			List<Pair<Integer, Integer>> productQuantities,
			BigDecimal redPacketPayAmount) {
		// TODO Auto-generated method stub
		log.info("***************查询SHOPID*****************");
		Shop shop = shopDao.getById(shopId);
		log.info("***************查询SHOPID完毕*****************");
		Order order = orderDao.createOrder(payerUserId, shop.getOwnerUserId(), productQuantities);
		log.info("***************付款开始*****************");
		paymentService.makePayment(order, redPacketPayAmount, order.getTotalAmount().subtract(redPacketPayAmount));
		
	}
	
	/* (non-Javadoc)
	 * @see com.pas.cloud.api.sample.PlaceOrderService#placeOrder()
	 */
	public void placeOrder() {
		// TODO Auto-generated method stub
		PlaceOrderRequest request = buildRequest();
		log.info("***************开始下单*****************");
		log.info("***************开始下单*****************");
		log.info("***************构造参数*****************");
		log.info("payuserid:"+request.getPayerUserId());
		log.info("redpacket:"+request.getRedPacketPayAmount()+"元");
		log.info("pquantities:"+request.getProductQuantities());
		log.info("shopId:"+request.getShopId());
		log.info("***************构造参数完毕*****************");
		placeOrder(request.getPayerUserId(), request.getShopId(),
                request.getProductQuantities(), request.getRedPacketPayAmount());
		
	}
	
	
	private PlaceOrderRequest buildRequest() {
        PlaceOrderRequest request = new PlaceOrderRequest();
        request.setPayerUserId(1000);
        request.setShopId(1);
        request.setRedPacketPayAmount(BigDecimal.TEN);
        request.getProductQuantities().add(new ImmutablePair<Integer, Integer>(1, 1));
        return request;
    }

	/* (non-Javadoc)
	 * @see com.pas.cloud.api.sample.PlaceOrderService#sayHello()
	 */
	public String sayHello() {
		// TODO Auto-generated method stub
		return "hello place order!";
	}

	

}
