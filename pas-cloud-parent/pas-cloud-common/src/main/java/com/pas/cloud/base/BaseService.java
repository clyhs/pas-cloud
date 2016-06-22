package com.pas.cloud.base;

import com.pas.cloud.demo.bean.User;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:00:00
 */
public interface BaseService<T> {
	
	public void changeDataSource(String dataSource);
	
	public void insert(T t);
	
	public T getById(Integer id);

}
