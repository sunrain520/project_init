package com.fh.controller.system.project;

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
import javax.servlet.http.HttpServletResponse;

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
import com.fh.entity.system.Role;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.FileDownload;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.system.dictionaries.DictionariesManager;
import com.fh.service.system.project.ProjectManager;

/**
 * 说明：项目管理 创建人：kuang 767375210 创建时间：2018-02-26
 */
@Controller
@RequestMapping(value = "/project")
public class ProjectController extends BaseController {

	String menuUrl = "project/list.do"; // 菜单地址(权限用)
	@Resource(name = "projectService")
	private ProjectManager projectService;

	@Resource(name = "dictionariesService")
	private DictionariesManager dictionariesService;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	@ResponseBody
	public Object save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增Project");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROJECT_ID", this.get32UUID()); // 主键

		pd.put("CREATE_TIME", getNow());
		Session session = Jurisdiction.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER); // 读取session中的用户信息(单独用户信息)
		String USERNAME = user.getUSERNAME();
		String USER_ID = user.getUSER_ID();
		pd.put("USERNAME", USERNAME);
		pd.put("USER_ID", USER_ID);

		// pd.put("PROJECT_NAME", ""); //项目名称
		logger.info(JSON.toJSONString(pd));
		projectService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("code", 200);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除Project");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		projectService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/uploadPurchaseOrder")
	public void uploadPurchaseOrder(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除Project");
		PageData pd = new PageData();
		pd = this.getPageData();
		projectService.uploadPurchaseOrder(pd);
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
	@ResponseBody
	public Object edit() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改Project");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		projectService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("code", 200);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表Project");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		logger.info("project_list" + JSON.toJSONString(pd));
		
		page.setPd(pd);
		
		List<PageData> varList = projectService.list(page); // 列出Project列表
		mv.setViewName("system/project/project_list");
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

		mv.setViewName("system/project/project_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAddProject")
	public ModelAndView goAddProject() throws Exception {
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
		mv.addObject("modelList", pdList);

		mv.setViewName("system/project/project_add");
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
	@RequestMapping(value = "/goEditProject")
	public ModelAndView goEditProject() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = projectService.findById(pd); // 根据ID读取
		List<String> tempList = new ArrayList<>();
		String MODEL_IDS = pd.getString("MODEL_ID");
		if (Tools.notEmpty(MODEL_IDS)) {
			String arryMODEL_ID[] = MODEL_IDS.split(",fh,");
			tempList = Arrays.asList(arryMODEL_ID);
		}

		String DICTIONARIES_ID = "1688305536294dea863fa5ae88ebbfa0";
		List<Dictionaries> varList = dictionariesService.listSubDictByParentId(DICTIONARIES_ID); // 用传过来的ID获取此ID下的子列表数据
		List<PageData> pdList = new ArrayList<PageData>();
		for (Dictionaries d : varList) {
			PageData pdf = new PageData();
			pdf.put("DICTIONARIES_ID", d.getDICTIONARIES_ID());
			pdf.put("NAME", d.getNAME());

			if (tempList.contains(d.getDICTIONARIES_ID())) {
				pdf.put("RIGHTS", 1);
			}
			pdList.add(pdf);
		}

		mv.addObject("modelList", pdList);

		mv.setViewName("system/project/project_add");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去查看页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goViewProject")
	public ModelAndView goViewProject() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = projectService.findById(pd); // 根据ID读取
		List<String> tempList = new ArrayList<>();
		String MODEL_IDS = pd.getString("MODEL_ID");
		if (Tools.notEmpty(MODEL_IDS)) {
			String arryMODEL_ID[] = MODEL_IDS.split(",fh,");
			tempList = Arrays.asList(arryMODEL_ID);
		}

		String DICTIONARIES_ID = "1688305536294dea863fa5ae88ebbfa0";
		List<Dictionaries> varList = dictionariesService.listSubDictByParentId(DICTIONARIES_ID); // 用传过来的ID获取此ID下的子列表数据
		List<PageData> pdList = new ArrayList<PageData>();
		for (Dictionaries d : varList) {
			PageData pdf = new PageData();
			pdf.put("DICTIONARIES_ID", d.getDICTIONARIES_ID());
			pdf.put("NAME", d.getNAME());

			if (tempList.contains(d.getDICTIONARIES_ID())) {
				pdf.put("RIGHTS", 1);
			}
			pdList.add(pdf);
		}

		mv.addObject("modelList", pdList);

		mv.setViewName("system/project/project_add");
		mv.addObject("msg", "view");
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
		pd = projectService.findById(pd); // 根据ID读取
		mv.setViewName("system/project/project_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去查看页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goView")
	public ModelAndView goView() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = projectService.findById(pd); // 根据ID读取
		mv.setViewName("system/project/project_view");
		mv.addObject("msg", "view");
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
		logBefore(logger, Jurisdiction.getUsername() + "批量删除Project");
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
			projectService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername() + "导出Project到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("项目名称"); // 1
		titles.add("项目简介"); // 2
		titles.add("最终客户"); // 3
		titles.add("省份ID"); // 4
		titles.add("省份"); // 5
		titles.add("区域ID"); // 6
		titles.add("区域名称"); // 7
		titles.add("行业ID"); // 8
		titles.add("行业名称"); // 9
		titles.add("项目状态"); // 10
		titles.add("项目预算"); // 11
		titles.add("竞争对手"); // 12
		titles.add("预计投标时间"); // 13
		titles.add("预计使用设备型号ID"); // 14
		titles.add("预计使用设备型号"); // 15
		titles.add("数量"); // 16
		titles.add("项目负责人姓名"); // 17
		titles.add("手机"); // 18
		titles.add("备注"); // 19
		titles.add("报备时间"); // 20
		dataMap.put("titles", titles);
		List<PageData> varOList = projectService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("PROJECT_NAME")); // 1
			vpd.put("var2", varOList.get(i).getString("DETAILS")); // 2
			vpd.put("var3", varOList.get(i).getString("CLIENT")); // 3
			vpd.put("var4", varOList.get(i).getString("PROVINCE_ID")); // 4
			vpd.put("var5", varOList.get(i).getString("PROVINCE_NAME")); // 5
			vpd.put("var6", varOList.get(i).getString("AREA_ID")); // 6
			vpd.put("var7", varOList.get(i).getString("AREA_NAME")); // 7
			vpd.put("var8", varOList.get(i).getString("BUSINESS_ID")); // 8
			vpd.put("var9", varOList.get(i).getString("BUSINESS_NAME")); // 9
			vpd.put("var10", varOList.get(i).getString("PROJECT_TYPE")); // 10
			vpd.put("var11", varOList.get(i).getString("BUDGET")); // 11
			vpd.put("var12", varOList.get(i).getString("OPPONENT")); // 12
			vpd.put("var13", varOList.get(i).getString("BID_TIME")); // 13
			vpd.put("var14", varOList.get(i).getString("MODEL_ID")); // 14
			vpd.put("var15", varOList.get(i).getString("MODEL_NAME")); // 15
			vpd.put("var16", varOList.get(i).get("BID_NUM").toString()); // 16
			vpd.put("var17", varOList.get(i).getString("LEADER_NAME")); // 17
			vpd.put("var18", varOList.get(i).getString("LEADER_PHONE")); // 18
			vpd.put("var19", varOList.get(i).getString("BZ")); // 19
			vpd.put("var20", varOList.get(i).getString("CREATE_TIME")); // 20
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
			if (projectService.findByName(pd) != null) {
				errInfo = "error";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo); // 返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/project/uploadexcel");
		mv.addObject("msg", "view");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "设备采购单模版.xls", "设备采购单模版.xls");
	}
	
	/**
	 * 获取权限下的项目列表
	 * @param pd
	 * @return
	 */
	public PageData getProjectCheckList(PageData pd){
		if(pd.get("PROJECT_CHECK") == null){
			return pd;
		}
		
		//获取区域负责人的项目列表
		List<String> projectList = new ArrayList<String>();
		List<PageData> varList;
		try {
			Page page = new Page();
			page.setPd(pd);
			varList = projectService.listProject(page);
			System.out.println("项目"+JSON.toJSONString(varList));
			if (varList != null && varList.size() > 0) {
				for (PageData data : varList) {
					projectList.add(data.getString("PROJECT_ID"));
				}
			}else{
				projectList.add("1");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 列出Principal列表
		logger.info("过滤项目id列表"+JSON.toJSONString(projectList));
		pd.put("PROJECT_LIST", projectList);
		
		return pd;
	}
}
