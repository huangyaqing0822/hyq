package com.lxit.crmsystem.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxit.crmsystem.entity.MarketForecast;
import com.lxit.crmsystem.entity.MarketPm;
import com.lxit.crmsystem.entity.Staff;
import com.lxit.crmsystem.service.MarketPmService;
import com.lxit.crmsystem.service.StaffService;
import com.lxit.crmsystem.util.Pager;
import com.lxit.crmsystem.util.Serialnumber;
import com.lxit.crmsystem.vo.MarketPmVo;
import com.lxit.crmsystem.vo.Staffs;

@Controller
public class MarketPmAction {
	
	@Autowired
	MarketPmService marketPmService;
	
	@ResponseBody
	@RequestMapping("/pageByLikeMarketPm")
	public Map<String, Object> pageByLike(HttpSession session,int page,int rows,String name){
		Pager<MarketPmVo> pager = marketPmService.selectByLike(page, rows, name);
		//System.out.println("sumcount : "+pager.getSumCount()  +  "rows : "+rows  + "page : "+page);
		//System.out.println("绩效。。。。。。。。。。 : "+pager.getData());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", pager.getSumCount());
		map.put("rows", pager.getData());
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/queryStaffName")
	public List<Staff> listStaff(HttpSession session){
		Staffs staff =   (Staffs) session.getAttribute("staff");
		int loginId = staff.getStaffId();
		
		List<Staff> list = marketPmService.listStaff(loginId);
		return list;
	} 
	
	@ResponseBody
	@RequestMapping("/addMarketPmPost")
    public String addMarketPmPost(MarketPm marketPm,HttpSession session){
    
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
		Staffs staff =   (Staffs) session.getAttribute("staff");
		int loginId = staff.getStaffId();
		//随机数:绩效编码
		String marketPmCoding = Serialnumber.Getnum("643");
		
		marketPm.setOperateId(loginId);
		marketPm.setMarketPmCoding("JX"+marketPmCoding);
		marketPm.setMarketPmCreateTime(time);
		marketPm.setMarketPmUpdateTime(time);
		
		
		int count = marketPmService.addMarketPm(marketPm);
		if(count > 0){
			return "true";
		}
		return "false";
    }

	@ResponseBody
	@RequestMapping("/getMarketPmById")
	public List<MarketPmVo> getByIdPm(int marketPmId){
		MarketPmVo pm = marketPmService.getById(marketPmId);
		List<MarketPmVo> list = new ArrayList<MarketPmVo>();
		list.add(pm);
		//System.out.println("getByIdPm ...........: "+list);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping("/delPostMarketPm")
	public String delMarketPm(int marketPmId){
		int count = marketPmService.delMarketPm(marketPmId);
		if(count > 0){
		}
		return "true";
	}
	
	@ResponseBody
	@RequestMapping("/updatPost_marketPm")
	public String updatPost_marketPm(MarketPm marketPm){
		int count = marketPmService.updateMarketPm(marketPm);
		if(count > 0){
			return "true";
		}
		return "false";
		
	}

}
