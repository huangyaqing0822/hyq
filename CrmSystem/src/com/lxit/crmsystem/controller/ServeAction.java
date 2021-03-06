package com.lxit.crmsystem.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.lxit.crmsystem.entity.Serve;
import com.lxit.crmsystem.entity.Staff;
import com.lxit.crmsystem.service.ServeService;
import com.lxit.crmsystem.service.StaffService;
import com.lxit.crmsystem.util.Pager;
import com.lxit.crmsystem.vo.ServeVo;
import com.lxit.crmsystem.vo.Staffs;

@Controller
@RequestMapping("/ServerAction")
public class ServeAction {
	@Autowired
	ServeService serveService;
	@Autowired
	StaffService staffService;
	@ResponseBody
	@RequestMapping("/addPost")
	public String add(Serve serve,HttpSession session){
		String sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); 
		Staffs staff=(Staffs) session.getAttribute("staff");
		serve.setServeState(35);
		serve.setServeUpdateTime(sdf);
		serve.setServeCreateTime(sdf);
		serve.setServeManageName(staff.getStaffId());
		serveService.add(serve);
		return "true";
	}
	
	@ResponseBody
	@RequestMapping("/queryById")
	public Map<String, Object> queryById(HttpSession session,int page,int rows,String flag,String likeName,String likeType,String likeState){
		Staffs staff=(Staffs) session.getAttribute("staff");
		Pager<ServeVo> ListServe=serveService.query(page,rows,staff.getStaffId(),flag,staff.getDepartmentId(),likeName,likeType,likeState);
		Map<String, Object> map=new HashMap<>();
		map.put("total", ListServe.getSumCount());
		map.put("rows", ListServe.getData());
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public String delete(int id){
		int count=serveService.delete(id);
		if(count>0){
			return "true";
		}
		return "false";
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public ServeVo update(int serveId,HttpSession session){
		ServeVo serve=serveService.queryOne(serveId);
		return serve;	
	}
	
	@ResponseBody
	@RequestMapping("/updatePost")
	public String updatePost(ServeVo ser){
		String sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); 
		Serve serve=new Serve();
		serve.setServeType(Integer.parseInt(ser.getDataType()));
		serve.setServeUpdateTime(sdf);
		serve.setServeContent(ser.getServeContent());
		serve.setServeRemark(ser.getServeRemark());
		serve.setServePhone(ser.getServePhone());
		serve.setServeId(ser.getServeId());
		serveService.update(serve);
		return "true";
	}
	
	@ResponseBody
	@RequestMapping("/updateState")
	public String updateState(String serveId,String serveStayhandle,HttpSession session){
		Map<String, Object> map=new HashMap<>();
		String sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); 
		Staffs staff=(Staffs) session.getAttribute("staff");
		if(serveStayhandle==null){
			Staffs staff2=staffService.queryBoss(staff.getStaffId());
			map.put("stayhandle", staff2.getStaffId());
			map.put("serveState", 36);
		}else{
			map.put("stayhandle", Integer.parseInt(serveStayhandle));
			map.put("serveState", 37);
		}
		map.put("serveManageName", staff.getStaffId());
		map.put("serveId", Integer.parseInt(serveId));
		map.put("updateDate", sdf);
		
		int count=serveService.updateState(map);
		if(count>0){
			return "true";
		}
		return "false";
	}
	
	@ResponseBody
	@RequestMapping("/queryStaff")
	public List<Staffs > queryStaff(HttpSession session){
		Staffs staff=(Staffs) session.getAttribute("staff");
		return staffService.queryStaff(staff.getStaffId());
	}
	
	@ResponseBody
	@RequestMapping("/updateHandle")
	public String updateHandleState(Serve serve,String array,HttpSession session){
		
		String sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); 
		Staffs staff=(Staffs) session.getAttribute("staff");
		serve.setServeManageName(staff.getStaffId());
		serve.setServeUpdateTime(sdf);
		if(array!=null){
			serve.setServeState(80);
			serve.setServeRemark("已归档");
			String[] serveId=array.split(",");
			for (int i = 0; i < serveId.length; i++) {
				serve.setServeId(Integer.parseInt(serveId[i]));
				serveService.updateHandle(serve);
			}
			return "true";
		}else{
			
		}
		int count=serveService.updateHandle(serve);
		if(count>0){
			return "true";
		}
		return "false";
	}
	
}
