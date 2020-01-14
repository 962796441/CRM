package com.briup.crm.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.crm.bean.CstCustomer;
import com.briup.crm.service.CustomerService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private CustomerService service;
	
	@RequestMapping("/findAllCustomer")
	public String findAllCustomer(HttpSession session) {
		System.out.println("in findAllUser");
//		List<CstCustomer> customerlist = service.findAllCusuomer();
//		session.setAttribute("customerlist", customerlist);
		return "customer/customer";
	}
	
	@RequestMapping("/findAllCustomerByPage/{curPage}")
	public String findAllCustomerByPage(@PathVariable int curPage,HttpSession session) {
//		System.out.println(curPage);
		PageInfo<CstCustomer> customerinfo  = service.findAllCustomerBypage(curPage, 5);
		session.setAttribute("customerinfo", customerinfo);
		return "customer/customer";
	}
	
	@RequestMapping("/SaveCustomer")
	@ResponseBody
	public String SaveCustomer(CstCustomer customer) {
		if(customer.getCustId() == null) {
			service.saveCustomer(customer);
			return "新增成功";
		}else {
			service.updateCustomerById(customer);
			return "更新成功";
		}

	}
	
	@RequestMapping("/deleteCustomerById/{custId}")
	@ResponseBody
	public String deleteCustomer(@PathVariable long custId) {
		service.deleteCustomerById(custId);
		return "删除成功";
	}
	
	@RequestMapping("/findCustomerById/{custId}")
	@ResponseBody
	public CstCustomer findCustomerById(@PathVariable long custId) {
		CstCustomer customer = service.findCustomerById(custId);
		return customer;
	}
	
	
	@RequestMapping("/findCustomerLike/{curPage}")
	public String findCustomerLike(@PathVariable int curPage,CstCustomer customer,HttpServletRequest requset) {
		PageInfo<CstCustomer> customerinfo = service.findCustomerLike(curPage, 5, customer);
		requset.setAttribute("customerinfo", customerinfo);
//		System.out.println(customerinfo.getTotal());
		return "customer/customer";
		
	}
}
