package com.pas.cloud.module.intf.demo;

import com.github.pagehelper.PageInfo;
import com.pas.cloud.demo.bean.User;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午3:59:42
 */
public interface IUserBusiness {
	
	public void insert(User u);
	
	public PageInfo<User> select(User t,int pageNum,int pageSize);

}
