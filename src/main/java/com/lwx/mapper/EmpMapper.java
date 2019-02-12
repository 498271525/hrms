package com.lwx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lwx.pojo.Emp;

public interface EmpMapper {
	//根据参数查找相应范围的记录
	@Select("select * from emp limit #{0},#{1}")
	List<Emp> selByPage(int pageStart,int pageSize);
	
	//查找emp表内记录数
	@Select("select count(*) from emp")
	int selCount();
	
	//更新emp数据
	@Update("update emp set emp_name=#{emp_name},emp_email=#{emp_email},emp_gender=#{emp_gender} where emp_id=#{emp_id}")
	int updEmp(Emp emp);
	
	//根据邮箱查找emp表内的记录
	@Select("select * from emp where emp_email=#{0}")
	Emp selByEmail(String email);
	
	//往emp表插入新的记录
	@Insert("insert into emp values(default,#{emp_name},#{emp_email},#{emp_gender})")
	@Options(useGeneratedKeys=true,keyProperty="emp_id",keyColumn="emp_id")
	int insEmp(Emp emp);
	
	//根据id删除emp表的记录
	@Delete("delete from emp where emp_id=#{0}")
	int delEmp(int emp_id);
	
	//根据员工名字查询记录数
	@Select("select count(*) from emp where emp_name=#{0}")
	int selByEmp_name(String emp_name);
	
	//根据emp_name查找emp_id
	@Select("select emp_id from emp where emp_name=#{0}")
	int selEmp_idByEmp_name(String emp_name);
	
	//删除emp表所有员工记录
	@Delete("delete from emp")
	int delEmptyEmp();
	
	//根据emp_id查找记录
	@Select("select * from emp where emp_id=#{0}")
	Emp selByEmp_id(int emp_id);
	
	//查找所有
	@Select("select * from emp")
	List<Emp> selAll();
}
