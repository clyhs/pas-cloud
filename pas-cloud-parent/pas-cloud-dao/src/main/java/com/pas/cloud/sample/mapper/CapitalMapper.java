/**
 * 
 */
package com.pas.cloud.sample.mapper;

import com.pas.cloud.base.BaseMapper;
import com.pas.cloud.sample.bean.Capital;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午2:08:31 
 */
public interface CapitalMapper extends BaseMapper<Capital> {
	
	public Capital getByUserId(Integer id);

}
