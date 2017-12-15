package com.lxit.crmsystem.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.lxit.crmsystem.entity.Staff;
import com.lxit.crmsystem.vo.Staffs;
/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
@MapperScan
public interface StaffDao {
	/**
	 * 登录
	 * @param map
	 * @return
	 */
	public List<Staffs> queryByIdAndPass(Map<String, Object> map);

	public List<Staffs> selectStaff(Map<String,Object> map);
	
	public int selectStaffCount(Map<String,Object> map);
 
	/**
	 * 通过员工的id查上司
	 * @param sid
	 * @return
	 */

	public int insertStaff(Staff staff);
	public int updateStaff(Staff staff);
	/**
	 * 
	 * 删除员工
	 * @param staffId
	 * @return
	 */
	public int deleteStaff(int staffId);
	/**
	 * 删除权限连接关系
	 * @param staffId
	 * @return
	 */
	public int deleteTwo(int staffId); 
	
	public List<Staffs> selectStaffs(int staffId);

	
	/*
	 * 查BOss
	 */
	public Staffs queryBoss(int sid);
	
	/**通过上司id差员工
	 * @param bossId
	 * @return
	 */
	public List<Staffs > queryStaff(int bossId);
	
	/**
	 * 查询权限员工连接表
	 * @param map
	 * @return
	 */
	public int insertRoleStaff(Map<String,Object> map);
	
	/**
	 * 修改id
	 * @param map
	 * @return
	 */
	public int updatLoginName(Map map);
	
	/**
	 * 修改手机号码
	 * @param map
	 * @return
	 */
	public int updattephone(Map map);
	
	
	public Staffs selectPass(Map map);
	
	public int updatPass(Map maps);
	
	
	public int selectStaffOne(int staffId);
}
