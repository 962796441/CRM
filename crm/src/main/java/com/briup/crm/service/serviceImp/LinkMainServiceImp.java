package com.briup.crm.service.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.crm.bean.CstLinkman;
import com.briup.crm.bean.CstLinkmanExample;
import com.briup.crm.dao.CstLinkmanMapper;
import com.briup.crm.service.LinkManService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class LinkMainServiceImp implements LinkManService {
	@Autowired
	public CstLinkmanMapper mapper;
	
	@Override
	public PageInfo<CstLinkman> findAllLinkManById(long custId, int curPage,int size) {
		PageHelper.startPage(curPage, size);
//		System.out.println(custId);
//		System.out.println(curPage);
//		System.out.println(size);
		CstLinkmanExample example = new CstLinkmanExample();
		example.createCriteria().andLkmCustIdEqualTo(custId);
		List<CstLinkman> list = mapper.selectByExample(example);
		PageInfo<CstLinkman> pageinfo = new PageInfo<>(list);
//		System.out.println(pageinfo.getTotal());
		return pageinfo;
	}

	@Override
	public void deleteLinkManById(long lkmId) {	
		mapper.deleteByPrimaryKey(lkmId);
	}

	@Override
	public void save_update_LinkMan(CstLinkman cstlinkman) {
		if(cstlinkman.getLkmId() == null) {
			mapper.insert(cstlinkman);
		}else {
			mapper.updateByPrimaryKey(cstlinkman);
		}
	}

	@Override
	public CstLinkman findCstLinkmanById(long lkmId) {
		CstLinkman linkman = mapper.selectByPrimaryKey(lkmId);
		return linkman;
	}


	
}
