package com.pas.cloud.base;

import com.pas.cloud.demo.bean.User;

public interface BaseService<T> {
	
	public void changeDataSource(String dataSource);
	
	public void insert(T t);
	
	public T getById(Integer id);

}
