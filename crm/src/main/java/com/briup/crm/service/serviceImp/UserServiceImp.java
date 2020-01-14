package com.briup.crm.service.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.SysUser;
import com.briup.crm.bean.SysUserExample;
import com.briup.crm.dao.SysUserMapper;
import com.briup.crm.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class UserServiceImp implements UserService {
	@Autowired
	private SysUserMapper userMapper;
	
	public SysUser login(String username, String password) throws Exception {
		SysUserExample example = new SysUserExample();
		example.createCriteria().andUsrNameEqualTo(username);
		List<SysUser> userlist = userMapper.selectByExample(example);
		
		if(!userlist.isEmpty()) {
			SysUser user = userlist.get(0);
			if(user.getUsrPassword().equals(password)) {
				return user;
			}else {
				throw new Exception("密码输入错误 请重新输入");
			}
		}else {
			throw new Exception("用户名输入错误 请重新输入");
		}
		
	}

	@Override
	public List<SysUser> findAllSysUser() {
		SysUserExample example = new SysUserExample();
		List<SysUser> list = userMapper.selectByExample(example);
		return list;
	}

	@Override
	public PageInfo<SysUser> findAllSysUser(int curPage,int size) {
		PageHelper.startPage(curPage, size);
		SysUserExample example = new SysUserExample();
		List<SysUser> list = userMapper.selectByExample(example);
		PageInfo<SysUser> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public void saveOrUpdateUser(SysUser user) {
		if(user.getUsrId() == null) {
			userMapper.insert(user);
		}else {
			userMapper.updateByPrimaryKeySelective(user);
		}
	}

	@Override
	public SysUser findUserByUserId(long userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	@Override
	public void deleteUser(long userId) {
		userMapper.deleteByPrimaryKey(userId);
	}

	@Override
	public PageInfo<SysUser> findUsersByRolename(int curPage, int size, String usrRoleName) {
		PageHelper.startPage(curPage, size);
		SysUserExample example = new SysUserExample();
		example.createCriteria().andUsrRoleNameEqualTo(usrRoleName);
		List<SysUser> list = userMapper.selectByExample(example);
		PageInfo<SysUser> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	
}
