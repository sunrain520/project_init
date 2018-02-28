package com.fh.controller.system.projectapply;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.Dictionaries;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.system.dictionaries.DictionariesManager;
import com.fh.service.system.project.ProjectManager;
import com.fh.service.system.projectapply.ProjectApplyManager;

/**
 * 说明：项目授权申请 创建人：kuang 767375210 创建时间：2018-02-28
 */
@Controller
@RequestMapping(value = "/projectapply")
public class ProjectApplyController extends BaseController {

	String menuUrl = "projectapply/list.do"; // 菜单地址(权限用)
	@Resource(name = "projectapplyService")
	private ProjectApplyManager projectapplyService;

	@Resource(name = "dictionariesService")
	private DictionariesManager dictionariesService;
	
	@Resource(name="projectService")
	private ProjectManager projectService;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增ProjectApply");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
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
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除ProjectApply");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		projectapplyService.delete(pd);
		out.write("success");
		out.close();
	}

	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
//	@ResponseBody
	public ModelAndView edit() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改ProjectApply");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		projectapplyService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		
//		return AppUtil.returnObject(new PageData(), map);
		return mv;
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
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		String DICTIONARIES_ID = "1688305536294dea863fa5ae88ebbfa0";
		List<Dictionaries> varList = dictionariesService.listSubDictByParentId(DICTIONARIES_ID); // 用传过来的ID获取此ID下的子列表数据
		List<PageData> pdList = new ArrayList<PageData>();
		for (Dictionaries d : varList) {
			PageData pdf = new PageData();
			pdf.put("DICTIONARIES_ID", d.getDICTIONARIES_ID());
			pdf.put("NAME", d.getNAME());
			pdList.add(pdf);
		}
		mv.addObject("fileList", pdList);
		
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER); // 读取session中的用户信息(单独用户信息)
		String USER_ID = user.getUSER_ID();
		pd.put("USER_ID", USER_ID);
		Page page = new Page();
		page.setPd(pd);
		List<PageData>	projectList = projectService.listProject(page);	//列出Project列表
		mv.addObject("projectList",projectList);
		logger.info(JSON.toJSONString(projectList));
		
		mv.setViewName("system/projectapply/projectapply_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = projectapplyService.findById(pd); // 根据ID读取
		
		List<String> tempList  = new ArrayList<>();
		String FILE_TYPE = pd.getString("FILE_TYPE");
		if(Tools.notEmpty(FILE_TYPE)){
			String arryFILE_TYPE[] = FILE_TYPE.split(",fh,");
			tempList = Arrays.asList(arryFILE_TYPE); 
		}

		String DICTIONARIES_ID = "1688305536294dea863fa5ae88ebbfa0";
		List<Dictionaries> varList = dictionariesService.listSubDictByParentId(DICTIONARIES_ID); // 用传过来的ID获取此ID下的子列表数据
		List<PageData> pdList = new ArrayList<PageData>();
		for (Dictionaries d : varList) {
			PageData pdf = new PageData();
			pdf.put("DICTIONARIES_ID", d.getDICTIONARIES_ID());
			pdf.put("NAME", d.getNAME());
			if(tempList.contains(d.getDICTIONARIES_ID())){
				pdf.put("RIGHTS", 1);
			}
			pdList.add(pdf);
		}
		mv.addObject("fileList", pdList);
		
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER); // 读取session中的用户信息(单独用户信息)
		String USER_ID = user.getUSER_ID();
		pd.put("USER_ID", USER_ID);
		Page page = new Page();
		page.setPd(pd);
		List<PageData>	projectList = projectService.listProject(page);	//列出Project列表
		mv.addObject("projectList",projectList);
		logger.info(JSON.toJSONString(projectList));
		
		mv.setViewName("system/projectapply/projectapply_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 批量删除
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "批量删除ProjectApply");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			projectapplyService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 导出到excel
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "导出ProjectApply到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("用户ID"); // 1
		titles.add("申请人"); // 2
		titles.add("申请文件类型"); // 3
		titles.add("项目名称"); // 4
		titles.add("项目ID"); // 5
		titles.add("申请数量"); // 6
		titles.add("邮寄联系人姓名"); // 7
		titles.add("邮寄联系人电话"); // 8
		titles.add("邮寄地址"); // 9
		titles.add("招标文件"); // 10
		titles.add("申请时间"); // 11
		titles.add("授权状态"); // 12
		dataMap.put("titles", titles);
		List<PageData> varOList = projectapplyService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("USER_ID")); // 1
			vpd.put("var2", varOList.get(i).getString("USERNAME")); // 2
			vpd.put("var3", varOList.get(i).getString("FILE_TYPE")); // 3
			vpd.put("var4", varOList.get(i).getString("PROJECT_NAME")); // 4
			vpd.put("var5", varOList.get(i).getString("PROJECT_ID")); // 5
			vpd.put("var6", varOList.get(i).get("NUM").toString()); // 6
			vpd.put("var7", varOList.get(i).getString("NAME")); // 7
			vpd.put("var8", varOList.get(i).getString("PHONE")); // 8
			vpd.put("var9", varOList.get(i).getString("ADDR")); // 9
			vpd.put("var10", varOList.get(i).getString("BID_DOCUMENT")); // 10
			vpd.put("var11", varOList.get(i).getString("CREATE_TIME")); // 11
			vpd.put("var12", varOList.get(i).getString("STATUS")); // 12
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv, dataMap);
		return mv;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}

	/**
	 * 判断用户名是否存在
	 * 
	 * @return
	 */
	@RequestMapping(value = "/hasU")
	@ResponseBody
	public Object hasU() {
		Map<String, String> map = new HashMap<String, String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			if (projectapplyService.findByName(pd) != null) {
				errInfo = "error";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo); // 返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
}
