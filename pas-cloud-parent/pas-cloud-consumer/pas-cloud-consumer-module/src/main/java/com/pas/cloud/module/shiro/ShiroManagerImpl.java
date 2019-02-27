/**
 * 
 */
package com.pas.cloud.module.shiro;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author chenly
 * 
 * @version createtime:2016-8-31 下午2:13:01
 */
public class ShiroManagerImpl implements ShiroManager {

	private static final Logger log = LoggerFactory
			.getLogger(ShiroManagerImpl.class);

	private static final String CRLF = "\r\n";

	@Resource
	private ShiroFilterFactoryBean shiroFilterFactoryBean;

	

	private String getFixedAuthRule() {
		StringBuffer sb = new StringBuffer();
		
		sb.append("/login.html = anon").append(CRLF);
		sb.append("/logout.html= logout").append(CRLF);
		sb.append("/module/demo/index.json=authc,perms[demo:index]").append(CRLF);
		sb.append("/module/** = authc").append(CRLF);
		

		List<String> urls = new ArrayList<String>();
		
		log.info(sb.toString());
		return sb.toString();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.pas.cloud.module.shiro.ShiroManager#loadFilterChainDefinitions()
	 */
	@Override
	public String loadFilterChainDefinitions() {
		// TODO Auto-generated method stub
		return getFixedAuthRule();
	}

	/*增加系统菜单时，这个方法可以重新刷新权限配置
	 * (non-Javadoc)
	 * 
	 * @see com.pas.cloud.module.shiro.ShiroManager#reCreateFilterChains()
	 */
	@Override
	public synchronized void reCreateFilterChains() {
		// TODO Auto-generated method stub

		AbstractShiroFilter shiroFilter = null;
		try {
			shiroFilter = (AbstractShiroFilter) shiroFilterFactoryBean
					.getObject();
		} catch (Exception e) {
			log.error("getShiroFilter from shiroFilterFactoryBean error!", e);
			throw new RuntimeException(
					"get ShiroFilter from shiroFilterFactoryBean error!");
		}

		PathMatchingFilterChainResolver filterChainResolver = (PathMatchingFilterChainResolver) shiroFilter
				.getFilterChainResolver();
		DefaultFilterChainManager manager = (DefaultFilterChainManager) filterChainResolver
				.getFilterChainManager();
		// 清空老的权限控制
		manager.getFilterChains().clear();

		shiroFilterFactoryBean.getFilterChainDefinitionMap().clear();
		shiroFilterFactoryBean
				.setFilterChainDefinitions(loadFilterChainDefinitions());

		// 重新构建生成
		Map<String, String> chains = shiroFilterFactoryBean
				.getFilterChainDefinitionMap();
		for (Map.Entry<String, String> entry : chains.entrySet()) {
			String url = entry.getKey();
			String chainDefinition = entry.getValue().trim().replace(" ", "");
			manager.createChain(url, chainDefinition);
		}
		

	}

	public void setShiroFilterFactoryBean(
			ShiroFilterFactoryBean shiroFilterFactoryBean) {
		this.shiroFilterFactoryBean = shiroFilterFactoryBean;
	}
	
	
	
	
	
	

}
