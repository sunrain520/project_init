package com.fh.controller.app.sysuser;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.fh.controller.base.BaseEmailController;
import com.fh.service.system.company.CompanyManager;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.Tools;

/**
 * @author FH Q313596790 系统用户-接口类 相关参数协议： 00 请求失败 01 请求成功 02 返回空值 03 请求协议参数不完整
 *         04 用户名或密码错误 05 FKEY验证失败
 */
@Controller
@RequestMapping(value = "/appSysUser")
public class SysUserController extends BaseEmailController {

	@Resource(name = "userService")
	private UserManager userService;
	@Resource(name = "fhlogService")
	private FHlogManager FHLOG;
	@Resource(name = "companyService")
	private CompanyManager companyService;

	/**
	 * 系统用户注册接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "/registerSysUser")
	@ResponseBody
	public Object registerSysUser() {
		logBefore(logger, "系统用户注册接口");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try {
			if (Tools.checkKey("username", pd.getString("FKEY"))) { // 检验请求key值是否合法
				if (AppUtil.checkParam("registerSysUser", pd)) { // 检查参数

					Session session = Jurisdiction.getSession();
					String sessionCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE); // 获取session中的验证码
					String rcode = pd.getString("rcode");
					String userId = this.get32UUID();
					if (Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(rcode)) { // 判断登录验证码
						pd.put("USER_ID", userId); // ID 主键
						pd.put("ROLE_ID", "fhadminzhuche"); // 角色ID
															// fhadminzhuche
															// 为注册用户
						pd.put("NUMBER", userId); // 编号
						// pd.put("PHONE", ""); //手机号
						pd.put("BZ", "注册用户"); // 备注
						pd.put("LAST_LOGIN", ""); // 最后登录时间
						pd.put("IP", ""); // IP
						pd.put("STATUS", "0"); // 状态
						pd.put("TYPE", pd.getString("type")); // 状态
						pd.put("SKIN", "default");
						pd.put("RIGHTS", "");
						pd.put("PASSWORD",
								new SimpleHash("SHA-1", pd.getString("USERNAME"), pd.getString("PASSWORD")).toString()); // 密码加密
						logger.info("注册用户数据：" + JSON.toJSONString(pd));
						if (null == userService.findByUsername(pd)) { // 判断用户名是否存在
							userService.saveU(pd); // 执行保存
							FHLOG.save(pd.getString("USERNAME"), "新注册");

							pd.put("COMPANY_ID", userId); // 主键
							companyService.save(pd);

							// 注册成功 发送邮件提醒
							Map<String, String> smsmap = new HashMap<String, String>();
							smsmap.put("USERNAME", pd.getString("USERNAME"));
							smsmap.put("TITLE", "用户注册");
							smsmap.put("CONTENT", "收到【"+pd.getString("COMPANY_NAME")+"】的供应商注册申请，请及时处理并安排好对接人");
							save(smsmap);
							
						} else {
							result = "04"; // 用户名已存在
						}
					} else {
						result = "06"; // 验证码错误
					}
				} else {
					result = "03";
				}
			} else {
				result = "05";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 发送站内信
	 * 
	 * @param
	 * @throws Exception
	 *//*
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
	}*/
}
