/**
 * 
 */
package com.pas.cloud.sample.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pas.cloud.sample.bean.Capital;
import com.pas.cloud.sample.mapper.CapitalMapper;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午2:18:36 
 */
@Service
public class CapitalDao {
	
	@Autowired
	private CapitalMapper capitalMapper;
	
	public Capital getByUserId(long userId){
		return capitalMapper.getByUserId(userId);
	}
	
	public void save(Capital capital){
		capitalMapper.update(capital);
	} 

}
