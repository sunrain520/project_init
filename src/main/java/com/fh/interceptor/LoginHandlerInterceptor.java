package com.fh.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
/**
 * 
* 类名称：登录过滤，权限验证
* 类描述： 
* @author kuang 767375210
* 联系方式：
 */
public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		String path = request.getServletPath();
		System.out.println(path);
		if(path.matches(Const.NO_INTERCEPTOR_PATH)){
			return true;
		}else{
			User user = (User)Jurisdiction.getSession().getAttribute(Const.SESSION_USER);
			if(user!=null){
				path = path.substring(1, path.length());
				boolean b = Jurisdiction.hasJurisdiction(path); //访问权限校验
				if(!b){
					response.sendRedirect(request.getContextPath() + Const.LOGIN);
				}
				return b;
			}else{
				//登陆过滤
				response.sendRedirect(request.getContextPath() + Const.LOGIN);
				return false;		
			}
		}
	}
	
}
