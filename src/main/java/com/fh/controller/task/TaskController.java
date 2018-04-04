package com.fh.controller.task;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.system.dictionaries.DictionariesManager;
import com.fh.service.system.fhsms.FhsmsManager;
import com.fh.service.system.project.ProjectManager;
import com.fh.service.system.projectapply.ProjectApplyManager;
import com.fh.service.system.weeklyreport.WeeklyReportManager;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 定时任务
 */
@Service
@RequestMapping(value = "/task")
public class TaskController extends BaseController {

	@Resource(name = "projectapplyService")
	private ProjectApplyManager projectapplyService;

	@Resource(name = "dictionariesService")
	private DictionariesManager dictionariesService;

	@Resource(name = "projectService")
	private ProjectManager projectService;

	@Resource(name = "fhsmsService")
	private FhsmsManager fhsmsService;
	
	@Resource(name="weeklyreportService")
	private WeeklyReportManager weeklyreportService;

	/**
	 * 定时处理周报
	 * 
	 * @throws Exception
	 *
	 * @author sunrain
	 * @date 2018年3月8日
	 */
	@Scheduled(cron = "0 6 * * * ?")
	public void statisticsReport() throws Exception {
		logBefore(logger, "统计周报，自动生成需要添加的周报列表");
		Page page = new Page();
		PageData pd = new PageData();
		page.setPd(pd);
		// 获取所有通过的正常项目列表
		List<PageData> allProjectList = projectService.listProjectReport(page); // 列出所有的有效项目列表
		System.out.println(JSON.toJSONString(allProjectList));
		if (allProjectList == null || allProjectList.size() == 0) {
			logger.info("暂无项目需要添加周报---" + getNow());
			return;
		}

		pd.put("all", 1);
		page.setPd(pd);
		List<PageData> nowProjectList = projectService.listProjectReport(page); // 列出所有的有效项目列表
		System.out.println(JSON.toJSONString(nowProjectList));
		List<PageData> addData = new ArrayList<>();
		List<String> list = new ArrayList<String>();

		if (nowProjectList == null || nowProjectList.size() == 0) {
			addData = allProjectList;
		} else {
			for (PageData data : nowProjectList) {
				list.add(data.getString("PROJECT_ID"));
			}

			int i = 0;
			for (PageData data : allProjectList) {
				if (!list.contains(data.getString("PROJECT_ID"))) {
					addData.add(i, data);
					i++;
				}
			}
		}

		// 批量插入数据
		for (PageData data : addData) {
			
			data.put("PLAN", 0);
			data.put("PROB", 0);
			data.put("STATUS", 0);
			data.put("PROBLEM", "");
			data.put("HELP", "");
			data.put("WEEKLYREPORT_ID", this.get32UUID());	//主键
			weeklyreportService.save(data);
			// 发送邮件通知
			// 注册成功 发送邮件提醒
			Map<String, String> smsmap = new HashMap<String, String>();
			smsmap.put("USERNAME", data.getString("USERNAME"));
			smsmap.put("TITLE", "添加周报提醒");
			smsmap.put("CONTENT", "您的项目【"+data.getString("PROJECT_NAME")+"】本周周报未及时反馈，请注意及时补充以免影响您的项目授权有效性，谢谢");
			logger.info("周报邮件提醒:"+JSON.toJSONString(smsmap));
			
			save(smsmap);
		}
		System.out.println(JSON.toJSONString(addData));

	}

	
	/**
	 * 发送站内信
	 * 
	 * @param
	 * @throws Exception
	 */
	public String save(Map<String, String> parameters) throws Exception {
		PageData pd = new PageData();
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
			pd.put("TYPE", "1"); // 类型2：发信
			pd.put("TO_USERNAME", "admin"); // 发信人
			pd.put("FROM_USERNAME", usernane); // 收信人
			fhsmsService.save(pd); // 存入发信
//			pd.put("FHSMS_ID", this.get32UUID()); // 主键2
//			pd.put("TYPE", "1"); // 类型1：收信
//			pd.put("TO_USERNAME", usernane); // 发信人
//			pd.put("FROM_USERNAME", "admin"); // 收信人
//			fhsmsService.save(pd);
		} catch (Exception e) {
			msg = "error";
		}

		return msg;
	}
	
	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表ProjectApply");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData> varList = projectapplyService.list(page); // 列出ProjectApply列表
		mv.setViewName("system/projectapply/projectapply_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增ProjectApply");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROJECTAPPLY_ID", this.get32UUID()); // 主键
		pd.put("CREATE_TIME", getNow());

		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER); // 读取session中的用户信息(单独用户信息)
		String USERNAME = user.getUSERNAME();
		String USER_ID = user.getUSER_ID();
		pd.put("USERNAME", USERNAME);
		pd.put("USER_ID", USER_ID);

		projectapplyService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	// @ResponseBody
	public ModelAndView edit() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改ProjectApply");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		projectapplyService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");

		// return AppUtil.returnObject(new PageData(), map);
		return mv;
	}
}
