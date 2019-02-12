package com.lwx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lwx.mapper.Emp_deptMapper;
import com.lwx.service.Emp_deptService;
@Service
public class Emp_deptServiceImpl implements Emp_deptService{

	@Resource
	private Emp_deptMapper emp_deptMapper;

}
