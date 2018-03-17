package com.fh.service.system.project.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.system.project.ProjectManager;

/** 
 * 说明： 项目管理
 * 创建人：kuang 767375210
 * 创建时间：2018-02-26
 * @version
 */
@Service("projectService")
public class ProjectService implements ProjectManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ProjectMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ProjectMapper.delete", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void uploadPurchaseOrder(PageData pd)throws Exception{
		dao.update("ProjectMapper.uploadPurchaseOrder", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ProjectMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ProjectMapper.datalistPage", page);
	}
	
	/**项目下拉
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listProject(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ProjectMapper.datalistProject", page);
	}
	
	/**周报统计
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listProjectReport(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ProjectMapper.listProjectReport", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ProjectMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProjectMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ProjectMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**通过NAME获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByName(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProjectMapper.findByName", pd);
	}
	
	/**通过NAME获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findListByArea(Page page)throws Exception{
		return (List<PageData>)dao.findForObject("ProjectMapper.findListByArea", page);
	}
}

