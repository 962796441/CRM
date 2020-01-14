package com.briup.crm.service.serviceImp;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.Contribution;
import com.briup.crm.service.ConstituteService;
import com.briup.crm.service.CustomerService;
@Service
public class ContituteServiceImp implements ConstituteService{
	@Autowired
	private CustomerService custService;
	
	@Override
	public List<Contribution> findCustMarkup(int condition) {
		int SUM = custService.findAllCustomer().size();
		float percent = 0;
		List<Contribution> list = new ArrayList<Contribution>();
		switch (condition) {
		//按等级
		case 0:
			Set<String> levelSet = custService.findAllLevel();
			for (String level : levelSet) {
				Contribution con = new Contribution();
				int size = custService.findCustmerNumByLevel(level);
				con.setName(level);
				percent = (float)size / SUM;
				con.setY(percent);
				list.add(con);
			}
			break;
		//按信誉度
		case 1:
			Set<Integer> creditSet = custService.findAllCredit();
			for (Integer credit : creditSet) {
				Contribution con = new Contribution();
				int size = custService.findCustmerNumByCredit(credit);
				percent = (float)size / SUM;
				con.setName(credit.toString());
				con.setY(percent);
				list.add(con);
			}			
			break;
		//按满意度
		case 2:
			Set<Integer> satisifySet = custService.findAllSatisify();
			for (Integer satisfy: satisifySet) {
				Contribution con = new Contribution();
				int size = custService.findCustmerNumBySatisfy(satisfy);
				percent = (float)size / SUM;
				con.setName(satisfy.toString());
				con.setY(percent);
				list.add(con);	
			}
			break;			
		}

		return list;
	}

}
