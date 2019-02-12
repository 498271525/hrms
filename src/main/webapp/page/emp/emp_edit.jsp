<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>

</head>
<body >
<script type="text/javascript">
$(function(){ 
	$("#emp_edit_form :text,#emp_edit_form_gender").mouseleave(function(){
		if($("#emp_edit_form").valid()==false){
			$('#emp_edit_submit').linkbutton('disable');
		}else{
			$('#emp_edit_submit').linkbutton('enable');
		}
	});
	jQuery.validator.addMethod("stringCheck", function(value, element) {       
       return this.optional(element) || /^[\u4E00-\u9FA5\uf900-\ufa2d·●s]{2,20}$/.test(value);       
    }, "<b style='color:red;'>只能包括中文字、英文字母和·●</b>");  
	$("#emp_edit_form").validate({
	    rules: {
	      emp_name:{
	    	  required:true,
	    	  stringCheck:true
	      } ,
	      emp_email: {
	        required: true,
	        email: true,
	        remote: {
	            url: "verify_emp_email",     //后台处理程序
	            type: "post",               //数据发送方式
	            dataType: "json",           //接受数据格式   
	            data: {                     //要传递的数据
	            	emp_email: function() {
	                    return $("#emp_edit_form_emp_email").val();
	                },
	                emp_id:function(){
	                	return $("#emp_message_table").datagrid("getSelected").emp_id;
	                }
	            }
	        }
	      }
	    },
	    messages: {
	      emp_name:{
	    	  required:"<b style='color:red;'>请输入员工名字</b>"
	      },
	      emp_email:{
	    	  required:"<b style='color:red;'>请输入一个正确的邮箱</b>",
	    	  email:"<b style='color:red;'>该邮箱格式错误，请输入正确的邮箱格式</b>",
	    	  remote:"<b style='color:red;'>该邮箱已经重复</b>"
	      }
	    }
	});
	$("#emp_edit_form").valid();
	$('#emp_edit_form_dept_name').combobox({    
	    url:'emp_edit_form_dept_name_combobox',    
	    valueField:'dept_id',    
	    textField:'dept_name',
	    limitToList:true,
	    editable:false,
	    queryParams: {
			"emp_name":$("#emp_message_table").datagrid("getSelected").emp_name
		},
	    onLoadSuccess:function(){
	        var emp_edit_form_dept_name_array = $(this).combobox("getData");
	        for(var i=0;i<emp_edit_form_dept_name_array.length;i++){
		    	if(emp_edit_form_dept_name_array[i]!=null&&emp_edit_form_dept_name_array[i].dept_name==$("#emp_message_table").datagrid("getSelected").dept.dept_name){
		    		$(this).combobox("select",emp_edit_form_dept_name_array[i].dept_id);
		    	}
	        }
	    }
	});
    $('#emp_edit_submit').bind('click', function(){    
		$('#emp_edit_form').form('submit', {    
		    url:"updateEmp",    
		    onSubmit: function(){    
		    	if($("#emp_edit_form").valid()==false){
		    		return false;
		    	}
		    },    
		    success:function(data){    
		    	if(data==2){   
					$.messager.show({
						title:'系统消息',
						msg:"<b style='color:green;'>修改成功",
						timeout:3000,
						showType:'slide'
					});
					$("#emp_edit_dialog").dialog("close");
					$('#emp_message_table').datagrid('reload');
		    	}else{
		    		$.messager.alert('系统信息',"<b style='color:red;'>修改失败，请重新修改！");    
	
		    	}   
		    }    
		});  
    });    
      
});  
</script>
	<div style="padding: 10px;">
	员工管理>>员工信息
		<form action="" method="post" id="emp_edit_form">
		<input type="hidden" name="emp_id">
			<table>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="emp_name"></td>
					<td></td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td><input id="emp_edit_form_emp_email" type="text" name="emp_email"></td>
					<td></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td>
						<select id="emp_dit_form_gender" class="easyui-combobox" data-options="editable:false,limitToList:true" name="emp_gender" style="width:100px;">   
						    <option value="男">男</option>   
						    <option value="女">女</option>   
						</select>
					</td>
				</tr>
				<tr>
					<td>部门：</td>
					<td><input id="emp_edit_form_dept_name" type="text" name="dept_name"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<a id="emp_edit_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>  		
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>