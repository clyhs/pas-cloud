package com.pas.cloud.base.dao;

public abstract class BaseServiceSupport<T> {
	
	protected BaseServiceSupport(){
		System.out.println("*****BaseServiceSupport*****");
	}
	
	public void add(T t){
		prepare();
		insert(t);
	}
	
	public void prepare(){
		
	}
	
	abstract public void insert(T u);

}
