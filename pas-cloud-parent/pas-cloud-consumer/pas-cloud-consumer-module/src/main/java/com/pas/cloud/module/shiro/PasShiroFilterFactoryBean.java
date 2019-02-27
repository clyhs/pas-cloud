/**
 * 
 */
package com.pas.cloud.module.shiro;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.FilterChainManager;
import org.apache.shiro.web.filter.mgt.FilterChainResolver;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.web.mgt.WebSecurityManager;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.beans.factory.BeanInitializationException;

/**
 * @author chenly
 * 
 * @version createtime:2016-10-10 上午11:48:38
 */
public class PasShiroFilterFactoryBean extends ShiroFilterFactoryBean {

	@Override  
    public Class getObjectType() {  
      return MySpringShiroFilter.class;  
    } 

  @Override
  protected AbstractShiroFilter createInstance() throws Exception {

      SecurityManager securityManager =  getSecurityManager();
      if (securityManager == null) {
          String msg = "SecurityManager property must be set.";
          throw new BeanInitializationException(msg);
      }

      if (!(securityManager instanceof WebSecurityManager)) {
          String msg = "The security manager does not implement the WebSecurityManager interface.";
          throw new BeanInitializationException(msg);
      }
      FilterChainManager manager = createFilterChainManager();

      PathMatchingFilterChainResolver chainResolver = new PathMatchingFilterChainResolver();
      chainResolver.setFilterChainManager(manager);

      return new MySpringShiroFilter((WebSecurityManager) securityManager, chainResolver);
  }

	private static final class MySpringShiroFilter extends AbstractShiroFilter {

		protected MySpringShiroFilter(WebSecurityManager webSecurityManager,
				FilterChainResolver resolver) {
			super();
			if (webSecurityManager == null) {
				throw new IllegalArgumentException(
						"WebSecurityManager property cannot be null.");
			}
			setSecurityManager(webSecurityManager);
			if (resolver != null) {
				setFilterChainResolver(resolver);
			}
		}

		@Override
		protected ServletResponse wrapServletResponse(HttpServletResponse orig,
				ShiroHttpServletRequest request) {
			return new PasShiroHttpResponse(orig, getServletContext(), request);
		}
	}
}
