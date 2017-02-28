package org.yxsq.action.admin.img;

import java.io.File;
import java.util.List;

import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Img;
import org.yxsq.dto.Tz;
import org.yxsq.service.AdminService;
import org.yxsq.service.impl.AdminServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class Admin_ImgAction extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private AdminService adminService = ProxyFactory.getProxy(new AdminServiceImpl());

	private List<Img> imgs;
	private Img img;
	private String id;
	private List<Tz> tzs;
	private String ghId;
	private String okId;
	
	private String img_title;
	private String img_src;
	private File bjImg;
	private String bjImgFileName;
	
	private File homeTbImg;
	private String homeTbImgFileName;

	/**
	 * 后台管理系统 - 查询首页的所有图片
	 * @return
	 */
	public String admin_selectImgs(){
		pageModel.setPageSize(12);
		imgs = adminService.admin_selectImgs(pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 预览首页滚动图片
	 * @return
	 */
	public String admin_prevImg_1(){
		img = adminService.admin_prevImg_1(id);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 预览首页背景图片
	 * @return
	 */
	public String admin_prevImg_2(){
		img = adminService.admin_prevImg_2(id);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 查询所有的导航图片
	 * @return
	 */
	public String admin_selectdhImg(){
		pageModel.setPageSize(12);
		imgs = adminService.admin_selectdhImg(pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 查询所有带<img>属性的所有帖子
	 * @return
	 */
	public String admin_selectAllImgTz(){
		pageModel.setPageSize(12);
		setGhId(id);
		tzs = adminService.admin_selectAllImgTz(pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 确认更换该图片导航信息
	 * @return
	 */
	public String admin_dhOk(){
		try {
			adminService.admin_dhOk(ghId, okId);
			setTip("更换成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("更换失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 查询首页所有的背景图片
	 * @return
	 */
	public String admin_selectbjImg(){
		pageModel.setPageSize(12);
		imgs = adminService.admin_selectbjImg(pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 跳转到修改背景图片页面
	 * @return
	 */
	public String admin_updateBjPage(){
		img = adminService.admin_updateBjPage(id);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 修改首页背景图片
	 * @return
	 */
	public String admin_updateBjImg(){
		try {
			adminService.admin_updateBjImg(id, img_title, img_src, bjImg, bjImgFileName);
			/**
			 * 准备信息
			 */
			img = adminService.admin_updateBjPage(id);
			setTip("修改成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("修改失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 查询所有的用户头部背景图片
	 * @return
	 */
	public String admin_selectHomeImgs(){
		pageModel.setPageSize(12);
		imgs = adminService.admin_selectHomeImgs(pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 预览用户主页头部背景图片
	 * @return
	 */
	public String admin_prevHomeImg(){
		img = adminService.admin_prevHomeImg(id);
		return SUCCESS;
	} 
	
	/**
	 * 后台管理系统 - 跳到修改用户主页头部主页背景图片页面
	 * @return
	 */
	public String admin_updateHomeTbBjPage(){
		/**
		 * 调用上面的预览方法！重复利用！
		 */
		img = adminService.admin_prevHomeImg(id);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 修改用户主页头部背景
	 * @return
	 */
	public String admin_updateHomeTbBjImg(){
		try {
			adminService.admin_updateHomeTbBjImg(id, img_title, img_src, homeTbImg, homeTbImgFileName);
			/**
			 * 准备信息
			 */
			img = adminService.admin_prevHomeImg(id);
			setTip("修改成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("修改失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/** setter and getter method */
	public List<Img> getImgs() {
		return imgs;
	}
	public void setImgs(List<Img> imgs) {
		this.imgs = imgs;
	}
	public Img getImg() {
		return img;
	}
	public void setImg(Img img) {
		this.img = img;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<Tz> getTzs() {
		return tzs;
	}
	public void setTzs(List<Tz> tzs) {
		this.tzs = tzs;
	}
	public String getGhId() {
		return ghId;
	}
	public void setGhId(String ghId) {
		this.ghId = ghId;
	}
	public String getOkId() {
		return okId;
	}
	public void setOkId(String okId) {
		this.okId = okId;
	}
	public String getImg_title() {
		return img_title;
	}
	public void setImg_title(String img_title) {
		this.img_title = img_title;
	}
	public File getBjImg() {
		return bjImg;
	}
	public void setBjImg(File bjImg) {
		this.bjImg = bjImg;
	}
	public String getBjImgFileName() {
		return bjImgFileName;
	}
	public void setBjImgFileName(String bjImgFileName) {
		this.bjImgFileName = bjImgFileName;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public File getHomeTbImg() {
		return homeTbImg;
	}
	public void setHomeTbImg(File homeTbImg) {
		this.homeTbImg = homeTbImg;
	}
	public String getHomeTbImgFileName() {
		return homeTbImgFileName;
	}
	public void setHomeTbImgFileName(String homeTbImgFileName) {
		this.homeTbImgFileName = homeTbImgFileName;
	}
}
