package com.pas.cloud.api.demo;

import com.github.pagehelper.PageInfo;
import com.pas.cloud.base.BaseService;
import com.pas.cloud.demo.bean.User;

/**
 * 
 * @author chenly 
 *
 * @version createtime:2016-6-22 下午4:00:46
 */
public interface UserService extends BaseService<User>{
	
	public PageInfo<User> select(User t,int pageNum,int pageSize);

}
