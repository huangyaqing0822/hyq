package com.lxit.crmsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxit.crmsystem.dao.ClientDevelopDao;
import com.lxit.crmsystem.entity.ClientDevelop;
import com.lxit.crmsystem.service.ClientDevelopService;
import com.lxit.crmsystem.util.Pager;
import com.lxit.crmsystem.vo.ClientDevelopVo;
import com.lxit.crmsystem.vo.Clients;

@Service("clientDevelopService")
public class ClientDevelopServiceImpl implements ClientDevelopService {
	
	@Autowired
	ClientDevelopDao clientDevelopDao;

	@Override
	public int insert(ClientDevelop clientDevelop) {
		return clientDevelopDao.insert(clientDevelop);
	}

	@Override
	public int delete(int cdId) {
		return clientDevelopDao.delete(cdId);
	}

	@Override
	public int update(ClientDevelop clientDevelop) {
		return clientDevelopDao.update(clientDevelop);
	}

	@Override
	public Pager<ClientDevelopVo> query(int pageIndex, int pageSize, int cdUpdateSid,String likeMonth) {
		Pager<ClientDevelopVo> page = new Pager<>();
		page.setPageIndex(pageIndex);
		page.setPageSize(pageSize);
		page.setSumCount(clientDevelopDao.getCount(cdUpdateSid));
		Map<String, Object> map=new HashMap<>();
		map.put("pageIndex", (pageIndex-1) * pageSize);
		map.put("pageSize", pageSize);
		map.put("cdUpdateSid", cdUpdateSid);
		
		if(likeMonth!=null && likeMonth!=""){
			map.put("likeMonth","%"+likeMonth+"%");
		}else{
			map.put("likeMonth",likeMonth);
		}
		
		List<ClientDevelopVo> ClientDevelopVoList=clientDevelopDao.query(map);
		page.setData(ClientDevelopVoList);
		return page;
	}

	@Override
	public ClientDevelopVo queryClientDevelopById(int cdId) {
		return clientDevelopDao.queryClientDevelopById(cdId);
	}

	

}
