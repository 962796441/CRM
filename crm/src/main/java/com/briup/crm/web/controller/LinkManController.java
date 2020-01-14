package com.briup.crm.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.crm.bean.CstLinkman;
import com.briup.crm.service.LinkManService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/linkMan")
public class LinkManController {
	@Autowired
	private LinkManService service;
	
	@RequestMapping("/findLinkManById/{custId}/{curPage}")	
	public String findLinkManById(@PathVariable long custId,@PathVariable int curPage,HttpSession session) {
		PageInfo<CstLinkman> pageinfolist =  service.findAllLinkManById(custId, curPage, 5);
		session.setAttribute("pageinfolist", pageinfolist);
		session.setAttribute("custId", custId);
		return "customer/linkMan";
	}
	
	@RequestMapping("/deleteLinkManById/{lkmId}")
	@ResponseBody
	public String deleteLinkManById(@PathVariable long lkmId) {
		service.deleteLinkManById(lkmId);
		return "删除成功";
	}
	
	@RequestMapping("/save_update_LinkMan")
	@ResponseBody
	public String save_update_LinkMan(CstLinkman linkman,HttpSession session) {
		long custId = (long)session.getAttribute("custId");
		linkman.setLkmCustId(custId);
		service.save_update_LinkMan(linkman);
		if(linkman.getLkmId() == null) {
			return "新增成功";
		}else {
			return "修改成功";
		}
	}
	
	@RequestMapping("/findCstLinkmanById/{lkmId}")
	@ResponseBody
	public CstLinkman findCstLinkmanById(@PathVariable long lkmId) {
		CstLinkman linkman = service.findCstLinkmanById(lkmId);
		return linkman;
	}
}
