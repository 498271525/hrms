package com.lwx.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lwx.pojo.Dept;
import com.lwx.pojo.EasyUIDatagrid;
import com.lwx.pojo.Emp;
import com.lwx.service.DeptService;


@Controller
@RequestMapping("page")
public class DeptController {
	@Resource
	private DeptService deptServiceImpl;
	
	//显示部门信息
	@RequestMapping("showDept")
	@ResponseBody
	public EasyUIDatagrid showDept(@RequestParam(defaultValue="2")int rows,@RequestParam(defaultValue="1")int page) {
		return deptServiceImpl.showDept(rows, page);
	}
	
	//更新部门信息
	@RequestMapping("updateDept")
	@ResponseBody
	public int updateDept(Dept dept,int emp_id) {
		return deptServiceImpl.update(dept,emp_id)/2;
	}
	
	//插入新部门
	@RequestMapping("insertDept")
	@ResponseBody
	public int insertDept(Dept dept,int emp_id) {
		return deptServiceImpl.insert(dept,emp_id)/2;
	}
	
	//删除部门，并修改员工-部门关联表相应部门的所有记录，使影响的员工部门变成无部门
	@RequestMapping("deleteDept")
	@ResponseBody
	public int insertDept(int[] dept_del_array) {
		return deptServiceImpl.delete(dept_del_array);
	}
	
	//显示所有部门信息并用json格式返回
	@RequestMapping({"emp_ins_form_dept_name_combobox","emp_edit_form_dept_name_combobox"})
	@ResponseBody
	public List<Dept> showDeptForJson(String emp_name) {
		return deptServiceImpl.selAll(emp_name);
	}
	//验证dept_name是否重复
	@RequestMapping({"verify_dept_name"})
	@ResponseBody
	public boolean verify_dept_name(String dept_name,int dept_id) {
		return deptServiceImpl.selByDept_name(dept_name, dept_id);
	}
	
	//获取除了（传入参数）之外的不是经理的emp记录
	@RequestMapping("get_leader_for_dept_form")
	@ResponseBody
	public List<Emp> getEmp_nameByDept_id(String dept_leader) {
		return deptServiceImpl.selEmpByNotDept_leader(dept_leader);
	}

	//清空除了无部门的所有部门
	@RequestMapping("emptyDept")
	@ResponseBody
	public int emptyDept() {
		return deptServiceImpl.delEmptyDept();
	}
}
