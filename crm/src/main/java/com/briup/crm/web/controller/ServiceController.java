package com.briup.crm.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.crm.bean.CstService;
import com.briup.crm.service.ServService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/service")
public class ServiceController {
	@Autowired
	private ServService servService;
	
	@RequestMapping("/findServiceByUsername/{curPage}")
	public String findServiceByUsername(@PathVariable int curPage,HttpSession session) {
		String username = (String)session.getAttribute("username");
		PageInfo<CstService> pageInfo = servService.findServiceByUsername(curPage, 5, username);
		session.setAttribute("ServiceInfo", pageInfo);
//		session.setAttribute("URL", "service/findServiceByUsername/");
		return "service/service";
	}
	
	
	@RequestMapping("/findAllService/{curPage}")
	public String findAllService(@PathVariable int curPage,HttpSession session) {
		PageInfo<CstService> pageInfo = servService.findAllService(curPage, 5);
		session.setAttribute("ServiceInfo", pageInfo);
		return "service/service";
	}
	
	@RequestMapping("/findServiceLike/{curPage}")
	public String findServiceLike(@PathVariable int curPage,CstService service,HttpSession session) {
		PageInfo<CstService> pageInfo = servService.findServiceLike(curPage, 5, service);
		session.setAttribute("ServiceInfo", pageInfo);
//		session.setAttribute("URL", "service/findServiceLike/");
		return "service/service";
	}
	
	@RequestMapping("/saveOrUpdateService")
	@ResponseBody
	public String saveOrUpdateService(CstService service) {
		servService.saveOrUpdateService(service);
		return "保存成功";
	}
	
	@RequestMapping("/findServiceById/{servId}")
	@ResponseBody
	public CstService findServiceById(@PathVariable long servId) {
		CstService cstService = servService.findServiceById(servId);
		return cstService;
	}
	
	@RequestMapping("/toServiceDetail/{servId}")
	public String toServiceDetail(@PathVariable long servId,HttpSession session) {
		CstService cstService = servService.findServiceById(servId);
		session.setAttribute("cstService", cstService);
		return "service/serviceDetail";
	}
	
	@RequestMapping("/toFeedback/{curPage}")
	public String findAllServiceToFeedback(@PathVariable int curPage,HttpSession session) {
		PageInfo<CstService> pageInfo = servService.findAllService(curPage, 5);
		session.setAttribute("ServiceInfo", pageInfo);
		//System.out.println("size"+ pageInfo.getTotal());
		return "service/feedback";
	}
	
	@RequestMapping("/saveFeedback")
	@ResponseBody
	public String saveFeedback(CstService service) {
		service.setSvrStatus("已反馈");
		servService.saveFeedback(service);
		return "反馈成功";
	}
	
	@RequestMapping("/findServiceByTypeAndStatus/{curPage}")
	public String findServiceByTypeAndStatus(@PathVariable int curPage,CstService service,HttpSession session) {
		PageInfo<CstService> pageInfo = servService.findServiceByTypeAndStatus(curPage, 5, service);
		session.setAttribute("ServiceInfo", pageInfo);
//		System.out.println(pageInfo.getTotal());
		return "service/feedback";
	}
}
