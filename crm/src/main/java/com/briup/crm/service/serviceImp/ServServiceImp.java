package com.briup.crm.service.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.CstService;
import com.briup.crm.bean.CstServiceExample;
import com.briup.crm.dao.CstServiceMapper;
import com.briup.crm.service.ServService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ServServiceImp implements ServService {
	@Autowired
	private CstServiceMapper servMapper;
	
	public PageInfo<CstService> findServiceByUsername(int curPage, int size, String username) {
		PageHelper.startPage(curPage, size);
		CstServiceExample example = new CstServiceExample();
		example.createCriteria().andSvrDisposeEqualTo(username);
		List<CstService> list = servMapper.selectByExample(example);
		PageInfo<CstService> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public PageInfo<CstService> findAllService(int curPage, int size) {
		PageHelper.startPage(curPage, size);
		CstServiceExample example = new CstServiceExample();
		List<CstService> list = servMapper.selectByExample(example);
		PageInfo<CstService> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public PageInfo<CstService> findServiceLike(int curPage, int size, CstService service) {
		PageHelper.startPage(curPage, size);
		CstServiceExample example = new CstServiceExample();
		
			example.createCriteria().andSvrCustNameLike("%"+service.getSvrCustName()+"%")
			.andSvrTypeLike("%"+service.getSvrType()+"%");
		List<CstService> list = servMapper.selectByExample(example);
		PageInfo<CstService> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public void saveOrUpdateService(CstService service) {
		if(service.getSvrId() == null) {
			int i = servMapper.insert(service);
		}else {
			int j = servMapper.updateByPrimaryKeySelective(service);
		}
		
	}

	@Override
	public CstService findServiceById(long svrId) {
		return servMapper.selectByPrimaryKey(svrId);
	}

	@Override
	public void saveFeedback(CstService service) {

		servMapper.updateByPrimaryKeySelective(service);
	}

	@Override
	public PageInfo<CstService> findServiceByTypeAndStatus(int curPage, int size, CstService service) {
		PageHelper.startPage(curPage, size);
		CstServiceExample example = new CstServiceExample();
		if(service.getSvrType() != "" && service.getSvrStatus() != "") {
			example.createCriteria().andSvrTypeEqualTo(service.getSvrType())
			.andSvrStatusEqualTo(service.getSvrStatus());			
		}else if(service.getSvrType() != ""){
			example.createCriteria().andSvrTypeEqualTo(service.getSvrType());
		}else if(service.getSvrStatus() != ""){
			example.createCriteria().andSvrStatusEqualTo(service.getSvrStatus());		
		}
		List<CstService> list = servMapper.selectByExample(example);
		PageInfo<CstService> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

}
