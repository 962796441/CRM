package com.briup.crm.service;

import com.briup.crm.bean.CstActivity;
import com.github.pagehelper.PageInfo;

public interface ActivtiesService {
	public PageInfo<CstActivity> findActivtiesById(long custId,int curPage);
	public void saveOrUpdate(CstActivity activtiy);
	public CstActivity findActivityById(long actId);
	public void deleteActivity(long actId); 
}
