package com.fh.controller.base;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.system.project.ProjectManager;
import com.fh.service.system.project.impl.ProjectService;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

/**
 * @author
 */
@Controller
public class BaseController {

	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;
	
	/**
	 * new PageData对象
	 * 
	 * @return
	 * @throws Exception 
	 */
	public PageData getPageData() {
		PageData pd = new PageData(this.getRequest());

		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER); // 读取session中的用户信息(单独用户信息)
		if (user != null) {
			String USERNAME = user.getUSERNAME();
			String USER_ID = user.getUSER_ID();
			String ROLE_ID = user.getROLE_ID();
//			pd.put("ROLE_ID", ROLE_ID);	
			logger.info("base:"+JSON.toJSONString(pd));
			// 注册用户  过滤掉邮件模块
			if (ROLE_ID != "" && ROLE_ID.equals("fhadminzhuche") && this.getRequest().getRequestURI().indexOf("fhsms") == -1) {
				pd.put("USERNAME", USERNAME);
				pd.put("USER_ID", USER_ID);
				if(pd.getString("TYPE") != null && !"".equals(pd.getString("TYPE"))){
					pd.put("TYPE_TEMP", pd.getString("TYPE"));
				}
				pd.put("TYPE", "2"); //用户列表中只能查type为2代表注册用户
			}
			// 区域负责人
			if(ROLE_ID != "" && ROLE_ID.equals("19666e042e6240e281d035237722fd2e")){
				// 获取区域负责人省份列表
				List<String> areaList = (List<String>) session.getAttribute(Const.SESSION_USER_AREA); 
				logger.info("区域列表"+JSON.toJSONString(areaList));
				areaList.add("1");
				pd.put("AREA", areaList);
				
				//需要过滤项目列表
				if(areaList != null && areaList.size() > 0){
					pd.put("PROJECT_CHECK", 1);
				}
				
			}
			
			
			
			
			logger.info(JSON.toJSONString(pd));

		}

		return pd;
	}

	/**
	 * 得到ModelAndView
	 * 
	 * @return
	 */
	public ModelAndView getModelAndView() {
		return new ModelAndView();
	}

	/**
	 * 得到request对象
	 * 
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		try {
			request.setCharacterEncoding("UTF-8");
			logger.info(request.getParameter("PROJECT_NAME"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return request;
	}

	/**
	 * 得到32位的uuid
	 * 
	 * @return
	 */
	public String get32UUID() {
		return UuidUtil.get32UUID();
	}

	/**
	 * 得到分页列表的信息
	 * 
	 * @return
	 */
	public Page getPage() {
		return new Page();
	}

	public static void logBefore(Logger logger, String interfaceName) {
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}

	public static void logAfter(Logger logger) {
		logger.info("end");
		logger.info("");
	}

	public static String getNow() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(d);
	}

}
