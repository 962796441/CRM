package com.briup.crm.service;


import com.briup.crm.bean.SalChance;
import com.briup.crm.bean.extend.SalChanceExtend;
import com.github.pagehelper.PageInfo;


public interface SaleChanceService {
	public PageInfo<SalChance> findSalChance(int curPage,int size);
	public PageInfo<SalChance> findSalChanceLike(int curPage,int size,String custName,String custRegion);
	public void saveOrUpdata(SalChance chance);
	public SalChance findChanceById(long chcId);
	public void deleteChanceById(long chcId);
	public PageInfo<SalChance> findChancesByUserID(int curPage,int size,String dueTO);
	public SalChanceExtend findChanceWithPlansById(long id);
	public PageInfo<SalChance> findChanceByAddr(int curPage,int size,SalChance chacne);
	public void chanceSucceedById(long chanceId);
}
