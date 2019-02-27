/**
 * 
 */
package com.pas.cloud.module.shiro;

/**
 * @author chenly
 * 
 * @version createtime:2016-8-31 下午2:12:19
 */
public interface ShiroManager {

	/**
	 * 加载过滤配置信息
	 * 
	 * @return
	 */
	public String loadFilterChainDefinitions();

	/**
	 * 重新构建权限过滤器 一般在修改了用户角色、用户等信息时，需要再次调用该方法
	 */
	public void reCreateFilterChains();

}
