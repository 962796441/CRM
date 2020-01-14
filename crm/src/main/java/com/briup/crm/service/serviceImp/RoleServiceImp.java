package com.briup.crm.service.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.SysRole;
import com.briup.crm.bean.SysRoleExample;
import com.briup.crm.dao.SysRoleMapper;
import com.briup.crm.service.RoleService;
@Service
public class RoleServiceImp implements RoleService {
	@Autowired
	private SysRoleMapper roleMapper;
	
	@Override
	public List<SysRole> findAllRoles() {
		List<SysRole> list = roleMapper.selectByExample(new SysRoleExample());
		return list;
	}

	@Override
	public void saveOrUpdateRole(SysRole role) {
		if(role.getRoleId() == null) {
			roleMapper.insert(role);
		}else {
			roleMapper.updateByPrimaryKeySelective(role);
		}
	}

	@Override
	public SysRole findRoleById(long roleId) {
		return roleMapper.selectByPrimaryKey(roleId);
	}

	@Override
	public void deleteRoleById(long roleId) {
		roleMapper.deleteByPrimaryKey(roleId);
	}

}
