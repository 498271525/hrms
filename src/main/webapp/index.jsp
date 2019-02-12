<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>人力资源后台管理界面</title>
<link rel="stylesheet" type="text/css" href="/hrms/js/jquery_easyui_1.7.0/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="/hrms/js/jquery_easyui_1.7.0/themes/icon.css">   
<script type="text/javascript" src="/hrms/js/jquery-1.7.2.js"></script>   
<script type="text/javascript" src="/hrms/js/jquery_easyui_1.7.0/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="/hrms/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="/hrms/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<style type="text/css">
	
</style>
<script type="text/javascript">
$(function(){
	$("#login_submit").click(function(){
		$('#login_form').form('submit', {    
		    url:'/hrms/login',    
		    onSubmit: function(){    
		        if($(".easyui-textbox").val()==""){
		        	$.messager.alert('系统信息','用户名不能为空'); 
		        	return false;
		        }else if($(".easyui-passwordbox").val()==""){
		        	$.messager.alert('系统信息','密码不能为空'); 
		        	return false;
		        }
		    },    
		    success:function(data){  
		    	if(data=="1"){   
 					location.href="/hrms/page/main.jsp";
		    	}else{
		    		$.messager.alert('系统信息','登陆失败');    
  
		    	}
		    }    
		});  
	});
});
</script>
</head>
<body style="background:#8AE4F7">
	<div id="dd" class="easyui-dialog" title="" style="width:400px;height:220px;text-align: center;"   
	        data-options="iconCls:'icon-save',resizable:false,modal:true,closable:false,draggable:false,border:false">   
	    <p style="text-align:center;font-size:20px;font-weight:bold">管理员登陆</p> 
	    <form id="login_form" method="post" >   
		    <div>   
		        <label for="name"><b></b></label>   
		       <input name="username" class="easyui-textbox" prompt="username" data-options="iconCls:'icon-man'" style="width:300px;height:40px;padding:10px">    
		    </div>   
		    <div style="padding-top: 10px;">   
		        <label for="password"><b></b></label>   
		        <input name="password" class="easyui-passwordbox" prompt="Password" iconWidth="28" style="width:300px;height:40px;padding:10px"> 
		    </div>   
		</form>
		<div style="padding-top: 10px;">    
			<a id="login_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="text-align: center;width:300px;background:#5BBA5B;">登陆</a>  
		</div>
	</div>  
</body>
</html>