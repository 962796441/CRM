package com.briup.crm.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.crm.bean.SysRole;
import com.briup.crm.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	
	@RequestMapping("/toRoleManage")
	public String toRoleManage(HttpSession session) {
		List<SysRole> list = roleService.findAllRoles();
		session.setAttribute("roleList", list);
		return "system/role";
	}
	
	@RequestMapping("/saveOrUpdateRole")
	@ResponseBody
	public String saveOrUpdateRole(SysRole role) {
		roleService.saveOrUpdateRole(role);
		return "保存成功";
	}
	
	@RequestMapping("/findRoleById/{roleId}")
	@ResponseBody
	public SysRole findRoleById(@PathVariable long roleId) {
		SysRole sysRole = roleService.findRoleById(roleId);
		return sysRole;
	}
	
	@RequestMapping("/deleteRoleById/{roleId}")
	@ResponseBody
	public String deleteRoleById(@PathVariable long roleId) {
		roleService.deleteRoleById(roleId);
		return "删除成功";
	}
}
