/**
 * 
 */
package com.pas.cloud.module.shiro;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import com.pas.cloud.api.demo.UserService;
import com.pas.cloud.demo.bean.User;
import com.pas.cloud.module.intf.demo.IUserBusiness;


/**
 * @author chenly
 *
 * @version createtime:2016-8-29 下午4:33:29
 */

public class CustomRealm extends AuthorizingRealm {

	private static final Logger log = LoggerFactory.getLogger(CustomRealm.class);
	
	private IUserBusiness userBusiness;
	
	

	public IUserBusiness getUserBusiness() {
		return userBusiness;
	}



	public void setUserBusiness(IUserBusiness userBusiness) {
		this.userBusiness = userBusiness;
	}



	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		log.info("授权");
		
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User)session.getAttribute("User");
		Set<String> roles = new HashSet<String>();
		Set<String> permissions = new HashSet<String>();
		permissions.add("demo:index");

		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		// 将上边查询到授权信息填充到simpleAuthorizationInfo对象中
		simpleAuthorizationInfo.setRoles(roles);
		simpleAuthorizationInfo.setStringPermissions(permissions);

		return simpleAuthorizationInfo;
	}

	

	/**
	 * 认证
	 */
	@SuppressWarnings("null")
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) {

		log.info("认证"); 
		
		UsernamePasswordToken token = (UsernamePasswordToken) auth;
		
		//User user = userBusiness.getUser(token.getUsername());
		User user = new User();
		user.setUsername(token.getUsername());
		user.setPassword("123456");
		
		SecurityUtils.getSubject().getSession().setAttribute("User", user);
		return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());
	}

	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
	
	@Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }
}
