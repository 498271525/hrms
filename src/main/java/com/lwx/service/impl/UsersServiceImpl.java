package com.lwx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lwx.mapper.UsersMapper;
import com.lwx.pojo.Users;
import com.lwx.service.UsersService;
@Service
public class UsersServiceImpl implements UsersService {
	@Resource
	private UsersMapper usersMapper;
	@Override
	public Users login(Users user) {
		// TODO Auto-generated method stub
		return usersMapper.selByUsers(user);
	}

}
