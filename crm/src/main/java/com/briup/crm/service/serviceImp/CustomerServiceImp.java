package com.briup.crm.service.serviceImp;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.CstCustomer;
import com.briup.crm.bean.CstCustomerExample;
import com.briup.crm.dao.CstCustomerMapper;
import com.briup.crm.service.CustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CustomerServiceImp implements CustomerService {
	@Autowired
	private CstCustomerMapper mapper;
	
	
	@Override
	public List<CstCustomer> findAllCustomer() {
		List<CstCustomer> list = mapper.selectByExample(new CstCustomerExample());
		return list;
	}


	public PageInfo<CstCustomer> findAllCustomerBypage(int curpage, int size) {
		PageHelper.startPage(curpage, size);
		CstCustomerExample exampe = new CstCustomerExample();
		List<CstCustomer> list = mapper.selectByExample(exampe);
		PageInfo<CstCustomer> customerInfo = new PageInfo<>(list);
		return customerInfo;
	}


	public void saveCustomer(CstCustomer customer) {
		mapper.insert(customer);
	}


	@Override
	public void deleteCustomerById(long custId) {
		mapper.deleteByPrimaryKey(custId);
	}


	@Override
	public CstCustomer findCustomerById(long custId) {
		CstCustomer customer = mapper.selectByPrimaryKey(custId);
		return customer;
	}


	@Override
	public void updateCustomerById(CstCustomer customer) {
		mapper.updateByPrimaryKey(customer);
	}


	@Override
	public PageInfo<CstCustomer> findCustomerLike(int curpage, int size, CstCustomer customer) {
		//设置当前是哪一页，以及每页显示几条数据
//		System.out.println(customer.getCustName());
//		System.out.println(customer.getCustRegion());
//		System.out.println(customer.getCustLevelLabel());
		PageHelper.startPage(curpage, size);
		//查询所有顾客信息
		CstCustomerExample example = new CstCustomerExample();
		//模糊查询
		example.createCriteria().andCustNameLike("%" + customer.getCustName() + "%")
								.andCustRegionLike("%" + customer.getCustRegion() + "%")
								.andCustLevelLabelLike("%" + customer.getCustLevelLabel() + "%");
		List<CstCustomer> customerlist = mapper.selectByExample(example);
		//将顾客信息放到传递给分页对象
		PageInfo<CstCustomer> customerinfo = new PageInfo<>(customerlist);
		return customerinfo;
	
	}

	
	
	@Override
	public float getRegionPercent(String region) {
		float percent = getRegionTotal(region) / getTotal();
		return percent;
	}
	
	public float getTotal() {
		float total = 0;
		List<CstCustomer> list = mapper.selectByExample(new CstCustomerExample());
		for (CstCustomer cstCustomer : list) {
			total += cstCustomer.getCustTurnover();
		}
		return total;
	}

	public float getRegionTotal(String region) {
		float sum = 0;
		CstCustomerExample example = new CstCustomerExample();
		example.createCriteria().andCustRegionEqualTo(region);
		List<CstCustomer> list = mapper.selectByExample(example);
		for (CstCustomer cstCustomer : list) {
			sum += cstCustomer.getCustTurnover();
		}
		return sum;
	}


	@Override
	public int findCustmerNumByLevel(String level) {
		CstCustomerExample example = new CstCustomerExample();
		example.createCriteria().andCustLevelLabelEqualTo(level);
		List<CstCustomer> list = mapper.selectByExample(example);
		return list.size();
	}


	@Override
	public int findCustmerNumByCredit(Integer credit) {
		CstCustomerExample example = new CstCustomerExample();
		example.createCriteria().andCustCreditEqualTo(credit);
		List<CstCustomer> list = mapper.selectByExample(example);
		return list.size();
	}


	@Override
	public int findCustmerNumBySatisfy(Integer satisfy) {
		CstCustomerExample example = new CstCustomerExample();
		example.createCriteria().andCustSatisfyEqualTo(satisfy);
		List<CstCustomer> list = mapper.selectByExample(example);
		return list.size();
	}


	@Override
	public Set<String> findAllLevel() {
		Set<String> levelSet = new HashSet<>();
		List<CstCustomer> custList = findAllCustomer();
		for (CstCustomer cstCustomer : custList) {
			levelSet.add(cstCustomer.getCustLevelLabel());
		}
		return levelSet;
	}


	@Override
	public Set<Integer> findAllCredit() {
		Set<Integer> creditlSet = new HashSet<>();
		List<CstCustomer> custList = findAllCustomer();
		for (CstCustomer cstCustomer : custList) {
			creditlSet.add(cstCustomer.getCustCredit());
		}
		return creditlSet;
	}


	@Override
	public Set<Integer> findAllSatisify() {
		Set<Integer> satisifySet = new HashSet<>();
		List<CstCustomer> custList = findAllCustomer();
		for (CstCustomer cstCustomer : custList) {
			satisifySet.add(cstCustomer.getCustSatisfy());
		}
		return satisifySet;
	}
	


}
