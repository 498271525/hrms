package com.lwx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lwx.pojo.Emp_dept;

public interface Emp_deptMapper {
	
	//根据emp_id查找相应的dept_id
	@Select("select dept_id from emp_dept where emp_id=#{0}")
	Integer selDept_idByEmp_Id(int emp_id);
	
	//根据emp_id修改相应的dept_id
	@Update("update emp_dept set dept_id=#{0} where emp_id=#{1}")
	int updDept_idByEmp_id(int dept_id,int emp_id);
		
	//插入数据
	@Insert("insert into emp_dept values(default,#{0},#{1})")
	int insEmp_dept(int emp_id,int dept_id);
	
	//根据emp_id删除记录
	@Delete("delete from emp_dept where emp_id=#{0}")
	int delEmp_dept(int emp_id);
	
	//根据dept_id查找总记录数
	@Select("select count(*) from emp_dept where dept_id=#{0}")
	int selByDept_id(int dept_id);
	
	//根据dept_id删除相应的记录
	/*@Delete("delete from emp_dept where dept_id=#{0}")
	int delByDept_id(int dept_id);*/
	
	//根据dept_id修改相应的记录，使dept_id=1（无部门状态）
	@Update("update emp_dept set dept_id=1 where dept_id=#{0}")
	int updDept_idByDept_id_2(int dept_id);
	
	//修改所有记录，使dept_id=1（无部门状态）
	@Update("update emp_dept set dept_id=1")
	int updDept_id();
	
	//清空emp_dept表内数据（表没删除）
	@Delete("delete from emp_dept")
	int delEmptyEmp_dept();
	
	//根据dept_id查找emp_id
	@Select("select emp_id from emp_dept where dept_id=#{0}")
	List<Integer> selEmp_idByDept_id(int dept_id);
}
