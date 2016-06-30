/**
 * 
 */
package com.pas.cloud.service.sample;


import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.api.sample.CapitalService;
import com.pas.cloud.base.BaseServiceSupport;
import com.pas.cloud.sample.bean.Capital;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.sample.dao.CapitalDao;
import com.pas.cloud.transaction.Compensable;
import com.pas.cloud.transaction.api.TransactionContext;
import com.pas.cloud.util.DataSourceHolder;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午2:36:24 
 */
@Service(version="1.0.0")
public class CapitalServiceImpl extends BaseServiceSupport<Capital> implements
		CapitalService {

	@Autowired
	private CapitalDao capitalDao;

	/* (non-Javadoc)
	 * @see com.pas.cloud.base.BaseServiceSupport#add(java.lang.Object)
	 */
	@Override
	public void add(Capital t) {
		// TODO Auto-generated method stub
		
	}

	/* (non-Javadoc)
	 * @see com.pas.cloud.base.BaseServiceSupport#findById(java.lang.Integer)
	 */
	@Override
	public Capital findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.pas.cloud.base.BaseServiceSupport#record(com.pas.cloud.transaction.api.TransactionContext, com.pas.cloud.sample.bean.CapitalDto)
	 */
	@Compensable(confirmMethod = "confirmRecord",cancelMethod = "cancelRecord")
	public void record(TransactionContext transactionContext, CapitalDto t) {
		// TODO Auto-generated method stub
		System.out.println("capital try record called");
		Capital capital = capitalDao.getByUserId(t.getSelfUserId());
		capital.transferFrom(t.getAmount());
		capitalDao.save(capital);
	}
	
	public void confirmRecord(TransactionContext transactionContext, CapitalDto t) {
        System.out.println("capital confirm record called");

        Capital capital = capitalDao.getByUserId(t.getOppositeUserId());

        capital.transferTo(t.getAmount());

        capitalDao.save(capital);
    }

    public void cancelRecord(TransactionContext transactionContext, CapitalDto t) {
        System.out.println("capital cancel record called");

        Capital capital = capitalDao.getByUserId(t.getSelfUserId());

        capital.cancelTransfer(t.getAmount());

        capitalDao.save(capital);
    }

	/* (non-Javadoc)
	 * @see com.pas.cloud.api.sample.CapitalService#record(com.pas.cloud.sample.bean.CapitalDto)
	 */
	public void record(CapitalDto capitalDto) {
		// TODO Auto-generated method stub
		DataSourceHolder.setDataSource(dataSource);
		record(null,capitalDto);
	}

	

	

}
