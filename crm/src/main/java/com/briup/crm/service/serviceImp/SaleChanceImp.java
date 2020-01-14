package com.briup.crm.service.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.SalChance;
import com.briup.crm.bean.SalChanceExample;
import com.briup.crm.bean.extend.SalChanceExtend;
import com.briup.crm.dao.SalChanceMapper;
import com.briup.crm.dao.extend.SalChanceExtendMapper;
import com.briup.crm.service.SaleChanceService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SaleChanceImp implements SaleChanceService {
	@Autowired
	private SalChanceMapper mapper;
	
	@Autowired
	private SalChanceExtendMapper  extendMapper;
	@Override
	
	public PageInfo<SalChance> findSalChance(int curPage, int size) {
		PageHelper.startPage(curPage, size);
		SalChanceExample example = new SalChanceExample();
		List<SalChance> list = mapper.selectByExample(example);
		PageInfo<SalChance> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
	@Override
	public PageInfo<SalChance> findSalChanceLike(int curPage, int size, String custName, String custRegion) {
		PageHelper.startPage(curPage, size);
		SalChanceExample example = new SalChanceExample();
		example.createCriteria().andChcCustNameLike("%"+custName+"%")
		.andChcAddrLike("%"+custRegion+"%");
		List<SalChance> list = mapper.selectByExample(example);
		PageInfo<SalChance> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
	@Override
	public void saveOrUpdata(SalChance chance) {
		if(chance.getChcId() == null) {
			chance.setChcStatus(1);
			mapper.insert(chance);
		}else {
			mapper.updateByPrimaryKeySelective(chance);
		}
		
	}
	@Override
	public SalChance findChanceById(long chcId) {
		SalChance chance = mapper.selectByPrimaryKey(chcId);
		return chance;
	}
	@Override
	public void deleteChanceById(long chcId) {
		mapper.deleteByPrimaryKey(chcId);
	}
	@Override
	public PageInfo<SalChance> findChancesByUserID(int curPage,int size,String dueTO) {
		PageHelper.startPage(curPage, size);
		SalChanceExample example = new SalChanceExample();
		example.createCriteria().andChcDueToEqualTo(dueTO);
		List<SalChance> list = mapper.selectByExample(example);
		PageInfo<SalChance> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
	@Override
	public SalChanceExtend findChanceWithPlansById(long id) {
		SalChanceExtend salChanceExtend = extendMapper.selectChanceWithPlansById(id);
		return salChanceExtend;
	}
	@Override
	public PageInfo<SalChance> findChanceByAddr(int curPage,int size,SalChance chacne) {
		PageHelper.startPage(curPage, size);
		SalChanceExample example = new SalChanceExample();
		example.createCriteria().andChcAddrLike("%"+chacne.getChcAddr()+"%");
		List<SalChance> list = mapper.selectByExample(example);
		PageInfo<SalChance> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
	@Override
	public void chanceSucceedById(long chanceId) {
		SalChance chance = new SalChance();
		chance.setChcId(chanceId);
		chance.setChcStatus(3);
		mapper.updateByPrimaryKeySelective(chance);
	}

}
