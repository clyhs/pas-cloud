/**
 * 
 */
package com.pas.cloud.service.sample;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.config.annotation.Service;
import com.pas.cloud.api.sample.RedPacketService;
import com.pas.cloud.base.BaseServiceSupport;
import com.pas.cloud.sample.bean.Capital;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.sample.bean.RedPacket;
import com.pas.cloud.sample.bean.RedPacketDto;
import com.pas.cloud.sample.dao.RedPacketDao;
import com.pas.cloud.transaction.api.TransactionContext;
import com.pas.cloud.util.DataSourceHolder;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午3:06:01 
 */
@Service(version="1.0.0")
public class RedPacketServiceImpl extends BaseServiceSupport<RedPacket>
		implements RedPacketService {


	@Autowired
	private RedPacketDao redPacketDao;



	/* (non-Javadoc)
	 * @see com.pas.cloud.base.BaseServiceSupport#add(java.lang.Object)
	 */
	@Override
	public void add(RedPacket t) {
		// TODO Auto-generated method stub
		redPacketDao.save(t);
	}

	/* (non-Javadoc)
	 * @see com.pas.cloud.base.BaseServiceSupport#findById(java.lang.Integer)
	 */
	@Override
	public RedPacket findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.pas.cloud.api.sample.RedPacketService#getByUserId(long)
	 */
	public RedPacket getByUserId(Integer id) {
		// TODO Auto-generated method stub
		prepareDataSource();
		return redPacketDao.getByUserId(id);
	}

}
