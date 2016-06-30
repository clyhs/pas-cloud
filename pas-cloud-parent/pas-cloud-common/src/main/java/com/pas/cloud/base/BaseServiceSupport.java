package com.pas.cloud.base;

import com.pas.cloud.demo.bean.User;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.transaction.api.TransactionContext;
import com.pas.cloud.util.DataSourceHolder;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:00:00
 */
public abstract class BaseServiceSupport<T> {

	protected String dataSource;

	protected BaseServiceSupport() {
		
	}

	public void changeDataSource(String dataSource) {
		// TODO Auto-generated method stub
		this.dataSource = dataSource;
	}
	
	public void insert(T t){
		System.out.println("*****pre*****");
		prepareDataSource();
		System.out.println("*****ing*****");
		add(t);
		System.out.println("*****end*****");
	}
	
	public T getById(Integer id) {
		// TODO Auto-generated method stub
		prepareDataSource();
		return findById(id);
	}
	
	
	
	
	
	abstract public void add(T t);
	
	abstract public T findById(Integer id);
	
	
	
	
	
	private void prepareDataSource(){
		DataSourceHolder.setDataSource(dataSource);
	}
}
