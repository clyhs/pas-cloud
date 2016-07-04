/**
 * 
 */
package com.pas.cloud.service.sample;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.api.sample.CapitalService;
import com.pas.cloud.sample.bean.Capital;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.sample.dao.CapitalDao;
import com.pas.cloud.transaction.Compensable;
import com.pas.cloud.transaction.api.TransactionContext;

/**
 * @author chenly 
 *
 * @version createtime:2016-7-4 上午11:49:53 
 */
@Service(version="1.0.0")
public class CapitalServiceImpl implements CapitalService {
	
	private static Logger log = Logger.getLogger(CapitalServiceImpl.class);
	
	@Autowired
	private CapitalDao capitalDao;

	/* (non-Javadoc)
	 * @see com.pas.cloud.api.sample.CapitalService#record(org.apache.commons.dbcp.managed.TransactionContext, com.pas.cloud.sample.bean.CapitalDto)
	 */
	@Compensable(confirmMethod = "confirmRecord", cancelMethod = "cancelRecord")
	public void record(TransactionContext transactionContext, CapitalDto capitalDto){
		System.out.println("capital try record called");
		log.info("***************CapitalDao record*****************");
		log.info("***************Capital getByUserId*****************");
		Capital capital = capitalDao.getByUserId(capitalDto.getSelfUserId());
		log.info("***************Capital getByUserId end*****************");
		
		capital.transferFrom(capitalDto.getAmount()) ;
		log.info("***************Capital capitalMapper update *****************");
		capitalDao.save(capital);
		log.info("***************Capital capitalMapper update end*****************");
	}
	
	public void confirmRecord(TransactionContext transactionContext, CapitalDto capitalDto) {
        System.out.println("capital confirm record called");

        log.info("***************confirmRecord record*****************");
        Capital capital = capitalDao.getByUserId(capitalDto.getOppositeUserId());

        capital.transferTo(capitalDto.getAmount());

        capitalDao.save(capital);
    }

    public void cancelRecord(TransactionContext transactionContext, CapitalDto capitalDto) {
        System.out.println("capital cancel record called");

        log.info("***************cancelRecord record*****************");
        Capital capital = capitalDao.getByUserId(capitalDto.getSelfUserId());

        capital.cancelTransfer(capitalDto.getAmount());

        capitalDao.save(capital);
    }

}
