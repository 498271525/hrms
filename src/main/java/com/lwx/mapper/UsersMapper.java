package com.lwx.mapper;

import org.apache.ibatis.annotations.Select;

import com.lwx.pojo.Users;

public interface UsersMapper {
	@Select("select * from users where username=#{username} and password=#{password}")
	Users selByUsers(Users user);
}
