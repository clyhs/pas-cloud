/**
 * 
 */
package com.pas.cloud.api.sample;



import com.pas.cloud.base.BaseService;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.RedPacket;
import com.pas.cloud.sample.bean.RedPacketDto;
import com.pas.cloud.transaction.api.TransactionContext;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午1:48:48 
 */
public interface RedPacketService   {
	

	public void record(TransactionContext transactionContext,RedPacketDto redPacketDto);
	
	public void confirmRecord(TransactionContext transactionContext, RedPacketDto redPacketDto);
	
	public void cancelRecord(TransactionContext transactionContext, RedPacketDto redPacketDto); 

}
