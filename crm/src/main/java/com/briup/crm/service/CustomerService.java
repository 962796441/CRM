package com.briup.crm.service;

import java.util.List;
import java.util.Set;

import com.briup.crm.bean.CstCustomer;
import com.github.pagehelper.PageInfo;

public interface CustomerService {
	public List<CstCustomer> findAllCustomer();
	
	public PageInfo<CstCustomer> findAllCustomerBypage(int curpage,int size);
	
	public void saveCustomer(CstCustomer customer);
	
	public void deleteCustomerById(long custId);
	
	public CstCustomer findCustomerById(long custId);
	
	public void updateCustomerById(CstCustomer customer);
	
	public PageInfo<CstCustomer> findCustomerLike(int curpage,int size,CstCustomer customer);
	
	public float getRegionPercent(String region);
	
	public int findCustmerNumByLevel(String level);
	
	public int findCustmerNumByCredit(Integer credit);
	
	public int findCustmerNumBySatisfy(Integer satisfy);
	
	//查询所有等级
	public Set<String> findAllLevel();
	
	//查询所有信誉度
	public Set<Integer> findAllCredit();
	
	//查询所有满意度
	public Set<Integer> findAllSatisify();
}
