/**
 * 
 */
package com.pas.cloud.service.sample;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.api.sample.RedPacketService;
import com.pas.cloud.sample.bean.RedPacket;
import com.pas.cloud.sample.bean.RedPacketDto;
import com.pas.cloud.sample.dao.RedPacketDao;
import com.pas.cloud.transaction.Compensable;
import com.pas.cloud.transaction.api.TransactionContext;

/**
 * @author chenly 
 *
 * @version createtime:2016-7-4 上午11:57:58 
 */
@Service(version="1.0.0")
public class RedPacketServiceImpl implements RedPacketService {
	
	private static Logger log = Logger.getLogger(RedPacketServiceImpl.class);
	
	@Autowired
	private RedPacketDao redPacketDao;

	
	
	@Compensable(confirmMethod = "confirmRecord", cancelMethod = "cancelRecord")
	public void record(TransactionContext transactionContext, RedPacketDto redPacketDto){
		System.out.println("capital try record called");
		log.info("***************RedPacketDao record*****************");
		log.info("***************redPacket getByUserId*****************");
		RedPacket redPacket = redPacketDao.getByUserId(redPacketDto.getSelfUserId());
		log.info("***************redPacket getByUserId end*****************");
		redPacket.transferFrom(redPacketDto.getAmount()) ;
		log.info("***************Capital redPacketMapper update *****************");
		redPacketDao.save(redPacket);
		log.info("***************Capital redPacketMapper update end*****************");
	}
	
	public void confirmRecord(TransactionContext transactionContext, RedPacketDto redPacketDto) {
        System.out.println("capital confirm record called");

        log.info("***************confirmRecord record*****************");
        RedPacket redPacket = redPacketDao.getByUserId(redPacketDto.getOppositeUserId());

        redPacket.transferTo(redPacketDto.getAmount());

        redPacketDao.save(redPacket);
    }

    public void cancelRecord(TransactionContext transactionContext, RedPacketDto redPacketDto) {
        System.out.println("capital cancel record called");

        log.info("***************cancelRecord record*****************");
        RedPacket redPacket = redPacketDao.getByUserId(redPacketDto.getSelfUserId());

        redPacket.cancelTransfer(redPacketDto.getAmount());

        redPacketDao.save(redPacket);
    }

}
