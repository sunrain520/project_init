package com.fh.controller.base;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.system.fhsms.FhsmsManager;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

/**
 * @author
 */
public class BaseEmailController extends BaseController {

	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;
	
	@Resource(name = "fhsmsService")
	private FhsmsManager fhsmsService;

	/**
	 * 发送站内信
	 * 
	 * 
	 *  Map<String, String> smsmap = new HashMap<String, String>();
		smsmap.put("USERNAME", pd.getString("USERNAME"));
		smsmap.put("TITLE", "用户注册");
		smsmap.put("CONTENT", "收到【"+pd.getString("COMPANY_NAME")+"】的供应商注册申请，请及时处理并安排好对接人");
		save(smsmap);
	 * @param
	 * @throws Exception
	 */
	public String save(Map<String, String> parameters) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		String msg = "ok"; // 发送状态
		String usernane = parameters.get("USERNAME"); // 对方用户名
		String title = parameters.get("TITLE"); // 对方用户名
		try {
			pd.put("STATUS", "2"); // 状态
			pd.put("CONTENT", parameters.get("CONTENT")); // 状态
			pd.put("TITLE", title); // 状态
			pd.put("SANME_ID", this.get32UUID()); // 共同ID
			pd.put("SEND_TIME", DateUtil.getTime()); // 发送时间
			pd.put("FHSMS_ID", this.get32UUID()); // 主键1
			pd.put("TYPE", "2"); // 类型2：发信
			pd.put("TO_USERNAME", usernane); // 发信人
			pd.put("FROM_USERNAME", "admin"); // 收信人
			fhsmsService.save(pd); // 存入发信
			pd.put("FHSMS_ID", this.get32UUID()); // 主键2
			pd.put("TYPE", "1"); // 类型1：收信
			pd.put("TO_USERNAME", usernane); // 发信人
			pd.put("FROM_USERNAME", "admin"); // 收信人
			fhsmsService.save(pd);
		} catch (Exception e) {
			msg = "error";
		}

		return msg;
	}
}
