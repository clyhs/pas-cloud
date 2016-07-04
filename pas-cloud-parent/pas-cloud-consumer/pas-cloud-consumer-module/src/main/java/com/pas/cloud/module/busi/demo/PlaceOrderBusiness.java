/**
 * 
 */
package com.pas.cloud.module.busi.demo;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.tuple.Pair;
import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pas.cloud.api.sample.PlaceOrderService;
import com.pas.cloud.module.intf.demo.IPlaceOrderBusiness;

/**
 * @author chenly 
 *
 * @version createtime:2016-7-1 上午10:02:58 
 */
@Service
public class PlaceOrderBusiness implements IPlaceOrderBusiness {
	
	//@Reference(version="1.0.0",retries=0,timeout=3600)
	private PlaceOrderService placeOrderService;

	/* (non-Javadoc)
	 * @see com.pas.cloud.module.intf.demo.IPlaceOrderBusiness#placeOrder(long, java.lang.Integer, java.util.List, java.math.BigDecimal)
	 */
	public void placeOrder() {
		// TODO Auto-generated method stub
		changeDataSource();
		placeOrderService.placeOrder();

	}
	
	private void changeDataSource(){
		placeOrderService.changeDataSource("dataSource_0");
	}

	/* (non-Javadoc)
	 * @see com.pas.cloud.module.intf.demo.IPlaceOrderBusiness#sayHello()
	 */
	public String sayHello() {
		// TODO Auto-generated method stub
		return placeOrderService.sayHello();
	}

}
