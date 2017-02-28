package org.yxsq.action.admin.tz;

import java.util.List;

import org.tool.characterprocess.CharacterProcess;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Tz;
import org.yxsq.service.AdminService;
import org.yxsq.service.impl.AdminServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class Admin_TzAction extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private AdminService adminService = ProxyFactory.getProxy(new AdminServiceImpl());

	private List<Tz> tzs;
	private String sqName;
	private String tzTitle;
	private Tz tz;
	private String id;
	
	private int pageIndex;
	private int pageSize;
	private int recordCount;
	
	/**
	 * 后台管理系统 - 多条件查询所有的帖子
	 * @return
	 */
	public String admin_selectAllTz(){
		pageModel.setPageSize(12);
		tzs = adminService.admin_selectAllTz(sqName, tzTitle, pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 预览帖子
	 * @return
	 */
	public String admin_prevTz(){
		tz = adminService.admin_prevTz(id);
		return SUCCESS;
	}

	/**
	 * 后台管理系统 - 首页加精
	 * @return
	 */
	public String addTojingTz(){
		try {
			adminService.addTojingTz(id);
			setTip("该帖已经设置为首页精帖！");
			
			pageModel.setPageIndex(pageIndex);
			pageModel.setPageSize(pageSize);
			pageModel.setRecordCount(recordCount);			
			tzs = adminService.admin_selectAllTz(sqName, tzTitle, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			setTip("首页加精失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 首页加火
	 * @return
	 */
	public String addTohuoTz(){
		try {
			adminService.addTohuoTz(id);
			setTip("该帖已经设置为首页火贴！");
			
			pageModel.setPageIndex(pageIndex);
			pageModel.setPageSize(pageSize);
			pageModel.setRecordCount(recordCount);			
			tzs = adminService.admin_selectAllTz(sqName, tzTitle, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			setTip("首页加火失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 取消首页加精
	 * @return
	 */
	public String deleteTojingTz(){
		try {
			adminService.deleteTojingTz(id);
			setTip("取消成功！");
			
			pageModel.setPageIndex(pageIndex);
			pageModel.setPageSize(pageSize);
			pageModel.setRecordCount(recordCount);			
			tzs = adminService.admin_selectAllTz(sqName, tzTitle, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			setTip("取消失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 后台管理系统 - 取消首页加火
	 * @return
	 */
	public String deleteTohuoTz(){
		try {
			adminService.deleteTohuoTz(id);
			setTip("取消成功！");
			
			pageModel.setPageIndex(pageIndex);
			pageModel.setPageSize(pageSize);
			pageModel.setRecordCount(recordCount);			
			tzs = adminService.admin_selectAllTz(sqName, tzTitle, pageModel);
		} catch (Exception e) {
			// TODO: handle exception
			setTip("取消失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 查询首页所有精帖
	 * @return
	 */
	public String admin_selectAllIndexJingTz(){
		pageModel.setPageSize(12);
		tzs = adminService.admin_selectAllIndexJingTz(sqName, tzTitle, pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 精帖管理页面取消该帖子加精 
	 * @return
	 */
	public String deleteTojingTz_2(){
		try {
			adminService.deleteTojingTz(id);
			setTip("取消成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("取消失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 查询首页所有热帖
	 * @return
	 */
	public String admin_selectAllIndexHuoTz(){
		pageModel.setPageSize(12);
		tzs = adminService.admin_selectAllIndexHuoTz(sqName, tzTitle, pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 精帖管理页面取消该帖子加火
	 * @return
	 */
	public String deleteTohuoTz_2(){
		try {
			adminService.deleteTohuoTz(id);
			setTip("取消成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("取消失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	
	
	
	/** setter and getter method */
	public List<Tz> getTzs() {
		return tzs;
	}
	public void setTzs(List<Tz> tzs) {
		this.tzs = tzs;
	}
	public String getSqName() {
		return sqName;
	}
	public void setSqName(String sqName) {
		this.sqName = CharacterProcess.isoToUtf8(sqName);
	}
	public String getTzTitle() {
		return tzTitle;
	}
	public void setTzTitle(String tzTitle) {
		this.tzTitle = CharacterProcess.isoToUtf8(tzTitle);
	}
	public Tz getTz() {
		return tz;
	}
	public void setTz(Tz tz) {
		this.tz = tz;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
}
