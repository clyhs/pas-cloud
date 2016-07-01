/**
 * 
 */
package com.pas.cloud.sample.mapper;

import com.pas.cloud.base.BaseMapper;
import com.pas.cloud.sample.bean.RedPacket;

/**
 * @author chenly 
 *
 * @version createtime:2016-6-30 下午2:09:37 
 */
public interface RedPacketMapper extends BaseMapper<RedPacket> {

	public RedPacket getByUserId(Integer id);
}
