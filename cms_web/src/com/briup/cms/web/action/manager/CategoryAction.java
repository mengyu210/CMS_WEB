package com.briup.cms.web.action.manager;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.briup.cms.bean.Category;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.service.ICategoryService;
import com.briup.cms.common.util.JsonUtil;
import com.briup.cms.common.util.WebUtil;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;

@SuppressWarnings("all")
public class CategoryAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private ICategoryService categoryService;
	
	private Category category;
	private long id;
	private String name;	
	private Integer code;
	
	
	
	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getCode() {
		return code;
	}


	public void setCode(Integer code) {
		this.code = code;
	}
	

	@Action("addCategory")
	public void addCategory(){
		String msg = null;
		try {
			System.out.println("18");
			categoryService.addCategory(category);
			msg = "添加成功!";
		} catch (ServiceException e) {
			msg = "添加失败!";
			e.printStackTrace();
		}
		
		WebUtil.sendResponse(msg);
	}
	
	
	@Action("updateCategory")
	public void updateCategory(){
		String msg = null;
		try {
			Category ca=categoryService.findByName(category.getName());
			if(ca==null){
				categoryService.updateCategory(category);
				msg = "修改成功!";
			}
			else{
				msg = "修改失败,栏目名已存在!";
			}	
		} catch (ServiceException e) {
			msg = "修改失败,栏目名已存在!";
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}
	
	@Action("deleteCategory")
	public void deleteCategory(){
		String json = null;
		try {
			categoryService.deleteCategoryById(id);
			json="{\"msg\":\"OK\"}";
		} catch (ServiceException e) {
			json="{\"msg\":\"ERROR\"}";
			e.printStackTrace();
		}
		WebUtil.sendResponse(json);
	}
	
	@Action(value="allCategory")
	public void allCategory(){
		List<Category> list;
		String str[] = {"articles"};
		try {
			list=categoryService.findAll();
     		//String jsonStr = JsonUtil.getJsonArrayFromObject(list);
			//防止因为表的级联关系导致转换json时候发生循环调用，最终404找不到该action.
			String jsonStr=JsonUtil.getJsonArrayFromObject(list,str);
			WebUtil.sendResponse(jsonStr);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}
	@Action("findCategoryByName")
	public void findCategoryByName(){
		Category findCategory = null;
		try {
			findCategory = categoryService.findByName(category.getName());
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		String jsonStr = "";
		JSONObject obj = new JSONObject();
		if(findCategory!=null){
			obj.put("flag", "ERROR");
			obj.put("msg", "栏目名已经被占用");
		}else{
			obj.put("flag", "SUCCESS");
			obj.put("msg", "栏目名可用");
		}
		jsonStr = obj.toString();
		WebUtil.sendResponse(jsonStr);
	}
	
	public Category getCategory() {
		
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
