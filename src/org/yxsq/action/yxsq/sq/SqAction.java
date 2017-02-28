package org.yxsq.action.yxsq.sq;

import java.util.List;

import org.tool.characterprocess.CharacterProcess;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Bb;
import org.yxsq.dto.Sq;
import org.yxsq.dto.Tz;
import org.yxsq.dto.User;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class SqAction extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());

	private List<Sq> sqs;
	private String sqName;
	private Sq sq;
	private int ftzs;
	private List<Tz> tzs;
	private int userId;
	private String sqId;
	private String tz_title;
	private String ckeditor;
	private String flag;
	private Tz tz;
	private int xs;
	private User user;
	private String sqIntroduction;
	private String sqLocation;
	private List<Bb> bbs;
	private String bb_content;
	
	/**
	 * 查询所有社区
	 * @return
	 */
	public String selectSq(){
		sqs = yxsqService.selectSq();
		user = yxsqService.selectUserById(userId);
		return SUCCESS;
	}
	
	/**
	 * 根据社区名进入社区
	 * @return
	 */
	public String sqGo(){
		if (sqName != null) {
			System.out.println("sqName:"+sqName);
			sq = yxsqService.sqGo(sqName);
			if (sq == null) {
				sqs = yxsqService.selectSq();
				setTip("该社区未建立，你可以申请<a href='javascript:void(0)' id='goAddSqPage'>建立该社区</a>！");
				return ERROR;
			}else{
				/**
				 * 查询相应社区的帖子总数
				 */
				ftzs = yxsqService.selectSqTzCount(sqName);
				/**
				 * 查询所有帖子、发帖人、发帖时间、最后评论者
				 */
				pageModel.setPageSize(15);
				tzs = yxsqService.selectTzsBySqName(sqName, pageModel);
				if (flag != null) {
					setTz_title("");
					setCkeditor("");
				}
				return SUCCESS;
			}
		}
		else{
			sqs = yxsqService.selectSq();
			return ERROR;
		}
	}
	
	/**
	 * 添加帖子
	 */
	public String insertTz(){
		tz = yxsqService.select(sqId);
		try {
			if (tz_title.equals(tz.getTz_title()) && userId == Integer.valueOf(tz.getUserId())) {
				setTip("禁止表单重复提交！");
			}else {
				yxsqService.insertTz(tz_title, ckeditor, userId, sqId);
				setXs(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * Y主点击修改社区资料跳转页面
	 * @return
	 */
	public String updateSqZLPage(){
		sq = yxsqService.selectSqBySqId(sqId);
		user = yxsqService.selectUserById(userId);
		return SUCCESS;
	}
	
	/**
	 * 发送建立社区请求
	 * @return
	 */
	public String addSqRequest(){
		try {
			yxsqService.addSqRequest(sqName, sqIntroduction, sqLocation);
			setTip("申请已经提交，静待结果！");
		} catch (Exception e) {
			// TODO: handle exception
			setTip("申请提交失败，sorry，请重新提交！");
		}
		return SUCCESS;
	}
	
	/**
	 * 在社区中点击"校园3D导航" 跳转到该大学的3D街景图
	 * @return
	 */
	public String threeDStreetscape(){
		/**
		 * 查询该社区相关信息
		 */
		sq = yxsqService.selectSqBySqId(sqId);
		/**
		 * 查询相应社区的帖子总数
		 */
		ftzs = yxsqService.selectSqTzCount(sqName);
		return SUCCESS;
	}
	
	/**
	 * 跳到bb_onePage.jsp
	 * @return
	 */
	public String bb_onePage(){
		sq = yxsqService.selectSqBySqId(sqId);
		return SUCCESS;
		
	}
	
	/**
	 * 跳到bb_twoPage.jsp
	 * @return
	 */
	public String bb_twoPage(){
		/**
		 * 数据1
		 */
		sq = yxsqService.selectSqBySqId(sqId);
		/**
		 * 数据2
		 */
		pageModel.setPageSize(10);
		bbs = yxsqService.selectBbsBySqId(sqId, pageModel);
		return SUCCESS;
	}
	
	/**
	 * 跳到当前用户申请当社区Y主页面
	 * @return
	 */
	public String applySqYZPage(){
		/**
		 * 数据1
		 */
		sq = yxsqService.selectSqBySqId(sqId);
		return SUCCESS;
		
	}
	
	
	
	
	
	
	/** setter and getter method */
	public List<Sq> getSqs() {
		return sqs;
	}
	public void setSqs(List<Sq> sqs) {
		this.sqs = sqs;
	}
	public Sq getSq() {
		return sq;
	}
	public void setSq(Sq sq) {
		this.sq = sq;
	}

	public int getFtzs() {
		return ftzs;
	}

	public void setFtzs(int ftzs) {
		this.ftzs = ftzs;
	}

	public List<Tz> getTzs() {
		return tzs;
	}

	public void setTzs(List<Tz> tzs) {
		this.tzs = tzs;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getSqId() {
		return sqId;
	}

	public void setSqId(String sqId) {
		this.sqId = sqId;
	}




	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Tz getTz() {
		return tz;
	}

	public void setTz(Tz tz) {
		this.tz = tz;
	}

	public int getXs() {
		return xs;
	}

	public void setXs(int xs) {
		this.xs = xs;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getSqIntroduction() {
		return sqIntroduction;
	}

	public void setSqIntroduction(String sqIntroduction) {
		this.sqIntroduction = sqIntroduction;
	}

	public String getSqLocation() {
		return sqLocation;
	}

	public void setSqLocation(String sqLocation) {
		this.sqLocation = sqLocation;
	}

	public List<Bb> getBbs() {
		return bbs;
	}

	public void setBbs(List<Bb> bbs) {
		this.bbs = bbs;
	}

	public String getBb_content() {
		return bb_content;
	}

	public void setBb_content(String bb_content) {
		this.bb_content = CharacterProcess.isoToUtf8(bb_content);
	}

	public String getSqName() {
		return sqName;
	}

	public void setSqName(String sqName) {
		this.sqName = sqName;
	}

	public String getTz_title() {
		return tz_title;
	}

	public void setTz_title(String tz_title) {
		this.tz_title = tz_title;
	}

	public String getCkeditor() {
		return ckeditor;
	}

	public void setCkeditor(String ckeditor) {
		this.ckeditor = ckeditor;
	}
}
