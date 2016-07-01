/**
 * 
 */
package com.pas.cloud.service.sample;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.api.sample.PlaceOrderService;
import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.Shop;
import com.pas.cloud.sample.dao.OrderDao;
import com.pas.cloud.sample.dao.PayDao;
import com.pas.cloud.sample.dao.ShopDao;
import com.pas.cloud.sample.request.PlaceOrderRequest;
import com.pas.cloud.util.DataSourceHolder;

/**
 * @author chenly 
 *
 * @version createtime:2016-7-1 上午9:53:53 
 */
@Service(version="1.0.0")
public class PlaceOrderServiceImpl implements PlaceOrderService {
	
	@Autowired
	private ShopDao shopDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private PayDao payDao;

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
		Shop shop = shopDao.getById(shopId);
		Order order = orderDao.createOrder(payerUserId, shop.getOwnerUserId(), productQuantities);
		payDao.makePayment(order, redPacketPayAmount, order.getTotalAmount().subtract(redPacketPayAmount));
		
	}
	
	/* (non-Javadoc)
	 * @see com.pas.cloud.api.sample.PlaceOrderService#placeOrder()
	 */
	public void placeOrder() {
		// TODO Auto-generated method stub
		PlaceOrderRequest request = buildRequest();
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
