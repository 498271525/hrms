package com.lwx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.lwx.mapper.DeptMapper;
import com.lwx.mapper.EmpMapper;
import com.lwx.mapper.Emp_deptMapper;
import com.lwx.pojo.Dept;
import com.lwx.pojo.EasyUIDatagrid;
import com.lwx.pojo.Emp;
import com.lwx.service.EmpService;
@Service
public class EmpServiceImpl implements EmpService {
	@Resource
	private EmpMapper empMapper;
	
	@Resource
	private DeptMapper deptMapper;
	
	@Resource
	private Emp_deptMapper emp_deptMapper;
	
	//显示员工表信息
	@Override
	public EasyUIDatagrid showEmp(int pageSize, int pageNumber) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		List<Emp> list = empMapper.selByPage(pageSize*(pageNumber-1), pageSize);
		for (Emp emp : list) {
			emp.setDept(deptMapper.selById(emp_deptMapper.selDept_idByEmp_Id(emp.getEmp_id())));
		}
		datagrid.setRows(list);
		datagrid.setTotal(empMapper.selCount());
		return datagrid;
	}

	//更新emp表
	@Override
	public int update(Emp emp,int dept_id) {
		return empMapper.updEmp(emp) + emp_deptMapper.updDept_idByEmp_id(dept_id, emp.getEmp_id());
	}

	//根据邮箱查找emp员工记录
	@Override
	public boolean selByEmail(String email,int emp_id) {
		if(empMapper.selByEmail(email)==null||(empMapper.selByEmail(email)!=null&&empMapper.selByEmail(email).getEmp_id()==emp_id)) {
			return true;
		}else {
			return false;
		}
	}
	
	//新增emp记录
	@Override
	public int insEmp(Emp emp,int dept_id) {
		
		int index1 = empMapper.insEmp(emp);
		int index2 = emp_deptMapper.insEmp_dept(emp.getEmp_id(), dept_id);
		return index1+index2;
	}

	//根据id删除记录
	@Override
	public int delEmp(int[] array_emp_id) {
		int index=0;
		for(int i=0;i<array_emp_id.length;i++) {
			index += empMapper.delEmp(array_emp_id[i]);
			index += emp_deptMapper.delEmp_dept(array_emp_id[i]);
		}
		return index/2;
	}

	//清空emp表（不删除表，只删除所有员工信息），返回值是删除记录数
	@Override
	public int delEmptyEmp() {
		return empMapper.delEmptyEmp()+emp_deptMapper.delEmptyEmp_dept()+deptMapper.updDept_leader("无");
	}
	
	
}
