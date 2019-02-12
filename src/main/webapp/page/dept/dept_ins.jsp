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
	$("#dept_ins_form :text").mouseleave(function(){
		if($("#dept_ins_form").valid()==false){
			$('#dept_ins_submit').linkbutton('disable');
		}else{
			$('#dept_ins_submit').linkbutton('enable');
		}
	});
	jQuery.validator.addMethod("stringCheck", function(value, element) {       
       return this.optional(element) || /^[\u4E00-\u9FA5A-Za-z0-9]+$/.test(value);       
    }, "<b style='color:red;'> 中文、英文、数字但不包括下划线等符号</b>");  
	$("#dept_ins_form").validate({
		ignore:"",//针对下拉框验证。
	    rules: {
	      dept_name:{
	    	  required:true,
	    	  stringCheck:true,
	    	  remote: {
		            url: "verify_dept_name",     //后台处理程序
		            type: "post",               //数据发送方式
		            dataType: "json",           //接受数据格式   
		            data: {                     //要传递的数据
		            	dept_name: function() {
		                    return $("#dept_ins_form_dept_name").val();
		                },
		                dept_id:function(){
		                	return 0;
		                }
		            }
		        }
	      },
	      emp_id:{
	    	  required:true
	      }
	    },
	    messages: {
	      dept_name:{
	    	  required:"<b style='color:red;'>请输入部门名字</b>",
	    	  remote:"<b style='color:red;'>该部门名称已被使用！"
	      },
	      emp_id:{
	    	  required:"<b style='color:red;'>请选择该部门的经理"
	      }
	    }
	});
	$("#dept_ins_form").valid();
	$('#dept_ins_form_dept_leader').combobox({    
	    url:'get_leader_for_dept_form',    
	    valueField:'emp_id',    
	    textField:'emp_name',
	    limitToList:true,
	    reversed:true,
	    queryParams: {
			"dept_leader":""
		},
	    onLoadSuccess:function(){
	    	var dept_ins_form_dept_leader_array = new Array();
	        dept_ins_form_dept_leader_array = $(this).combobox("getData");
	    	if($(this).combobox("getData")!=null){
	    		$(this).combobox("select",dept_ins_form_dept_leader_array[0].emp_id);
	    	}
	    }
	});
     $('#dept_ins_submit').bind('click', function(){  
		$('#dept_ins_form').form('submit', {    
		    url:"insertDept",    
		    onSubmit: function(){  
		    	if($("#dept_ins_form").valid()==false){
		    		return false;
		    	}
		    },    
		    success:function(data){ 
		    	if(data==1){   
					$.messager.show({
						title:'系统消息',
						msg:"<b style='color:green;'>部门新增成功",
						timeout:3000,
						showType:'slide'
					});
					$("#dept_ins_dialog").dialog("close");
					$('#dept_message_table').datagrid('reload');
		    	}else{
		    		$.messager.alert('系统信息',"<b style='color:red;'>部门新增失败!<br/>");    
		    	}     
		    }    
		});  
    }); 
   
 
});  
</script>
	<div style="padding: 10px;">
	部门管理>>部门信息
		<form action="" method="post" id="dept_ins_form">
			<table>
				<tr>
					<td>部门名称：</td>
					<td><input id="dept_ins_form_dept_name" type="text" name="dept_name"></td>
					<td></td>
				</tr>
				<tr>
					<td>部门经理：</td>
					<td><input id="dept_ins_form_dept_leader" type="text" name="emp_id" data-options="requred:true"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<a id="dept_ins_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>  		
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>