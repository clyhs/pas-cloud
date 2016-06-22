package com.pas.cloud.datasource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import com.pas.cloud.util.DataSourceHolder;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:01:15
 */
public class DynamicDataSource extends AbstractRoutingDataSource {

	@Override
	protected Object determineCurrentLookupKey() {
		// TODO Auto-generated method stub
		
		
		
		
		return DataSourceHolder.getDataSource();
	}

}
