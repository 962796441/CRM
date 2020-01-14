package com.briup.crm.service.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.CstActivity;
import com.briup.crm.bean.CstActivityExample;
import com.briup.crm.dao.CstActivityMapper;
import com.briup.crm.service.ActivtiesService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ActivtiesServiceImp implements ActivtiesService {
	@Autowired
	private CstActivityMapper mapper;
	
	
	@Override
	public PageInfo<CstActivity> findActivtiesById(long custId,int curPage) {
		PageHelper.startPage(curPage, 5);
		
		CstActivityExample example = new CstActivityExample();
		example.createCriteria().andAtvCustIdEqualTo(custId);
		List<CstActivity> list = mapper.selectByExample(example);
		PageInfo<CstActivity> info = new PageInfo<>(list);
		return info;
	}


	@Override
	public void saveOrUpdate(CstActivity activtiy) {
		if(activtiy.getAtvId() == null) {
			mapper.insert(activtiy);
		}else {
			mapper.updateByPrimaryKey(activtiy);
		}
		
	}


	@Override
	public CstActivity findActivityById(long actId) {
		
		return mapper.selectByPrimaryKey(actId);
	}


	@Override
	public void deleteActivity(long actId) {
		mapper.deleteByPrimaryKey(actId);
	}

}
