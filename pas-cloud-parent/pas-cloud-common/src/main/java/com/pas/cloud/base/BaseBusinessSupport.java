package com.pas.cloud.base;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午3:59:36
 */
public abstract class BaseBusinessSupport<T> {
	
	protected String dataSource;
	
	public void insert(T t){
		changeDataSource();
		add(t);
	}
	
	abstract protected void changeDataSource();
	
	abstract public void add(T t);

}
