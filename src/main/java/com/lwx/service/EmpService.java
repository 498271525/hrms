package com.lwx.service;

import com.lwx.pojo.EasyUIDatagrid;
import com.lwx.pojo.Emp;

public interface EmpService {
	
	//显示员工表
	EasyUIDatagrid showEmp(int pageSize,int pageNumber);
	
	//更新员工记录
	int update(Emp emp,int dept_id);
	
	//查看是否有重复邮箱
	boolean selByEmail(String email,int emp_id);
	
	//插入emp
	int insEmp(Emp emp,int dept_id);
	
	//根据id删除记录
	int delEmp(int[] array_emp_id);
	
	//清空emp表（表没删除）
	int delEmptyEmp();
	
	
}
