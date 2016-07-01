/**
 * 
 */
package com.pas.cloud.sample.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.pas.cloud.sample.bean.Capital;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.sample.bean.RedPacket;
import com.pas.cloud.sample.bean.RedPacketDto;
import com.pas.cloud.sample.mapper.RedPacketMapper;
import com.pas.cloud.transaction.Compensable;
import com.pas.cloud.transaction.api.TransactionContext;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午2:19:10 
 */
@Repository
public class RedPacketDao {

	@Autowired
	private RedPacketMapper redPacketMapper;
	
	public RedPacket getByUserId(Integer userId){
		return redPacketMapper.getByUserId(userId);
	}
	
	public void save(RedPacket redPacket){
		redPacketMapper.update(redPacket);
	}
	
	@Compensable(confirmMethod = "confirmRecord", cancelMethod = "cancelRecord")
	public void record(TransactionContext transactionContext, RedPacketDto redPacketDto){
		System.out.println("capital try record called");
		RedPacket redPacket = redPacketMapper.getByUserId(redPacketDto.getSelfUserId());
		redPacket.transferFrom(redPacketDto.getAmount()) ;
		redPacketMapper.update(redPacket);
	}
	
	public void confirmRecord(TransactionContext transactionContext, RedPacketDto redPacketDto) {
        System.out.println("capital confirm record called");

        RedPacket redPacket = redPacketMapper.getByUserId(redPacketDto.getOppositeUserId());

        redPacket.transferTo(redPacketDto.getAmount());

        redPacketMapper.update(redPacket);
    }

    public void cancelRecord(TransactionContext transactionContext, RedPacketDto redPacketDto) {
        System.out.println("capital cancel record called");

        RedPacket redPacket = redPacketMapper.getByUserId(redPacketDto.getSelfUserId());

        redPacket.cancelTransfer(redPacketDto.getAmount());

        redPacketMapper.update(redPacket);
    }
}
