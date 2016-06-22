package com.pas.cloud.base;

import java.util.List;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:00:00
 */
public interface BaseMapper<T> {

	public List<T> getAll();
	
	public void delete(Integer id);
	
	public void update(T t);
	
	public T    getById(Integer id);
	
	public void insert(T t);
}
