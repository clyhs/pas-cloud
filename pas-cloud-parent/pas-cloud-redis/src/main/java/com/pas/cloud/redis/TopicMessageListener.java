/**
 * 
 */
package com.pas.cloud.redis;

import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-27 下午2:26:48 
 */

public class TopicMessageListener implements MessageListener {

    private RedisTemplate redisTemplate;
    
    
	
	
	public void setRedisTemplate(RedisTemplate redisTemplate) {
		this.redisTemplate = redisTemplate;
	}




	/* (non-Javadoc)
	 * @see org.springframework.data.redis.connection.MessageListener#onMessage(org.springframework.data.redis.connection.Message, byte[])
	 */
	public void onMessage(Message message, byte[] pattern) {
		// TODO Auto-generated method stub
		byte[] body = message.getBody();//请使用valueSerializer
		byte[] channel = message.getChannel();
		//请参考配置文件，本例中key，value的序列化方式均为string。
		//其中key必须为stringSerializer。和redisTemplate.convertAndSend对应
		String itemValue = (String)redisTemplate.getValueSerializer().deserialize(body);
		String topic = (String)redisTemplate.getStringSerializer().deserialize(channel);
		System.out.println(itemValue);

	}

}
