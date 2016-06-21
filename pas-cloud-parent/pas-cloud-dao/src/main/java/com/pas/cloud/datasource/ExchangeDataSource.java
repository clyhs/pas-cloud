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
		if (method.isAnnotationPresent(PasDataSource.class)){
			
			System.out.println("****************************");
			
			System.out.println(method.getName());
			
			String dataSourceName= stringRedisTemplate.opsForValue().get("001");
			
			System.out.println("************"+dataSourceName+"****************");
			DataSourceHolder.setDataSource(dataSourceName);
			
			System.out.println("****************************");
			
		}

	}

}
