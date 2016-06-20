package com.pas.cloud.api.demo;

import com.pas.cloud.demo.bean.User;

public interface UserService {
	
	public User getById(Integer userId);
	
	public void insert(User user);

}
