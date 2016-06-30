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
		capitalDao.save(t);
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
	 * @see com.pas.cloud.api.sample.CapitalService#getByUserId(long)
	 */
	public Capital getByUserId(long id) {
		// TODO Auto-generated method stub
		prepareDataSource();
		return capitalDao.getByUserId(id);
	}

	

	

	

}
