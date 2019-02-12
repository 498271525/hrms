package com.lwx.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lwx.pojo.Users;
import com.lwx.service.UsersService;

@Controller
public class UsersController {
	@Resource
	private UsersService UsersServiceImpl;
	
	@RequestMapping("login")
	@ResponseBody
	public String login(Users users,HttpSession session) {
		Users user = UsersServiceImpl.login(users);
		if(user!=null) {
			session.setAttribute("user", user);
			return "1";
		}else {
			return "0";		
		}
	}
	
	@RequestMapping("quit")
	public String quit(HttpSession session) {
		session.removeAttribute("user");;
		return "/index.jsp";
	}
	
}
