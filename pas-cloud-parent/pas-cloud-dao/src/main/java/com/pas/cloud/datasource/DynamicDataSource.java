package com.pas.cloud.datasource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import com.pas.cloud.util.DataSourceHolder;

public class DynamicDataSource extends AbstractRoutingDataSource {

	@Override
	protected Object determineCurrentLookupKey() {
		// TODO Auto-generated method stub
		return DataSourceHolder.getDataSource();
	}

}
