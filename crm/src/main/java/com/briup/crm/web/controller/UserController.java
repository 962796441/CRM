package com.briup.crm.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.crm.bean.SysRole;
import com.briup.crm.bean.SysUser;
import com.briup.crm.service.RoleService;
import com.briup.crm.service.UserService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@RequestMapping("/login")
	public String login(String username,String password,HttpSession session) {
		String url = "";
		try {
			List<SysUser> sys_user = userService.findAllSysUser();
			SysUser user = userService.login(username, password);
			session.setAttribute("username", user.getUsrName());
			session.setAttribute("user",user);
			session.setAttribute("sys_user",sys_user);
			url = "index";
		} catch (Exception e) {
			session.setAttribute("msg", e.getMessage());
			url = "login";
		}
		return url;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "login";
	}

	
	@RequestMapping("/toUserManage/{curPage}")
	public String toUserManage(@PathVariable int curPage,HttpSession session) {
		PageInfo<SysUser> pageInfo = userService.findAllSysUser(curPage,5);
		List<SysRole> rolelist = roleService.findAllRoles();
		session.setAttribute("sysuserInfo", pageInfo);
		session.setAttribute("rolelist", rolelist);
		return "system/user";
	}
	
	@RequestMapping("/saveOrUpdateUser")
	@ResponseBody
	public String saveOrUpdateUser (SysUser user) {
		SysRole role = roleService.findRoleById(user.getUsrRoleId());
		user.setUsrRoleName(role.getRoleName());
		userService.saveOrUpdateUser(user);
		return "保存成功";
	}
	
	@RequestMapping("/findUserByUserId")
	@ResponseBody
	public SysUser findUserByUserId(String usrId) {
		SysUser user = userService.findUserByUserId(Integer.parseInt(usrId));
		return user;
	}
	
	@RequestMapping("/deleteUser")
	@ResponseBody
	public String deleteUser (String usrId) {
		userService.deleteUser(Integer.parseInt(usrId)); 
		return "删除成功";
	}
	
	@RequestMapping("/findUserByRolename/{curPage}")
	public String findUserByRolename(@PathVariable int curPage,String usrRoleName,HttpSession session) {
		PageInfo<SysUser> pageInfo = userService.findUsersByRolename(curPage, 5, usrRoleName);
		session.setAttribute("sysuserInfo", pageInfo);
		return "system/user";
	}
}
