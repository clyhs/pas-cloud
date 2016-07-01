/**
 * 
 */
package com.pas.cloud.api.sample;

import com.pas.cloud.base.BaseService;
import com.pas.cloud.sample.bean.CapitalDto;
import com.pas.cloud.sample.bean.Order;
import com.pas.cloud.sample.bean.RedPacket;
import com.pas.cloud.sample.bean.RedPacketDto;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午1:48:48 
 */
public interface RedPacketService  extends BaseService<RedPacket> {
	

	public RedPacket getByUserId(Integer id);
}
