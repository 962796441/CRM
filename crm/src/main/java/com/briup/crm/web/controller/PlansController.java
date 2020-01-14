package com.briup.crm.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.crm.bean.SalChance;
import com.briup.crm.bean.SalPlan;
import com.briup.crm.bean.SysUser;
import com.briup.crm.bean.extend.SalChanceExtend;
import com.briup.crm.service.PlanService;
import com.briup.crm.service.SaleChanceService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/plans")
public class PlansController {
	@Autowired
	private SaleChanceService salservice; 
	@Autowired
	private SaleChanceService chanceService;
	@Autowired
	private PlanService planService;
	
	@RequestMapping("/findPlansByUserId/{curPage}")
	public String findPlansByUserId(@PathVariable int curPage,HttpSession session) {
		SysUser user = (SysUser)session.getAttribute("user");
		PageInfo<SalChance> pageInfo = salservice.findChancesByUserID(curPage, 5, user.getUsrName());
		session.setAttribute("chanceInfo", pageInfo);
		return "sales/plans";
	}
	
	@RequestMapping("/toPlan_add/{chanceId}")
	public String toPlan_add(@PathVariable long chanceId,HttpSession session) {
		SalChance chance = chanceService.findChanceById(chanceId);
		session.setAttribute("chance", chance);
		session.setAttribute("chanceId", chanceId);
		return "sales/plan_add";
	}
	
	@RequestMapping("/toPlan_edit/{chanceId}")
	public String toPlan_edit(@PathVariable long chanceId,HttpSession session) {
		SalChanceExtend chanceExtend = chanceService.findChanceWithPlansById(chanceId);
		session.setAttribute("chanceId", chanceId);
		session.setAttribute("chanceExtend", chanceExtend);
		return "sales/plan_edit";
	}
	
	@RequestMapping("/toPlan_detail/{id}")
	public String toPlan_detail(@PathVariable long id,HttpSession session) {
		SalChanceExtend chanceExtend = chanceService.findChanceWithPlansById(id);
		session.setAttribute("chanceExtend", chanceExtend);
		return "sales/plan_detail";
	}
	
	@RequestMapping("/addPlan")
	public String addPlan(SalPlan plan,HttpSession session) {
		long chanceId = (long)session.getAttribute("chanceId");
		planService.saveOrUpdatePlan(plan, chanceId);
		return "forward:/plans/findPlansByUserId/1";
	}
	
	@RequestMapping("/findPlanByPlanId/{id}")
	@ResponseBody
	public SalPlan findPlanByPlanId(@PathVariable int id,HttpSession session) {
		return planService.findPlanById(id);
	}
	
	@RequestMapping("/saveOrUpdatePlan")
	@ResponseBody
	public String saveOrUpdatePlan(SalPlan plan,HttpSession session) {
		long chanceId = (long)session.getAttribute("chanceId");
		planService.saveOrUpdatePlan(plan, chanceId);
		String url = "plans/toPlan_edit/" + chanceId;
		return url;
	}
	
	@RequestMapping("/deletPlanByPlaId/{plaId}")
	@ResponseBody
	public String deletPlanByPlaId(@PathVariable int plaId,HttpSession session) {
		long chanceId = (long)session.getAttribute("chanceId");
		planService.deletPlanByPlaId(plaId);
		String url = "plans/toPlan_edit/" + chanceId;
		return url;
	}
	
}
