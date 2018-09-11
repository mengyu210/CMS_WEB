package com.briup.cms.web.action.manager;

import java.text.SimpleDateFormat;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.briup.cms.bean.Link;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.common.util.WebUtil;
import com.briup.cms.service.ILinkService;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;
@SuppressWarnings("all")
public class LinkAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	@Autowired
	private ILinkService linkService;
	
	private Link link;
	private long id;
	
	@Action("addLink")
	public void addLink(){
		String msg = null;

		try {
			linkService.saveLink(link);
			msg = "添加成功!";
		} catch (ServiceException e) {
			msg = "添加失败!";
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}
	
	@Action("deleteLink")
	public void deleteLink(){
		String msg = null;
		//id=link.getId();
		try {
			System.out.println("123");
			System.out.println("link"+id);
			linkService.deleteLink(id);
			msg = "删除成功!";
		} catch (ServiceException e) {
			msg = "删除成功!";
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}
	
	
	@Action("updateLink")
	public void updateLink(){
		String json = null;
		try {
			linkService.updateLink(link);
			json="{\"msg\":\"OK\"}";
		} catch (ServiceException e) {
			json="{\"msg\":\"ERROR\"}";
			e.printStackTrace();
		}
		WebUtil.sendResponse(json);
		
	}
	public Link getLink() {
		return link;
	}
	public void setLink(Link link) {
		this.link = link;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
}	
