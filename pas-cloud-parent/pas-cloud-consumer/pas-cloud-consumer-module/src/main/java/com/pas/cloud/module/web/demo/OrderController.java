/**
 * 
 */
package com.pas.cloud.module.web.demo;

import java.math.BigDecimal;

import org.apache.commons.lang3.tuple.ImmutablePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pas.cloud.module.busi.demo.PlaceOrderBusiness;
import com.pas.cloud.sample.request.PlaceOrderRequest;

/**
 * @author chenly 
 *
 * @version createtime:2016-7-1 上午10:05:36 
 */
@Controller
public class OrderController {
	
	@Autowired
	private PlaceOrderBusiness placeOrderBusiness;
	
	@RequestMapping("/module/order/place")
    @ResponseBody
    public String placeOrder() {

        placeOrderBusiness.placeOrder();
        return "success";
    }
	
	@RequestMapping("/module/order/hello")
    @ResponseBody
	public String say(){
		return placeOrderBusiness.sayHello();
	}
	
	

}
