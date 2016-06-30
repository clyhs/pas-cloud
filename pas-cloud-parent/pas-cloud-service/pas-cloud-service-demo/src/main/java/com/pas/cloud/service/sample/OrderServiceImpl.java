/**
 * 
 */
package com.pas.cloud.service.sample;

import java.util.List;

import org.apache.commons.lang3.tuple.Pair;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.api.sample.OrderService;
import com.pas.cloud.base.BaseServiceSupport;
import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.dao.OrderDao;
import com.pas.cloud.util.DataSourceHolder;
import com.pas.cloud.util.OrderFactory;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午4:47:30 
 */
@Service(version="1.0.0")
public class OrderServiceImpl extends BaseServiceSupport<Order> implements
		OrderService {

	@Autowired
	private OrderDao orderDao;


	/* (non-Javadoc)
	 * @see com.pas.cloud.base.BaseServiceSupport#add(java.lang.Object)
	 */
	@Override
	public void add(Order t) {
		// TODO Auto-generated method stub
		orderDao.insert(t);
	}

	/* (non-Javadoc)
	 * @see com.pas.cloud.base.BaseServiceSupport#findById(java.lang.Integer)
	 */
	@Override
	public Order findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
