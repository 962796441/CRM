package com.briup.crm.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.crm.bean.SalChance;
import com.briup.crm.bean.extend.SalChanceExtend;
import com.briup.crm.service.SaleChanceService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/sales")
public class SaleController {
	@Autowired
	private SaleChanceService service;
	
	@RequestMapping("/findSalesChance/{curpage}")
	public String findSaleChance(@PathVariable int curpage,HttpServletRequest request) {
		PageInfo<SalChance> pageInfo = service.findSalChance(curpage, 5);
		request.setAttribute("pageInfo", pageInfo);
		return "sales/sales";
	}
	
	@RequestMapping("findChanceLike/{curPage}")
	public String findChanceLike(@PathVariable int curPage,String chcCustName,String chcAddr,HttpServletRequest requset) {
		PageInfo<SalChance> pageInfo = service.findSalChanceLike(curPage, 5, chcCustName, chcAddr);
		requset.setAttribute("pageInfo", pageInfo);
		return "sales/sales";
	}
	
	@RequestMapping("/saveOrUpdata")
	@ResponseBody
	public String saveOrUpdata(SalChance chance) {
		if(chance.getChcId() == null) {
			service.saveOrUpdata(chance);
			return "保存成功";
		}else {
			service.saveOrUpdata(chance);
			return "更新成功";
		}
	}
	
	@RequestMapping("/findChanceById/{chcId}")
	@ResponseBody
	public SalChance findChanceById(@PathVariable long chcId) {
		SalChance chance = service.findChanceById(chcId);
		return chance;
	}
	
	@RequestMapping("/deleteChanceById/{chcId}")
	@ResponseBody
	public String deleteChanceById(@PathVariable long chcId) {
		service.deleteChanceById(chcId);
		return "删除成功";
	}
	
	
	@RequestMapping("findChanceByAddr/{curPage}")
	public String findChanceByAddr(@PathVariable int curPage,SalChance chance,HttpServletRequest requset) {
		PageInfo<SalChance> pageInfo = service.findChanceByAddr(curPage, 5, chance);
		requset.setAttribute("chanceInfo", pageInfo);
		return "sales/plans";
	}
	
	@RequestMapping("/chanceSucceedById")
	public String chanceSucceedById(HttpSession session) {
		long chanceId = (long)session.getAttribute("chanceId");
		service.chanceSucceedById(chanceId);
		String url = "forward:/plans/toPlan_detail/"+chanceId ;
		return url;
	}
}
