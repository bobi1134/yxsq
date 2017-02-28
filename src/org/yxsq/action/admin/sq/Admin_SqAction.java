package org.yxsq.action.admin.sq;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.tool.characterprocess.CharacterProcess;
import org.tool.excel.ExcelDaoChu;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.PrepareSq;
import org.yxsq.dto.Sq;
import org.yxsq.dto.SqVo;
import org.yxsq.service.AdminService;
import org.yxsq.service.impl.AdminServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class Admin_SqAction extends AbstractAction {
	
	private static final long serialVersionUID = 1L;
	private AdminService adminService = ProxyFactory.getProxy(new AdminServiceImpl());
	
	private List<Sq> sqs;
	private String sq_name;
	private String sq_location;
	private int prepare_sq_Count;
	private List<PrepareSq> prepareSqs;
	private String id;
	private Sq sq;
	private String sq_introduction;
	private String sq_pano;

	/**
	 * 后台管理系统 - 多条件查询社区
	 * @return
	 */
	public String admin_selectAllSq(){
		pageModel.setPageSize(12);
		sqs = adminService.admin_selectAllSq(pageModel, sq_name, sq_location);
		return SUCCESS;
	}

	/**
	 * 后台管理系统 - 导出查询后满足条件的社区
	 * @return
	 */
	public String admin_excelSQ(){
		try {
			/**
			 * 先查询满足条件的社区 -- 不分页
			 */
			List<SqVo> sqVos = adminService.select_Admin_excelSQ(sq_name, sq_location);
			String[] titles = {"编号", "社区名称", "社区签名", "社区Logo图片", "社区图片", "省份"};
			ExcelDaoChu.exportExcel("社区信息", "社区表", titles, sqVos, ServletActionContext.getResponse(), ServletActionContext.getRequest());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 后台管理系统 - 查询所有建立社区申请
	 * @return
	 */
	public String admin_selectAllPrepareSq(){
		/**
		 * 先准备还需要处理条数
		 */
		prepare_sq_Count = adminService.admin_selectPrepareSqCount();
		/**
		 * 后台管理系统 - 查询所有建立社区申请
		 */
		pageModel.setPageSize(12);
		prepareSqs = adminService.admin_selectAllPrepareSq(pageModel);
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 通过请求
	 * @return
	 */
	public String admin_passPrepareSq(){
		try {
			adminService.admin_passPrepareSq(id);
			setTip("该社区已经建立成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("该社区建立失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 拦截社区建立请求：即根据id删除相应id
	 * @return
	 */
	public String admin_failPrepareSq(){
		try {
			adminService.admin_failPrepareSq(id);
			setTip("操作成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("不允许该社区建立失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 后台管理系统 - 跳到修改社区资料页面
	 * @return
	 */
	public String admin_updateSqPage(){
		sq = adminService.admin_selectSqById(id);
		return SUCCESS;
	}

	/**
	 * 后台管理系统 - 修改社区资料
	 * @return
	 */
	public String updateSq(){
		try {
			adminService.updateSqById(id, sq_name, sq_introduction, sq_location, sq_pano);
			/**
			 * 返回数据
			 */
			sq = adminService.admin_selectSqById(id);
			setTip("修改成功！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("修改失败！");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	
	
	/** setter and getter method */
	public List<Sq> getSqs() {
		return sqs;
	}
	public void setSqs(List<Sq> sqs) {
		this.sqs = sqs;
	}
	public String getSq_name() {
		return sq_name;
	}
	public void setSq_name(String sq_name) {
		this.sq_name = CharacterProcess.isoToUtf8(sq_name);
	}
	public String getSq_location() {
		return sq_location;
	}
	public void setSq_location(String sq_location) {
		this.sq_location = CharacterProcess.isoToUtf8(sq_location);
	}
	public AdminService getAdminService() {
		return adminService;
	}
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	public int getPrepare_sq_Count() {
		return prepare_sq_Count;
	}
	public void setPrepare_sq_Count(int prepare_sq_Count) {
		this.prepare_sq_Count = prepare_sq_Count;
	}
	public List<PrepareSq> getPrepareSqs() {
		return prepareSqs;
	}
	public void setPrepareSqs(List<PrepareSq> prepareSqs) {
		this.prepareSqs = prepareSqs;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Sq getSq() {
		return sq;
	}
	public void setSq(Sq sq) {
		this.sq = sq;
	}

	public String getSq_introduction() {
		return sq_introduction;
	}

	public void setSq_introduction(String sq_introduction) {
		this.sq_introduction = sq_introduction;
	}

	public String getSq_pano() {
		return sq_pano;
	}

	public void setSq_pano(String sq_pano) {
		this.sq_pano = sq_pano;
	}
}
