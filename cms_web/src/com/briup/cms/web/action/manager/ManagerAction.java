package com.briup.cms.web.action.manager;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;
import com.briup.cms.bean.Link;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.service.IArticleService;
import com.briup.cms.service.IBasicInfoService;
import com.briup.cms.service.ICategoryService;
import com.briup.cms.service.ILinkService;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("all")
public class ManagerAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IArticleService articleService;
	@Autowired
	private IBasicInfoService basicInfoService;
	@Autowired
	private ILinkService linkService;
	
	private List<Category> categoryList;
	private List<Article> articleList;
	private Map<String,String> basicInfoMap;
	private List<Link> linkList;
	
	private Category category;
	private Article article;
	private Link link;
	private long id;
	private Integer code;
	private String name;
	@Action(value="home",results={@Result(name="success",location="/WEB-INF/jsp/manager/manager_home.jsp")})
	public String home(){
		
		return SUCCESS;
	}
	
	
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public Integer getCode() {
		return code;
	}


	public void setCode(Integer code) {
		this.code = code;
	}


	@Action(value="showAddCategoryPage",results={@Result(name="success",location="/WEB-INF/jsp/manager/addCategory.jsp")})
	public String showAddCategoryPage(){
		
		return SUCCESS;
	}
	
	
	@Action(value="showCategoryListPage",results={@Result(name="success",location="/WEB-INF/jsp/manager/categoryList.jsp")})
	public String showCategoryListPage(){
		
		
		return SUCCESS;
	}
	
	
	@Action(value="showUpdateCategoryPage",results={@Result(name="success",location="/WEB-INF/jsp/manager/updateCategory.jsp")})
	public String showUpdateCategoryPage(){
		id=category.getCode();
		code=category.getCode();
		name = category.getName();
		return SUCCESS; 
	}
	
	
	@Action(value="showArticlePublishPage",results={@Result(name="success",location="/WEB-INF/jsp/manager/articlePublish.jsp")})
	public String showArticlePublishPage(){
		
		return SUCCESS;
	}
	
	@Action(value="showArticleListPage",results={@Result(name="success",location="/WEB-INF/jsp/manager/articleList.jsp")})
	public String showArticleListPage(){
		
		try {
			articleList=articleService.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	@Action(value="showUpdateArticleInfoPage",results={@Result(name="success",location="/WEB-INF/jsp/manager/updateArticleInfo.jsp")})
	public String showUpdateArticleInfoPage(){
		id=article.getId();
		System.out.println("rrr"+id);
		try {
			article=articleService.findById(id);
			categoryList=categoryService.findAll();
			System.out.println("===="+article);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	@Action(value="showBaseSetPage",results={@Result(name="success",location="/WEB-INF/jsp/manager/baseSet.jsp")})
	public String showBaseSetPage(){
		try {
			System.out.println("2323");
			linkList=linkService.findAllLink();
			basicInfoMap=basicInfoService.findAllBasicInfo();
			System.out.println("34"+basicInfoMap);
			System.out.println("list"+linkList);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	
	@Action(value="showUpdateLinkPage",results={@Result(name="success",location="/WEB-INF/jsp/manager/updateLink.jsp")})
	public String showUpdateLinkPage(){
		try {
			//System.out.println("id"+id);
			link=linkService.findLinkById(link.getId());
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}


	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<Article> getArticleList() {
		return articleList;
	}
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public Map<String, String> getBasicInfoMap() {
		return basicInfoMap;
	}
	public void setBasicInfoMap(Map<String, String> basicInfoMap) {
		this.basicInfoMap = basicInfoMap;
	}
	public List<Link> getLinkList() {
		return linkList;
	}
	public void setLinkList(List<Link> linkList) {
		this.linkList = linkList;
	}
	public Link getLink() {
		return link;
	}
	public void setLink(Link link) {
		this.link = link;
	}
}
