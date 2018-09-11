package com.briup.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.BasicInfo;
import com.briup.cms.common.exception.ServiceException;
import com.briup.cms.dao.BasicInfoDao;
import com.briup.cms.service.IBasicInfoService;

@SuppressWarnings("all")
@Service("basicInfoService")
public class BasicInfoServiceImpl implements IBasicInfoService{
	@Autowired
	private BasicInfoDao basicInfoDao;
	
	private List<BasicInfo> basicInfoList;
	
	public static Map<String,Long> map2;
	@Override
	public void saveOrUpdateBasicInfo(BasicInfo... basicInfos) throws ServiceException {
		int bil = basicInfos.length;
		basicInfoList= basicInfoDao.findAll();
		if(basicInfoList!=null&&basicInfoList.size()!=0){
			String hql = "from BasicInfo b where b.name=?";
			for(int i=0; i<bil; i++){
				Object os = basicInfos[i].getName();
				List<BasicInfo> bl = basicInfoDao.findByHql(hql, os);		
					bl.get(0).setContent(basicInfos[i].getContent());
					basicInfoDao.saveOrUpdate(bl.get(0));
				}
		}
		else{
			for(int i=0;i<bil;i++){
				basicInfoDao.saveOrUpdate(basicInfos[i]);
			}	
		}
	}
	@Override
	public Map<String, String> findAllBasicInfo() throws ServiceException {
		basicInfoList= basicInfoDao.findAll();
		Map<String, String> map = new HashMap<String, String>();
		   map2 = new HashMap<String,Long>();
		  for(BasicInfo d:basicInfoList){
			  map.put(d.getName(), d.getContent());
			  map2.put(d.getName(),d.getId());
		  }
	     return map;
	}
}
