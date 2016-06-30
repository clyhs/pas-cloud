/**
 * 
 */
package com.pas.cloud.sample.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pas.cloud.sample.bean.RedPacket;
import com.pas.cloud.sample.mapper.RedPacketMapper;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午2:19:10 
 */
@Service
public class RedPacketDao {

	@Autowired
	private RedPacketMapper redPacketMapper;
	
	public RedPacket getByUserId(long userId){
		return redPacketMapper.getByUserId(userId);
	}
	
	public void save(RedPacket redPacket){
		redPacketMapper.update(redPacket);
	}
}
