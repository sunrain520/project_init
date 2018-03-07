package com.fh.controller.base;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

/**
 * @author
 */
public class BaseController {

	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;

	/**
	 * new PageData对象
	 * 
	 * @return
	 */
	public PageData getPageData() {
		PageData pd = new PageData(this.getRequest());

		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER); // 读取session中的用户信息(单独用户信息)
		logger.info("login"+"1111");
		logger.info("login"+JSON.toJSONString(user));
		if (user != null) {
			String USERNAME = user.getUSERNAME();
			String USER_ID = user.getUSER_ID();
			String ROLE_ID = user.getROLE_ID();
//			pd.put("ROLE_ID", ROLE_ID);	
			logger.info("base:"+JSON.toJSONString(pd));
			// 注册用户
			if (ROLE_ID != "" && ROLE_ID.equals("fhadminzhuche")) {
				pd.put("USERNAME", USERNAME);
				pd.put("USER_ID", USER_ID);
				pd.put("TYPE", 2);
			}
			// 区域负责人
			if(ROLE_ID != "" && ROLE_ID.equals("19666e042e6240e281d035237722fd2e")){
				// 获取区域负责人省份列表
				List<String> areaList = (List<String>) session.getAttribute(Const.SESSION_USER_AREA); 
				logger.info(JSON.toJSONString(areaList));
				pd.put("AREA", areaList);
			}

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
