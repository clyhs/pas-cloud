/**
 * 
 */
package com.pas.cloud.api.sample;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.tuple.Pair;

/**
 * @author chenly 
 *
 * @version createtime:2016-7-1 上午9:52:33 
 */
public interface PlaceOrderService {

	public void changeDataSource(String dataSource);
	
	public void placeOrder(Integer payerUserId, Integer shopId, List<Pair<Integer, Integer>> productQuantities,BigDecimal redPacketPayAmount);
	
	public void placeOrder();
	
	public String sayHello();
}
