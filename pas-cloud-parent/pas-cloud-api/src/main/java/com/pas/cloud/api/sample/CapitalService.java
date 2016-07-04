/**
 * 
 */
package com.pas.cloud.api.sample;



import com.pas.cloud.base.BaseService;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.sample.bean.Capital;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.transaction.api.TransactionContext;


/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午1:46:30 
 */
public interface CapitalService{
	

	public void record(TransactionContext transactionContext,CapitalDto capitalDto);
	
	public void confirmRecord(TransactionContext transactionContext, CapitalDto capitalDto);
	
	public void cancelRecord(TransactionContext transactionContext, CapitalDto capitalDto) ;

}
