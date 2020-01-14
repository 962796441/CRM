package com.briup.crm.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.crm.bean.CstActivity;
import com.briup.crm.service.ActivtiesService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/Act")
public class ActivtiesController {
	@Autowired
	private ActivtiesService service;
	
	@RequestMapping("/findActivtiesBycustId/{custId}/{curPage}")
	public String findActivtiesByCustId(@PathVariable long custId,@PathVariable int curPage,HttpSession session) {
		PageInfo<CstActivity> pageInfo = service.findActivtiesById(custId, curPage);
		session.setAttribute("actitiesinfo", pageInfo);
		return "customer/activties";
	}
	
	@RequestMapping("/saveActivtiy")
	@ResponseBody
	public String saveActivtiy(CstActivity activtiy) {
		String res ="";
		if(activtiy.getAtvId() == null) {
			service.saveOrUpdate(activtiy);
			res = "新增成功";
		}else {
			service.saveOrUpdate(activtiy);
			res = "修改成功";
		}
		return res;
	}
	
	@RequestMapping("/findActivtiyById/{actId}")
	@ResponseBody
	public CstActivity findActivtiyById(@PathVariable long actId) {
		CstActivity activity = service.findActivityById(actId);
		return activity;
	}
	
	@RequestMapping("/deleteActivtiyById/{actId}")
	@ResponseBody
	public String deleteActivtiyById(@PathVariable long actId) {
		service.deleteActivity(actId);
		return "删除成功";
	}
}
