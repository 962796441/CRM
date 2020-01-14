package com.briup.crm.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.crm.bean.Contribution;
import com.briup.crm.service.ConstituteService;
import com.briup.crm.service.ContributionService;
import com.briup.crm.service.CustomerService;

@Controller
@RequestMapping("/report")
public class ReportController {
	@Autowired
	private ContributionService conService;
	@Autowired
	private ConstituteService contrService;

	
	@RequestMapping("/toContribution")
	public String toContribution() {
		
		return "report/customerContribution";
	}
	
	@RequestMapping("/getContribution")
	@ResponseBody
	public List<Contribution> getContribution(){
		List<Contribution> list = conService.findContribution();
		return list;
	}
	
	@RequestMapping("/getContributionByRegion")
	@ResponseBody
	public List<Contribution> getContributionByRegion(String region){
		 List<Contribution> list = conService.findContributionByRegion(region);
		return list;
	}
	
	@RequestMapping("/toCustConstitute")
	private String toCustConstitute() {
		
		return "report/customerConstitute";
	}
	
	@RequestMapping("/getCustConstitue")
	@ResponseBody
	public List<Contribution>  getCustConstitue(String condition){
		List<Contribution> list = contrService.findCustMarkup(Integer.parseInt(condition));
//		 for (Contribution contribution : list) {
//			System.out.println(contribution.toString());
//		}
		return list;
	}
}
