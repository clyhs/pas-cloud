/**
 * 
 */
package com.pas.cloud.module.shiro;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.servlet.ShiroHttpServletResponse;

/**
 * @author chenly
 * 
 * @version createtime:2016-10-10 上午11:43:55
 */
public class PasShiroHttpResponse extends ShiroHttpServletResponse {

	/**
	 * @param wrapped
	 * @param context
	 * @param request
	 */
	public PasShiroHttpResponse(HttpServletResponse wrapped,
			ServletContext context, ShiroHttpServletRequest request) {
		super(wrapped, context, request);
		// TODO Auto-generated constructor stub
	}

	@Override
	protected String toEncoded(String url, String sessionId) {
		// TODO Auto-generated method stub
		if ((url == null) || (sessionId == null))
			return (url);
		String path = url;
		String query = "";
		String anchor = "";
		int question = url.indexOf('?');
		if (question >= 0) {
			path = url.substring(0, question);
			query = url.substring(question);
		}
		int pound = path.indexOf('#');
		if (pound >= 0) {
			anchor = path.substring(pound);
			path = path.substring(0, pound);
		}
		StringBuilder sb = new StringBuilder(path);
		// 重写toEncoded方法，注释掉这几行代码就不会再生成JESSIONID了。
		// if (sb.length() > 0) { // session id param can't be first.
		// sb.append(";");
		// sb.append(DEFAULT_SESSION_ID_PARAMETER_NAME);
		// sb.append("=");
		// sb.append(sessionId);
		// }
		sb.append(anchor);
		sb.append(query);
		return sb.toString();
	}

}
