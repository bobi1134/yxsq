package org.yxsq.action.yxsq.home;

import org.tool.characterprocess.CharacterProcess;
import org.yxsq.action.base.AbstractAjaxAction;
import org.yxsq.service.YxsqService;
import org.yxsq.service.impl.YxsqServiceImpl;
import org.yxsq.service.proxy.ProxyFactory;

public class SelectTqAjax extends AbstractAjaxAction {

	private static final long serialVersionUID = 1L;
	private YxsqService yxsqService = ProxyFactory.getProxy(new YxsqServiceImpl());
	
	private String province;
	private String city;
	@Override
	protected String getJson() throws Exception {
		return yxsqService.selectTqAjx(province, city);
	}
	
	
	/** setter and getter method */
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = CharacterProcess.isoToUtf8(province);
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = CharacterProcess.isoToUtf8(city);
	}
}
