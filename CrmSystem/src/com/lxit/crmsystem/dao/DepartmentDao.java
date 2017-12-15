package com.lxit.crmsystem.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.lxit.crmsystem.entity.Department;
@MapperScan
public interface DepartmentDao {
	public List<Department> listDepartment();
	
	public List<Department> listDepartment2();
	
	int deleteDepartment(int departmentId);
	
	public Department listDepartOne(int departmentId);
	
	int updateDepartment(Department department);
	
	int insertDepartment(Department department);
}
