package com.lwx.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lwx.pojo.EasyUIDatagrid;
import com.lwx.pojo.Emp;
import com.lwx.service.EmpService;

@Controller
@RequestMapping("page")
public class EmpController {
	@Resource
	private EmpService empServiceImpl;
	
	//显示所有员工信息
	@RequestMapping("showEmp")
	@ResponseBody
	public EasyUIDatagrid showEmp(@RequestParam(defaultValue="2")int rows,@RequestParam(defaultValue="1")int page) {
		return empServiceImpl.showEmp(rows, page);
	}
	//更新emp
	@RequestMapping("updateEmp")
	@ResponseBody
	public int update(Emp emp,@RequestParam("dept_name")int dept_id) {
		return empServiceImpl.update(emp,dept_id);
	}
	
	//根据emp_id数组删除emp
	@RequestMapping("deleteEmp")
	@ResponseBody
	public int delEmp(int[] emp_del_array) {
		return empServiceImpl.delEmp(emp_del_array);
	}
	
	//插入新增emp
	@RequestMapping("insertEmp")
	@ResponseBody
	public int insEmp(Emp emp,@RequestParam("dept_name")int dept_id) {
			return empServiceImpl.insEmp(emp,dept_id);
	}
	
	//验证emp_email是否重复
	@RequestMapping("verify_emp_email")
	@ResponseBody
	public boolean verify_emp_email(String emp_email,int emp_id) {
			return empServiceImpl.selByEmail(emp_email, emp_id);
	}
	
	//清空员工表和关联表，返回一共删除的记录数
	@RequestMapping("emptyEmp")
	@ResponseBody
	public int emptyEmp() {
			return empServiceImpl.delEmptyEmp()/3;
	}
}
