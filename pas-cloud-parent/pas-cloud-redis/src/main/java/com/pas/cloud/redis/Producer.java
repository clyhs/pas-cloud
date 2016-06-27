/**
 * 
 */
package com.pas.cloud.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-27 下午2:21:37 
 */
@Service
public class Producer {

	@Autowired
	private RedisTemplate redisTemplate;
	
	private String channel = "user:topic";
	
	public void publish(){
		redisTemplate.convertAndSend(channel, "test!");
	}
}
