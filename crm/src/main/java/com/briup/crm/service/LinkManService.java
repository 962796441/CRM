package com.briup.crm.service;

import com.briup.crm.bean.CstLinkman;
import com.github.pagehelper.PageInfo;

public interface LinkManService {
	public PageInfo<CstLinkman> findAllLinkManById (long custId,int curPage,int size);
	public void deleteLinkManById (long lkmId); 
	public void save_update_LinkMan(CstLinkman cstlinkman);
	public CstLinkman findCstLinkmanById(long lkmId);
}
