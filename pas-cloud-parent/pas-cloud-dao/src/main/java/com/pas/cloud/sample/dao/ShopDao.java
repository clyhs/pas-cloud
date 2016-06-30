/**
 * 
 */
package com.pas.cloud.sample.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pas.cloud.sample.bean.Shop;
import com.pas.cloud.sample.mapper.ShopMapper;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午4:39:23 
 */
@Repository
public class ShopDao {
	
	@Autowired
	private ShopMapper shopMapper;
	
	public Shop getById(Integer id) {

        return shopMapper.getById(id);
    }

}
