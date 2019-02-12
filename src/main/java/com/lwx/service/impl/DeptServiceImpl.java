package com.lwx.service.impl;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lwx.mapper.DeptMapper;
import com.lwx.mapper.EmpMapper;
import com.lwx.mapper.Emp_deptMapper;
import com.lwx.pojo.Dept;
import com.lwx.pojo.EasyUIDatagrid;
import com.lwx.pojo.Emp;
import com.lwx.service.DeptService;
@Service
public class DeptServiceImpl implements DeptService {
	@Resource
	private DeptMapper deptMapper;

	@Resource
	private EmpMapper empMapper;
	
	@Resource
	private Emp_deptMapper emp_deptMapper;
	
	//显示部门信息
	@Override
	public EasyUIDatagrid showDept(int pageSize, int pageNumber) {
		EasyUIDatagrid datagrid = new EasyUIDatagrid();
		List<Dept> list = deptMapper.selByPage(pageSize*(pageNumber-1), pageSize);
		for (Dept dept : list) {
			dept.setDept_num(emp_deptMapper.selByDept_id(dept.getDept_id()));
		}
		datagrid.setRows(list);
		datagrid.setTotal(deptMapper.selCount());
		return datagrid;
	}

	//更新部门信息
	@Override
	public int update(Dept dept,int emp_id) {
		//根据emp_id获取的emp_name，设置其为dept的leader
		dept.setDept_leader(empMapper.selByEmp_id(emp_id).getEmp_name());
		//更新dept
		int index1 = deptMapper.updDept(dept);
		//更新emp_dept表
		int index2 = emp_deptMapper.updDept_idByEmp_id(dept.getDept_id(), emp_id);
		return index1 + index2;
	}

	//添加部门dept
	@Override
	public int insert(Dept dept,int emp_id) {
		//根据emp_id获取的emp_name，设置其为dept的leader
		dept.setDept_leader(empMapper.selByEmp_id(emp_id).getEmp_name());
		//插入dept
		int index1 = deptMapper.insDept(dept);
		//更新emp_dept表
		int index2 = emp_deptMapper.updDept_idByEmp_id(dept.getDept_id(), emp_id);
		return index1 + index2;
	}
	
	//根据dept_id数组删除dept表内相应的记录，并删除相应的emp_dept的记录
	@Override
	public int delete(int[] dept_id_array) {
		int index = 0;
		for(int i=0;i<dept_id_array.length;i++) {
			//根据dept_id删除dept表内相应的记录
			index += deptMapper.delByDept_id(dept_id_array[i]);
			//根据dept_id修改emp_dept表（员工和部门关联表）内相应的记录，让其影响的员工变成无部门,并返回删除记录数量,并加上index
			index += emp_deptMapper.updDept_idByDept_id_2(dept_id_array[i]);
		}
		return index;
	}
	//获取所有部门信息
	@Override
	public List<Dept> selAll(String emp_name) {
		if(!deptMapper.selDeptByDept_leader(emp_name).isEmpty()) {
			return deptMapper.selDeptByDept_leader(emp_name);
		}else{
			return deptMapper.selAll();
		}
	}
	
	//判断dept_name是否重复
	@Override
	public boolean selByDept_name(String dept_name,int dept_id) {
		//如果dept_name不存在或者存在但是dept_id和接受的dept_id相同（修改时dept_name不变），验证通过，返回true
		if(deptMapper.selIdByName(dept_name)==null||(deptMapper.selIdByName(dept_name)!=null&&deptMapper.selIdByName(dept_name)==dept_id)) {
			return true;
		}else {
			return false;
		}
	}
	//返回除了传入参数之外的不是经理的emp记录
	@Override
	public List<Emp> selEmpByNotDept_leader(String dept_leader) {
		List<Emp> emp_list = empMapper.selAll();
		List<Emp> return_emp_list = new ArrayList<>();
		for (Emp emp : emp_list) {
			if(deptMapper.selCountByLeader(emp.getEmp_name())==0||(deptMapper.selCountByLeader(emp.getEmp_name())!=0&&emp.getEmp_name().equals(dept_leader))) {
				return_emp_list.add(emp);
			}
		}
		return return_emp_list;
	}
	
	//清空除了无部门的所有部门
	@Override
	public int delEmptyDept() {
		//清空dept表，除了（无部门）
		int index = deptMapper.delEmptyDept();
		//把所有部门影响的员工部门改成无
		emp_deptMapper.updDept_id();
		return index;
	}

	
	

}
