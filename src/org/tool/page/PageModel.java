package org.tool.page;

/**
 * 分页实体
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年4月26日
 */
public class PageModel {
	
	// 定义默认一页显示的数量
	private final static int PAGE_SIZE = 10;
	// 当前页码
	private int pageIndex;
	// 一页显示的显数
	private int pageSize;
	// 总记录条数
	private int recordCount;
	
	
	public int getPageIndex() {
		return pageIndex <= 1 ? 1 : pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize <= 0 ? PAGE_SIZE : pageSize;
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
	public int getStartRow()
	{
		return (this.getPageIndex() - 1) * this.getPageSize();
	}
}
