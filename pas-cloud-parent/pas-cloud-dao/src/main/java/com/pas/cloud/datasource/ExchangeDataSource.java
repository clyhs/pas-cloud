package com.pas.cloud.datasource;

import java.lang.reflect.Method;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import com.pas.cloud.anno.PasDataSource;
import com.pas.cloud.util.DataSourceHolder;


/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:00:00
 */
@Component
public class ExchangeDataSource implements MethodBeforeAdvice,
		AfterReturningAdvice {
	
	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	public void afterReturning(Object returnValue, Method method, Object[] args,
			Object target) throws Throwable {
		// TODO Auto-generated method stub
		DataSourceHolder.clearDataSource();

	}

	public void before(Method method, Object[] args, Object target)
			throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("**************aop start**************");
		System.out.println(method.getName());
		
		
		
        System.out.println("---------------------------");
			
	    System.out.println(target.getClass().getName());
			
		String dataSourceName= "dataSource_1";
		
		//target.getClass();
			
		System.out.println("--------------"+dataSourceName+"-------------");
		DataSourceHolder.setDataSource(dataSourceName);
			
		System.out.println("------------------");
		
		
		System.out.println("*************aop end***************");

	}

}
