package com.lwx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lwx.pojo.Dept;

public interface DeptMapper {
	
	//根据参数查找相应范围的记录
	@Select("select * from dept limit #{0},#{1}")
	List<Dept> selByPage(int pageStart,int pageSize);
	
	//查找dept表内记录数
	@Select("select count(*) from dept")
	int selCount();
	
	//查找所有
	@Select("select * from dept")
	List<Dept> selAll();
	
	//根据部门id查询所有
	@Select("select * from dept where dept_id=#{0}")
	Dept selById(int id);
	
	//根据部门名字查询部门id
	@Select("select dept_id from dept where dept_name=#{0}")
	Integer  selIdByName(String name);
	
	//根据部门名字查询记录数
	@Select("select count(*) from dept where dept_name=#{0}")
	int  selCountByName(String dept_name);
	
	//根据部门经理名字查询记录数
	@Select("select count(*) from dept where dept_leader=#{0}")
	int selCountByLeader(String dept_leader);
	
	//根据dept_leader查找记录并返回
	@Select("select * from dept where dept_leader=#{0}")
	List<Dept> selDeptByDept_leader(String dept_leader);
	
	//更新dept数据
	@Update("update dept set dept_name=#{dept_name},dept_leader=#{dept_leader} where dept_id=#{dept_id}")
	int updDept(Dept dept);
	
	//往dept表插入新的记录
	@Insert("insert into dept values(default,#{dept_name},#{dept_leader})")
	@Options(useGeneratedKeys=true,keyProperty="dept_id",keyColumn="dept_id")
	int insDept(Dept dept);
	
	//根据dept_id删除记录
	@Delete("delete from dept where dept_id=#{0}")
	int delByDept_id(int dept_id);
	
	//清空dept表，除了dept_id=1（无部门）
	@Delete("delete from dept where dept_id!=1")
	int delEmptyDept();
	
	//更改dept表的dept_leader值
	@Update("update dept set dept_leader=#{0}")
	int updDept_leader(String dept_name);
}
