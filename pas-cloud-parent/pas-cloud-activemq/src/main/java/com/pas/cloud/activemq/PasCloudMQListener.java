/**
 * 
 */
package com.pas.cloud.activemq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

/**
 * @author chenly
 * 
 * @version createtime:2016-7-4 下午3:18:06
 */
public class PasCloudMQListener implements MessageListener {

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.jms.MessageListener#onMessage(javax.jms.Message)
	 */
	public void onMessage(Message message) {
		// TODO Auto-generated method stub
		TextMessage textMsg = (TextMessage) message;
		try {
			System.out.println("消息内容是：" + textMsg.getText());
			//textMsg.acknowledge();
		} catch (JMSException e) {
			e.printStackTrace();
		}

	}

}
