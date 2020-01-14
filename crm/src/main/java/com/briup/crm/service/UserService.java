package com.briup.crm.service;

import java.util.List;

import com.briup.crm.bean.SysUser;
import com.github.pagehelper.PageInfo;

public interface UserService {
	public SysUser login(String username,String password) throws Exception;
	
	public List<SysUser> findAllSysUser();
	
	public PageInfo<SysUser> findAllSysUser(int curPage,int size);
	
	public void saveOrUpdateUser(SysUser user);
	
	public SysUser findUserByUserId(long userId);
	
	public void deleteUser(long userId);
	
	public PageInfo<SysUser> findUsersByRolename(int curPage,int size,String usrRoleName);
}
