package com.briup.crm.service.serviceImp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.Contribution;
import com.briup.crm.dao.CstCustomerMapper;
import com.briup.crm.dao.extend.CustomerExtendMapper;
import com.briup.crm.service.ContributionService;
@Service
public class ContributionServiceImp implements ContributionService {
	@Autowired
	private CustomerExtendMapper extendMapper;
	
	@Autowired
	private CustomerServiceImp custService;
	
	@Override
	public List<Contribution> findContribution() {
		List<String> regionList = extendMapper.selectRegion();
		ArrayList<Contribution> list = new ArrayList<Contribution>();
		for (String region : regionList) {
			Contribution con = new Contribution();
			
			con.setName(region);
			con.setY(custService.getRegionPercent(region));
			list.add(con);
		}
		return list;
	}

	@Override
	public List<Contribution> findContributionByRegion(String region) {
		List<Contribution> conlist = new ArrayList<Contribution>();
		Contribution con = new Contribution();
		con.setName(region);
		con.setY(custService.getRegionPercent(region));
		conlist.add(con);
		return conlist;
	}
}
