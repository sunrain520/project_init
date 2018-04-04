package com.fh.controller.app.sysuser;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fh.controller.base.BaseController;
import com.fh.service.fhoa.fhfile.FhfileManager;
import com.fh.service.information.pictures.PicturesManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;
import com.fh.util.Watermark;

@Controller
@RequestMapping(value = "/file")
public class FileController {

	@Resource(name = "picturesService")
	private PicturesManager picturesService;

	@Resource(name="fhfileService")
	private FhfileManager fhfileService;
	
	/**去预览pdf文件页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/loginViewPdf")
	public ModelAndView goViewPdf()throws Exception{
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData(request);
		pd = fhfileService.findById(pd);
		mv.setViewName("system/login/login_fhfile_view_pdf");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 登录页面上传图片 不做权限控制
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/loginUpload")
	@ResponseBody
	public Object save(MultipartFile pic, HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			// 获取图片原始文件名
			String originalFilename = pic.getOriginalFilename();
			System.out.println(originalFilename);

			String id = UuidUtil.get32UUID();
			// 文件名使用当前时间
			String name = id;

			// 获取上传图片的扩展名(jpg/png/...)
			String extension = FilenameUtils.getExtension(originalFilename);

			// 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）
			String path = Const.FILEPATHIMG + DateUtil.getDays() + "/" + name + "." + extension;

			// 图片上传的绝对路径
			String url = request.getSession().getServletContext().getRealPath("") + "/" + path;

			System.out.println(url);

			File dir = new File(url);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			// 上传图片
			pic.transferTo(new File(url));

			PageData pd = new PageData();
			pd.put("PICTURES_ID", id); // 主键
			pd.put("TITLE", "图片"); // 标题
			pd.put("NAME", name + "." + extension); // 文件名
			pd.put("PATH", DateUtil.getDays() + "/" + name + "." + extension); // 路径
			pd.put("CREATETIME", Tools.date2Str(new Date())); // 创建时间
			pd.put("MASTER_ID", "1"); // 附属与
			pd.put("BZ", "用户注册上传"); // 备注
			picturesService.save(pd);

			// 将相对路径写回（json格式）
			JSONObject jsonObject = new JSONObject();
			// 将图片上传到本地
			jsonObject.put("path", path);
			jsonObject.put("id", id);
			jsonObject.put("real_path", DateUtil.getDays() + "/" + name + "." + extension);

			return jsonObject.toString();
		} catch (Exception e) {
			throw new RuntimeException("服务器繁忙，上传图片失败");
		}
	}

}
