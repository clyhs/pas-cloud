/**
 * 
 */
package com.pas.cloud.api.sample;

import com.pas.cloud.base.BaseService;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.sample.bean.Capital;
import com.pas.cloud.sample.bean.CapitalDto;


/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午1:46:30 
 */
public interface CapitalService extends BaseService<Capital> {
	

	public Capital getByUserId(Integer id);
}
