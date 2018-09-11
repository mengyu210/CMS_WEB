package com.briup.cms.web.action.manager;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.briup.cms.bean.BasicInfo;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.common.util.WebUtil;
import com.briup.cms.service.IBasicInfoService;
import com.briup.cms.service.impl.BasicInfoServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("all")
public class BasicInfoAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	@Autowired
	private IBasicInfoService basicInfoService;
	
	private BasicInfo basicInfos1,basicInfos2,basicInfos3;
	private List<BasicInfo> basInfo;
	private Map<String,String> basicInfoMap;
	private String company_name;
	private String company_address;
	private String company_copyright;
	
	@Action("setBasicInfo")
	public void setBasicInfo(){
		try {
			basicInfoMap=basicInfoService.findAllBasicInfo();	
		} catch (ServiceException e1) {
			e1.printStackTrace();
		}
		if(basicInfoMap!=null){
			Long id1=BasicInfoServiceImpl.map2.get("company_name");
			Long id2=BasicInfoServiceImpl.map2.get(company_address);
			Long id3=BasicInfoServiceImpl.map2.get(company_copyright);
			basicInfos1=new BasicInfo(id1,"company_name",company_name);
			basicInfos2=new BasicInfo(id2,"company_address",company_address);
			basicInfos3=new BasicInfo(id3,"company_copyright",company_copyright);
			basicInfoMap=null;
		}
		else{
			basicInfos1=new BasicInfo("company_name",company_name);
			basicInfos2=new BasicInfo("company_address",company_address);
			basicInfos3=new BasicInfo("company_copyright",company_copyright);
		}
		String msg = null;
		try {
			basicInfoService.saveOrUpdateBasicInfo(basicInfos1,basicInfos2,basicInfos3);
			msg = "设置成功!";
		} catch (Exception e) {
			msg = "设置失败!";
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}

	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_address() {
		return company_address;
	}
	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}
	public String getCompany_copyright() {
		return company_copyright;
	}
	public void setCompany_copyright(String company_copyright) {
		this.company_copyright = company_copyright;
	}
}
