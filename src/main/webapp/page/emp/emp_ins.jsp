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
	$("#emp_ins_form :text,#emp_ins_form_gender").mouseleave(function(){
		if($("#emp_ins_form").valid()==false){
			$('#emp_ins_submit').linkbutton('disable');
		}else{
			$('#emp_ins_submit').linkbutton('enable');
		}
	});
	jQuery.validator.addMethod("stringCheck", function(value, element) {       
       return this.optional(element) || /^(?:[\u4e00-\u9fa5]+)(?:●[\u4e00-\u9fa5]+)*$|^[a-zA-Z0-9]+\s?[\.·\-()a-zA-Z]*[a-zA-Z]+$/.test(value);       
    }, "<b style='color:red;'>只能包括中文字、英文字母和●</b>");  
	$("#emp_ins_form").validate({
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
		            	emp_email:function(){
		            		return $("#emp_ins_form_emp_email").val();
		                },
		                emp_id:function(){
		            		return 0;
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
	$("#emp_ins_form").valid();
	$('#emp_ins_form_dept_name').combobox({    
	    url:'emp_ins_form_dept_name_combobox',    
	    valueField:'dept_id',    
	    textField:'dept_name',
	    limitToList:true,
	    editable:false,
	    queryParams: {
			"emp_name":""
		},
	    onLoadSuccess:function(){
	    	var emp_ins_form_dept_name_array = $(this).combobox("getData");
	    	if($(this).combobox("getData")!=null){
	    		$(this).combobox("select",emp_ins_form_dept_name_array[0].dept_id);
	    	}
	    }
	});  
     $('#emp_ins_submit').bind('click', function(){  
		$('#emp_ins_form').form('submit', {    
		    url:"insertEmp", 
		    novalidate:true,
		    onSubmit: function(){  
		    	if($("#emp_ins_form").valid()==false){
		    		return false;
		    	}
		    },    
		    success:function(data){    
		    	if(data==2){   
					$.messager.show({
						title:'系统消息',
						msg:"<b style='color:red;'>员工新增成功",
						timeout:3000,
						showType:'slide'
					});
					$("#emp_ins_dialog").dialog("close");
					$('#emp_message_table').datagrid('reload');
		    	}else if(data==0){
		    		$.messager.alert('系统信息',"<b style='color:red;'>邮箱重复，新增失败，请换一个邮箱地址！");    
		    	}   
		    }    
		});  
    }); 
}); 
</script>
	<div style="padding: 10px;">
	员工管理>>员工信息
		<form action="" method="post" id="emp_ins_form">
			<table>
				<tr>
					<td>姓名：</td>
					<td><input id="emp_ins_form_emp_name" type="text" name="emp_name" class="easyui-validatebox" ></td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td><input id="emp_ins_form_emp_email" type="text" name="emp_email"></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td>
						<select id="emp_ins_form_gender" class="easyui-combobox" data-options="editable:false,limitToList:true" name="emp_gender" style="width:100px;">   
						    <option value="男">男</option>   
						    <option value="女">女</option>   
						</select>
					</td>
				</tr>
				<tr>
					<td>部门：</td>
					<td><input id="emp_ins_form_dept_name" type="text" name="dept_name" ></td>
				</tr>
				<tr>
					<td colspan="2">
						<a id="emp_ins_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',disabled:true">新增</a>  		
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>