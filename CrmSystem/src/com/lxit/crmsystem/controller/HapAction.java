package com.lxit.crmsystem.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxit.crmsystem.entity.DataDictionary;
import com.lxit.crmsystem.entity.Hap;
import com.lxit.crmsystem.entity.LinkMan;
import com.lxit.crmsystem.service.HapService;
import com.lxit.crmsystem.service.LinkmanService;
import com.lxit.crmsystem.util.Pager;
import com.lxit.crmsystem.util.Serialnumber;
import com.lxit.crmsystem.vo.HapVo;
import com.lxit.crmsystem.vo.Staffs;

@Controller
public class HapAction {
	
	@Autowired
	private HapService hapService;
	
	@ResponseBody
	@RequestMapping("/queryHapType")
	public List<DataDictionary> queryCodeData(){//查询机会类型
		List<DataDictionary> list = hapService.queryHapTypeValue();
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/pageByLikeMarketHap")
	public Map<String, Object> pageByLikeMarketHap(HttpSession session,int page,int rows,String name){
		
		Pager<HapVo> pager = hapService.selectByLike(page, rows, name);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pager.getSumCount());
		map.put("rows", pager.getData());
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/addHapPost")
	public String addHap(HttpSession session,Hap hap){
		 
		Staffs staff =   (Staffs) session.getAttribute("staff");
		int loginId = staff.getStaffId();
		String hapCoding = Serialnumber.Getnum("643");
		hap.setHap_code("JH"+hapCoding);
		hap.setHapSid(loginId);
		hap.setHapUpdateSid(loginId);
		
		int count = hapService.addHap(hap);
		if(count > 0){
			return "true";
		}
		return "false";
	}
	
	@ResponseBody
	@RequestMapping("/getHapById")
	public List<HapVo> getById(int hapId){
		
		HapVo vo = hapService.getById(hapId);
		List<HapVo> list = new ArrayList<HapVo>();
		list.add(vo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/updateHapPost")
	public String updateHap(Hap hap,HttpSession session){
		
		Staffs staff =   (Staffs) session.getAttribute("staff");
		int loginId = staff.getStaffId();
		hap.setHapUpdateSid(loginId);
		
		int count = hapService.updateHap(hap);
		if(count > 0){
			return "true";
		}
		return "false";
	}
	
	


	 
}
