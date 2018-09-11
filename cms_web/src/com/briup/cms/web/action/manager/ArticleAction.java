package com.briup.cms.web.action.manager;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.common.util.JsonUtil;
import com.briup.cms.common.util.WebUtil;
import com.briup.cms.service.IArticleService;
import com.briup.cms.service.ICategoryService;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("all")
public class ArticleAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	@Autowired
	private IArticleService articleService;
	
	@Autowired
	private ICategoryService categoryService;
	
	private List<Article> articleList;
	
	private Article article;
	
	private String publishDate;
	
	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	//用户搜索文章信息: 下拉列表的值
	private String key;
	//用户搜索文章信息: 输入框的值
	private String value;
	private long id;
	
	@Action("findCategoryList")
	public void findCategoryList(){
		List<Category> findCategoryList;
		String str[] = {"articles"};
		String msg = null;
		try {
			findCategoryList=categoryService.findAll();
			String jsonStr=JsonUtil.getJsonArrayFromObject(findCategoryList,str);
			WebUtil.sendResponse(jsonStr);
			msg = "查询成功!";
		} catch (ServiceException e) {
			msg = "查询失败!";
			e.printStackTrace();
		}
		WebUtil.sendResponse(msg);
	}

	@Action("articlePublish")
	public void articlePublish(){
		String msg=null;
		try {
//			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//			System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			article.setPublishDate(new Date());
			articleService.publish(article);
			msg = "发布成功!";
		} catch (ServiceException e) {
			e.printStackTrace();
			msg = "发布失败!";
		}
		WebUtil.sendResponse(msg);
	}
	
	@Action(value="seachArticle",results={@Result(name="success",location="/WEB-INF/jsp/manager/articleList.jsp")})
	public String seachArticle(){
		List<Article> list;
		String str[] = {"articles"};
		try {
			if(key.equals("title")){
				key="title";
			}
			else if(key.equals("author")){
				key="author";
			}
			else if(key.equals("category")){
				System.out.println("aa");
				key="category.name";
			}
			list=articleService.findArticlesByCondition(key, value);
			String jsonStr=JsonUtil.getJsonArrayFromObject(list,str);
			WebUtil.sendResponse(jsonStr);
			System.out.println("333"+articleList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	@Action(value="allArticle")
	public void allArticle(){
		List<Article> list;
		String str[] = {"articles"};
		try {
			list=articleService.findAll();
			String jsonStr=JsonUtil.getJsonArrayFromObject(list,str);
			WebUtil.sendResponse(jsonStr);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	@Action("updateArticleInfo")
	public void updateArticleInfo(){
		String json = null;
		try {
			try {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
				article.setPublishDate(df.parse(publishDate));
			} catch (Exception e) {
				e.printStackTrace();
			}
			//System.out.println("666"+article.getCategory().getId());
			articleService.updateArticle(article);
			json="{\"msg\":\"OK\"}";
		} catch (ServiceException e) {
			json="{\"msg\":\"ERROR\"}";
			e.printStackTrace();
		}
		WebUtil.sendResponse(json);
	}
	
	@Action("deleteArticle")
	public void deleteArticle(){
		String json = null;
		try {
			articleService.delete(id);
			json="{\"msg\":\"OK\"}";
		} catch (ServiceException e) {
			json="{\"msg\":\"ERROR\"}";
			e.printStackTrace();
		}
		WebUtil.sendResponse(json);
	}
	

	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public List<Article> getArticleList() {
		return articleList;
	}
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}
}
