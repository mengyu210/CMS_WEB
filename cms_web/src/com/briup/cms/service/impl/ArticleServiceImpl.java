package com.briup.cms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.cms.bean.Article;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.dao.ArticleDao;
import com.briup.cms.service.IArticleService;

@SuppressWarnings("all")
@Service("articleService")
public class ArticleServiceImpl implements IArticleService{
	@Autowired
	private ArticleDao articleDao;
	
	@Override
	public void publish(Article article) throws ServiceException {
		articleDao.save(article);
	}

	@Override
	public List<Article> findAll() throws ServiceException {
		return articleDao.findAll();
	}

	@Override
	public List<Article> findAllByCategoryId(long id) throws ServiceException {
		
		return null;
	}

	@Override
	public void delete(long id) throws ServiceException {
		articleDao.delete(id);
	}

	@Override
	public Article findById(long id) throws ServiceException {
		return articleDao.findById(id);
	}

	@Override
	public void updateArticle(Article article) throws ServiceException {
		articleDao.update(article);
	}

	@Override
	public List<Article> findArticlesByCondition(String key, String value) throws ServiceException {
		String hql;
		if(key.equals("c_id")){
			 hql="from  Article where "+key+" = "+value+" ";
		}
		else{
			 hql="from  Article where "+key+" like '%"+value+"%'";
		}
		System.out.println(hql);
		return articleDao.findByHql(hql);
	}
}
