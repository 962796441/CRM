package com.briup.crm.service.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.SalChance;
import com.briup.crm.bean.SalPlan;
import com.briup.crm.dao.SalChanceMapper;
import com.briup.crm.dao.SalPlanMapper;
import com.briup.crm.service.PlanService;

@Service
public class PlanServiceImp implements PlanService{
	@Autowired
	private SalChanceMapper chanceMapper;
	
	@Autowired
	private SalPlanMapper planMapper;
	
	@Override
	public void saveOrUpdatePlan(SalPlan plan,long chcId) {
		if(plan.getPlaId() == null) {
			plan.setPlaChcId(chcId);
			planMapper.insertSelective(plan);	
			SalChance chance = chanceMapper.selectByPrimaryKey(chcId);
			chance.setChcStatus(2);
			chanceMapper.updateByPrimaryKey(chance);
		}else {
			planMapper.updateByPrimaryKeySelective(plan);
		}

	}

	@Override
	public SalPlan findPlanById(long plaId) {
		return planMapper.selectByPrimaryKey(plaId);
	}

	@Override
	public void deletPlanByPlaId(long plaId) {
		planMapper.deleteByPrimaryKey(plaId);
	}


	
	
}
