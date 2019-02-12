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
	$("#dept_edit_form :text").mouseleave(function(){
		if($("#dept_edit_form").valid()==false){
			$('#dept_edit_submit').linkbutton('disable');
		}else{
			$('#dept_edit_submit').linkbutton('enable');
		}
	});
	jQuery.validator.addMethod("stringCheck", function(value, element) {       
       return this.optional(element) || /^[\u4E00-\u9FA5\uf900-\ufa2d·●s]{2,20}$/.test(value);       
    }, "<b style='color:red;'>只能包括中文字、英文字母·●</b>");  
	$("#dept_edit_form").validate({
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
		                    return $("#dept_edit_form_dept_name").val();
		                },
		                dept_id:function(){
		                	return $("#dept_message_table").datagrid("getSelected").dept_id;
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
	$("#dept_edit_form").valid();
	$('#dept_edit_form_dept_leader').combobox({    
	    url:'get_leader_for_dept_form',    
	    valueField:'emp_id',    
	    textField:'emp_name',
	    limitToList:true,
	    reversed:true,
	    queryParams: {
			"dept_leader":$("#dept_message_table").datagrid("getSelected").dept_leader
		},
	    onLoadSuccess:function(){
	        var dept_edit_form_dept_leader_array = $(this).combobox("getData");
	        if(dept_edit_form_dept_leader_array.length>0){
	       		$(this).combobox("select",dept_edit_form_dept_leader_array[0].emp_id);
		        for(var i=0;i<dept_edit_form_dept_leader_array.length;i++){
			    	if(dept_edit_form_dept_leader_array[i].emp_name==$("#dept_message_table").datagrid("getSelected").dept_leader){
			    		$(this).combobox("select",dept_edit_form_dept_leader_array[i].emp_id);
			    	}
		        }
	        }
	    }
	});
    $('#dept_edit_submit').bind('click', function(){    
		$('#dept_edit_form').form('submit',{    
		    url:"updateDept",    
		    onSubmit: function(){    
		    	if($("#dept_edit_form").valid()==false){
		    		return false;
		    	}
		    },    
		    success:function(data){    
		    	if(data==1){   
					$.messager.show({
						title:'系统消息',
						msg:"<b style='color:green;'>修改成功!",
						timeout:3000,
						showType:'slide'
					});
					$("#dept_edit_dialog").dialog("close");
					$('#dept_message_table').datagrid('reload');
		    	}else {
		    		$.messager.alert('系统信息',"<b style='color:red;'>修改失败!<br/>");    
		    	}
		    }    
		});  
    });    
      
});  
</script>
	<div style="padding: 10px;">
	部门管理>>部门信息
		<form action="" method="post" id="dept_edit_form">
			<input type="hidden" name="dept_id">
			<table>
				<tr>
					<td>部门名称：</td>
					<td><input id="dept_edit_form_dept_name" type="text" name="dept_name"></td>
					<td></td>
				</tr>
				<tr>
					<td>部门经理：</td>
					<td><input id="dept_edit_form_dept_leader" type="text" name="emp_id"></td>
				</tr>
				<tr>
					<td colspan="2" >
						<a id="dept_edit_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>  		
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>