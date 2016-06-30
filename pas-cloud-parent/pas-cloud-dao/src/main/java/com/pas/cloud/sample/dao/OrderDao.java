/**
 * 
 */
package com.pas.cloud.sample.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.OrderLine;
import com.pas.cloud.sample.mapper.OrderLineMapper;
import com.pas.cloud.sample.mapper.OrderMapper;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午4:36:44 
 */
@Repository
public class OrderDao {
	
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

}
