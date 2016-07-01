/**
 * 
 */
package com.pas.cloud.sample.dao;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.pas.cloud.sample.bean.Capital;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.sample.mapper.CapitalMapper;
import com.pas.cloud.transaction.Compensable;
import com.pas.cloud.transaction.api.TransactionContext;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午2:18:36 
 */
@Repository
public class CapitalDao {
	
	private static Logger log = Logger.getLogger(CapitalDao.class);
	
	@Autowired
	private CapitalMapper capitalMapper;
	
	public Capital getByUserId(Integer userId){
		return capitalMapper.getByUserId(userId);
	}
	
	public void save(Capital capital){
		capitalMapper.update(capital);
	} 
	
	@Compensable(confirmMethod = "confirmRecord", cancelMethod = "cancelRecord")
	public void record(TransactionContext transactionContext, CapitalDto capitalDto){
		System.out.println("capital try record called");
		log.info("***************CapitalDao record*****************");
		log.info("***************Capital getByUserId*****************");
		Capital capital = capitalMapper.getByUserId(capitalDto.getSelfUserId());
		log.info("***************Capital getByUserId end*****************");
		
		capital.transferFrom(capitalDto.getAmount()) ;
		log.info("***************Capital capitalMapper update *****************");
		capitalMapper.update(capital);
		log.info("***************Capital capitalMapper update end*****************");
	}
	
	public void confirmRecord(TransactionContext transactionContext, CapitalDto capitalDto) {
        System.out.println("capital confirm record called");

        log.info("***************confirmRecord record*****************");
        Capital capital = capitalMapper.getByUserId(capitalDto.getOppositeUserId());

        capital.transferTo(capitalDto.getAmount());

        capitalMapper.update(capital);
    }

    public void cancelRecord(TransactionContext transactionContext, CapitalDto capitalDto) {
        System.out.println("capital cancel record called");

        log.info("***************cancelRecord record*****************");
        Capital capital = capitalMapper.getByUserId(capitalDto.getSelfUserId());

        capital.cancelTransfer(capitalDto.getAmount());

        capitalMapper.update(capital);
    }
	

}
