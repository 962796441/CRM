package com.briup.crm.service;

import com.briup.crm.bean.CstService;
import com.github.pagehelper.PageInfo;

public interface ServService {
	public PageInfo<CstService> findServiceByUsername (int curPage,int size,String username);
	public PageInfo<CstService>	findAllService (int curPage,int size); 
	public PageInfo<CstService> findServiceLike (int curPage,int size,CstService service);
	public void saveOrUpdateService(CstService service);
	public CstService findServiceById(long Id); 
	public void saveFeedback(CstService service);
	
	public PageInfo<CstService> findServiceByTypeAndStatus (int curPage,int size,CstService service);
}
