package com.briup.crm.service;

import java.util.List;

import com.briup.crm.bean.SysRole;

public interface RoleService {
	public List<SysRole> findAllRoles();
	
	public void saveOrUpdateRole(SysRole role);
	
	public SysRole findRoleById(long roleId);
	
	public void deleteRoleById(long roleId);
	
}
