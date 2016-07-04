package com.pas.cloud.activemq;

import org.apache.activemq.ActiveMQSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

/**
 * 
 */

/**
 * @author chenly 
 *
 * @version createtime:2016-7-4 下午3:21:25 
 */
@Service
public class PasCloudMQProducer {
	
	@Autowired
	private JmsTemplate jmsTemplate;
	
	
	public void send(String msg){
		//jmsTemplate.setSessionAcknowledgeMode(ActiveMQSession.CLIENT_ACKNOWLEDGE);
		jmsTemplate.convertAndSend(msg);
		
	}

}
