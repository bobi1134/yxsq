package org.yxsq.action.yxsq.tz;

import java.util.List;

import org.tool.characterprocess.CharacterProcess;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.LchRemark;
import org.yxsq.dto.Sq;
import org.yxsq.dto.Tz;
import org.yxsq.dto.TzRemark;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class TzAction extends AbstractAction {
	
	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String tzId;
	private String sqId;
	private Sq sq;
	private Tz tz;
	private int count;
	private List<TzRemark> tzRemarks;
	private List<LchRemark> lchRemarks;
	private String userId;
	private String remarkText;
	private int xs;
	private TzRemark tzRemark;
	private int pageIndex;
	private int pageSize;
	private int recordCount;

	/**
	 * 查询该帖的所有评论
	 * @return
	 */
	public String selectAllRemark(){
		tzRemarks = yxsqService.selectAllRemark(tzId, pageModel);//查询该帖子下面的所有评论
		sq = yxsqService.selectSqBySqId(sqId);//根据社区id查询相应社区的详细信息
		tz = yxsqService.selectTzByTzId(tzId);//根据帖子id查询该帖子的详细信息
		count = yxsqService.selectSqTzCount(sq.getSq_name());//根据社区名查询发帖总数
		return SUCCESS;
	}

	/**
	 * 添加一级评论
	 * @return
	 */
	public String insertOneRemark(){
		tzRemark = yxsqService.selectFirstOneRemark(tzId);
		try {
			if (remarkText.equals(tzRemark.getTz_remark_content()) && Integer.valueOf(userId) == tzRemark.getUserId()) {
				setTip("禁止表单重复提交！");
			}else{
				yxsqService.insertOneRemark(remarkText, tzId, userId);
				setXs(1);
				setRemarkText("");	
			}
			pageModel.setPageIndex(pageIndex);
			pageModel.setPageSize(pageSize);
			pageModel.setRecordCount(recordCount);
			tzRemarks = yxsqService.selectAllRemark(tzId, pageModel);//查询该帖子下面的所有评论
			sq = yxsqService.selectSqBySqId(sqId);//根据社区id查询相应社区的详细信息
			tz = yxsqService.selectTzByTzId(tzId);//根据帖子id查询该帖子的详细信息
			count = yxsqService.selectSqTzCount(sq.getSq_name());//根据社区名查询发帖总数
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/** setter and getter method */
	public String getTzId() {
		return tzId;
	}
	public void setTzId(String tzId) {
		this.tzId = tzId;
	}
	public List<TzRemark> getTzRemarks() {
		return tzRemarks;
	}
	public void setTzRemarks(List<TzRemark> tzRemarks) {
		this.tzRemarks = tzRemarks;
	}
	public List<LchRemark> getLchRemarks() {
		return lchRemarks;
	}
	public void setLchRemarks(List<LchRemark> lchRemarks) {
		this.lchRemarks = lchRemarks;
	}
	public String getSqId() {
		return sqId;
	}
	public void setSqId(String sqId) {
		this.sqId = sqId;
	}
	public Sq getSq() {
		return sq;
	}
	public void setSq(Sq sq) {
		this.sq = sq;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Tz getTz() {
		return tz;
	}
	public void setTz(Tz tz) {
		this.tz = tz;
	}
	public String getUserId() {
		return userId;
	}
	public String getRemarkText() {
		return remarkText;
	}
	public void setRemarkText(String remarkText) {
		this.remarkText = CharacterProcess.isoToUtf8(remarkText);
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getXs() {
		return xs;
	}
	public void setXs(int xs) {
		this.xs = xs;
	}

	public TzRemark getTzRemark() {
		return tzRemark;
	}

	public void setTzRemark(TzRemark tzRemark) {
		this.tzRemark = tzRemark;
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
