package com.lwx.service;


import java.util.List;

import com.lwx.pojo.Dept;
import com.lwx.pojo.EasyUIDatagrid;
import com.lwx.pojo.Emp;

public interface DeptService {
	EasyUIDatagrid showDept(int pageSize,int pageNumber);
	
	//更新部门信息
	int update(Dept dept,int emp_id);
	
	//插入部门信息
	int insert(Dept dept,int emp_id);
	
	//根据dept_id数组删除部门
	int delete(int[] dept_id_array);
	
	//查询所有
	List<Dept> selAll(String emp_name);
	
	//根据dept_name查询dept_id
	boolean selByDept_name(String dept_name,int dept_id);
	
	//查找除了传入参数之外的不是经理的员工记录
	List<Emp> selEmpByNotDept_leader(String dept_leader);
	
	//清空除了无部门的所有部门
	int delEmptyDept();
}
