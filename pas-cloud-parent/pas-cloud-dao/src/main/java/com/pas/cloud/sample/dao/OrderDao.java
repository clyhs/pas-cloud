/**
 * 
 */
package com.pas.cloud.sample.dao;

import java.util.List;

import org.apache.commons.lang3.tuple.Pair;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.OrderLine;
import com.pas.cloud.sample.mapper.OrderLineMapper;
import com.pas.cloud.sample.mapper.OrderMapper;
import com.pas.cloud.util.OrderFactory;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午4:36:44 
 */
@Repository
public class OrderDao {
	
	private static Logger log = Logger.getLogger(OrderDao.class);
	
	@Autowired
	private OrderLineMapper orderLineMapper;
	
	@Autowired
	private OrderMapper orderMapper;
	
	public void insert(Order order) {
		orderMapper.insert(order);

        for(OrderLine orderLine:order.getOrderLines()) {
        	orderLineMapper.insert(orderLine);
        }
    }

    public void update(Order order) {
    	orderMapper.update(order);
    }
    
    
    public Order createOrder(Integer payerUserId, Integer payeeUserId, List<Pair<Integer, Integer>> productQuantities) {
        Order order = OrderFactory.buildOrder(payerUserId, payeeUserId, productQuantities);

        log.info("***************订单入库*****************");
        orderMapper.insert(order);

        log.info("***************订单入库完毕*****************");
        return order;
    }

}
