/**
 * 
 */
package com.pas.cloud.api.sample;

import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.transaction.api.TransactionContext;


/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午1:46:30 
 */
public interface CapitalService {
	
	public void changeDataSource(String dataSource);

	
	public void record(CapitalDto capitalDto);
}
