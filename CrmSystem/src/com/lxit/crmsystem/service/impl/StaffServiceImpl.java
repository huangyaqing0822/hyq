package com.lxit.crmsystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxit.crmsystem.dao.StaffDao;
import com.lxit.crmsystem.entity.Staff;
import com.lxit.crmsystem.service.StaffService;
import com.lxit.crmsystem.util.Pager;
import com.lxit.crmsystem.vo.Staffs;

@Service("staffService")
public class StaffServiceImpl implements StaffService{
	@Autowired
	StaffDao staffDao;

	@Override
	public Staffs queryByIdAndPass(String name, String pass) {
		Map<String, Object> map=new HashMap<>();
		map.put("name", name);
		map.put("pass", pass);
		List<Staffs> staffs = staffDao.queryByIdAndPass(map);
		return shaiXuan(staffs);
		
	}
  
	//求出同部门最高等级角色
	public Staffs shaiXuan(List<Staffs> staffs){
		if(staffs.size()>0){
			int count = 0;
			for (Staffs staffs2 : staffs) {
				for (Staffs staffs3 : staffs) {
					if(staffs2.getStaffNid()==staffs3.getStaffRid()){
						count++;
					}
				}
				if(count==0){
					return staffs2;
				}
			}
		}
		return staffs.isEmpty() ? null :staffs.get(0);
	}
	
	  
	@Override
	public Pager<Staffs> selectStaff(Map<String,Object> map,Pager<Staffs> staff) {
		List<Staffs> ls = staffDao.selectStaff(map);
		staff.setData(ls);
		int count = staffDao.selectStaffCount(map);
		staff.setSumCount(count);
		return staff;
	}
     
	@Override
	public int insertStaff(Staff staff) {
		return staffDao.insertStaff(staff);
	}

	@Override
	public Staffs selectStaffs(int staffId) {
		return shaiXuan(staffDao.selectStaffs(staffId));
		
	}

	@Override
	public Staffs queryBoss(int sid) {
		return staffDao.queryBoss(sid);
	}

	@Override
	public List<Staffs > queryStaff(int bossId) {
		return staffDao.queryStaff(bossId);
	}

	@Override
	public int updateStaff(Staff staff) {
		return staffDao.updateStaff(staff);
	}

	@Override
	public int deleteStaff(int staffId) {
		staffDao.deleteTwo(staffId);
		return staffDao.deleteStaff(staffId);
	}

	@Override
	public int deleteTwo(int staffId) {
		return staffDao.deleteTwo(staffId);
	}

	@Override
	public int insertRoleStaff(Map<String, Object> map) {
		return staffDao.insertRoleStaff(map);
	}

	@Override
	public int updatLoginName(Map map) {
		return staffDao.updatLoginName(map);
	}

	@Override
	public int updattephone(Map map) {
		return staffDao.updattephone(map);
	}

	@Override
	public Staffs selectPass(Map map) {
		return staffDao.selectPass(map);
	}

	@Override
	public int updatPass(Map maps) {
		return staffDao.updatPass(maps);
	}

	@Override
	public boolean selectStaffOne(int staffId) {
		return staffDao.selectStaffOne(staffId)>0?true:false;
	}

	
}
