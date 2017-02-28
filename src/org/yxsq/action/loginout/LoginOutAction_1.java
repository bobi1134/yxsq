package org.yxsq.action.loginout;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.tool.ipAddress.IpAddress;
import org.tool.weather.WeatherUtil;
import org.yxsq.action.base.AbstractAction;
import org.yxsq.dto.Img;
import org.yxsq.dto.Tz;
import org.yxsq.dto.User;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class LoginOutAction_1 extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private List<Img> indexImgs;
	private List<Img> indexImgs_2;
	private List<Tz> tzs;
	private List<Tz> tzs_2;
	private List<Tz> tzs_3;
	private List<User> users;
	private int sqCount;
	private String getIpTip;
	private String sj_1;
	private String sj_2;
	private String mr_address;

	public String execute(){
		ServletActionContext.getRequest().getSession().invalidate();
		/**
		 * 准备轮播的6张火图
		 */
		indexImgs = yxsqService.selectAllImg();
		/**
		 * 准备换肤的6张背景图
		 */
		indexImgs_2 = yxsqService.selectAllImg_2();
		/**
		 * 准备精品帖子
		 */
		tzs = yxsqService.selectAlJpTz();//前3条
		tzs_2 = yxsqService.selectAlJpTz_2();//后7条
		/**
		 * 准备高校热帖
		 */
		tzs_3 = yxsqService.selectAlJpTz_3();
		/**
		 * 新会员
		 */
		users = yxsqService.selectNewUser();
		/**
		 * 准备社区总数
		 */
		sqCount = yxsqService.selectSqCount();
		/**
		 * 根据用户IP获取该地方的默认天气
		 */
		try {
			String address = IpAddress.getAddressByIp();
			if (address.length() > 30) {
				setGetIpTip(address);
				int provinceCode = WeatherUtil.getProinceCode("四川");
				int cityCode = WeatherUtil.getCityCode(provinceCode, "雅安");
				List<String> list = WeatherUtil.getWeather(cityCode);
				setMr_address("雅安");
				sj_1 = list.get(7).substring(list.get(7).indexOf(" "));
				sj_2 = list.get(8);
			}else{
				String province = address.substring(0, address.indexOf("省"));
				String city = address.substring(address.indexOf("省")+1, address.indexOf("市"));
				int provinceCode = WeatherUtil.getProinceCode(province);
				int cityCode = WeatherUtil.getCityCode(provinceCode, city);
				List<String> list = WeatherUtil.getWeather(cityCode);
				setMr_address(city);
				sj_1 = list.get(7).substring(list.get(7).indexOf(" "));
				sj_2 = list.get(8);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	/** setter and getter method */
	public List<Img> getIndexImgs() {
		return indexImgs;
	}

	public void setIndexImgs(List<Img> indexImgs) {
		this.indexImgs = indexImgs;
	}
	public List<Tz> getTzs() {
		return tzs;
	}
	public void setTzs(List<Tz> tzs) {
		this.tzs = tzs;
	}

	public List<Tz> getTzs_2() {
		return tzs_2;
	}

	public void setTzs_2(List<Tz> tzs_2) {
		this.tzs_2 = tzs_2;
	}

	public List<Tz> getTzs_3() {
		return tzs_3;
	}

	public void setTzs_3(List<Tz> tzs_3) {
		this.tzs_3 = tzs_3;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String getGetIpTip() {
		return getIpTip;
	}

	public void setGetIpTip(String getIpTip) {
		this.getIpTip = getIpTip;
	}

	public int getSqCount() {
		return sqCount;
	}

	public void setSqCount(int sqCount) {
		this.sqCount = sqCount;
	}

	public List<Img> getIndexImgs_2() {
		return indexImgs_2;
	}

	public void setIndexImgs_2(List<Img> indexImgs_2) {
		this.indexImgs_2 = indexImgs_2;
	}

	public String getSj_1() {
		return sj_1;
	}

	public void setSj_1(String sj_1) {
		this.sj_1 = sj_1;
	}

	public String getSj_2() {
		return sj_2;
	}

	public void setSj_2(String sj_2) {
		this.sj_2 = sj_2;
	}

	public String getMr_address() {
		return mr_address;
	}

	public void setMr_address(String mr_address) {
		this.mr_address = mr_address;
	}
}
