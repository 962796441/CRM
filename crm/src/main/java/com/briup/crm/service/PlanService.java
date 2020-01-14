package com.briup.crm.service;

import com.briup.crm.bean.SalPlan;

public interface PlanService {
	public void saveOrUpdatePlan(SalPlan plan,long chanceId);
	public SalPlan findPlanById(long Id);
	public void deletPlanByPlaId(long Id);
}
