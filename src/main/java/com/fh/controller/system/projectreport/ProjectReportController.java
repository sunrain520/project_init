package com.fh.controller.system.projectreport;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.system.projectreport.ProjectReportManager;

/** 
 * 说明：项目报备信息表
 * 创建人：kuang 767375210
 * 创建时间：2018-01-20
 */
@Controller
@RequestMapping(value="/projectreport")
public class ProjectReportController extends BaseController {
	
	String menuUrl = "projectreport/list.do"; //菜单地址(权限用)
	@Resource(name="projectreportService")
	private ProjectReportManager projectreportService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增ProjectReport");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROJECTREPORT_ID", this.get32UUID());	//主键
		pd.put("REPORT_TIME", "NOW()");	//报备时间
		projectreportService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除ProjectReport");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		projectreportService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ProjectReport");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		projectreportService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表ProjectReport");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = projectreportService.list(page);	//列出ProjectReport列表
		mv.setViewName("system/projectreport/projectreport_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/projectreport/projectreport_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = projectreportService.findById(pd);	//根据ID读取
		mv.setViewName("system/projectreport/projectreport_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ProjectReport");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			projectreportService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出ProjectReport到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("项目名称");	//1
		titles.add("报备时间");	//2
		titles.add("项目简介");	//3
		titles.add("最终客户");	//4
		titles.add("所在区域");	//5
		titles.add("区域名称");	//6
		titles.add("省份id");	//7
		titles.add("省份名称");	//8
		titles.add("项目所属行业");	//9
		titles.add("项目所属行业");	//10
		titles.add("当前项目状态");	//11
		titles.add("当前项目状态");	//12
		titles.add("项目预算");	//13
		titles.add("预计竞争对手");	//14
		titles.add("预计投标时间");	//15
		titles.add("预计使用设备型号");	//16
		titles.add("预计设备使用数量");	//17
		titles.add("项目负责人姓名");	//18
		titles.add("手机");	//19
		titles.add("备注");	//20
		titles.add("创建人");	//21
		titles.add("创建人名称");	//22
		dataMap.put("titles", titles);
		List<PageData> varOList = projectreportService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("PROJECT_NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("REPORT_TIME"));	    //2
			vpd.put("var3", varOList.get(i).getString("PROJECT_MSG"));	    //3
			vpd.put("var4", varOList.get(i).getString("CUSTOMER"));	    //4
			vpd.put("var5", varOList.get(i).getString("AREA_ID"));	    //5
			vpd.put("var6", varOList.get(i).getString("AREA_NAME"));	    //6
			vpd.put("var7", varOList.get(i).getString("PROVINCE_ID"));	    //7
			vpd.put("var8", varOList.get(i).getString("PROVINCE_NAME"));	    //8
			vpd.put("var9", varOList.get(i).getString("INDUSTRY_ID"));	    //9
			vpd.put("var10", varOList.get(i).getString("INDUSTRY_NAME"));	    //10
			vpd.put("var11", varOList.get(i).getString("STATUS_ID"));	    //11
			vpd.put("var12", varOList.get(i).getString("STATUS_NAME"));	    //12
			vpd.put("var13", varOList.get(i).getString("BUDGET"));	    //13
			vpd.put("var14", varOList.get(i).getString("CONTEND"));	    //14
			vpd.put("var15", varOList.get(i).getString("BID_TIME"));	    //15
			vpd.put("var16", varOList.get(i).getString("MODEL"));	    //16
			vpd.put("var17", varOList.get(i).getString("NUM"));	    //17
			vpd.put("var18", varOList.get(i).getString("DUTY_NAME"));	    //18
			vpd.put("var19", varOList.get(i).getString("PHONE"));	    //19
			vpd.put("var20", varOList.get(i).getString("REMARK"));	    //20
			vpd.put("var21", varOList.get(i).getString("USER_ID"));	    //21
			vpd.put("var22", varOList.get(i).getString("USER_NAME"));	    //22
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	/**判断用户名是否存在
	 * @return
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public Object hasU(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(projectreportService.findByName(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
}
