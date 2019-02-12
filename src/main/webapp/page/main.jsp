<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	    $('#emp_sel,#dept_sel').bind('click', function(e){
	    	if($('#main_tabs').tabs("getTab",$(this).text())==null){
	    		$('#main_tabs').tabs('add',{
	    			title: $(this).text(),
	    			closable:true,    
	    			href:"/hrms/page/"+$(this).attr("page_name")+".jsp"
	    		});
	    	}else{
	    		$('#main_tabs').tabs("select",$(this).text());
	    	}
	    });
});
</script>
</head>
<body class="easyui-layout" >   
    <div data-options="region:'north',title:'',split:false,collapsible:false" style="height:712x;">
    	<div style="width:400px;height:70px;float:left;font-size:20px;font-weight:bold;line-height:70px;padding-left: 20px">
    		人力资源管理系统
    	</div>
    	<div style="width:400px;text-align:right;height:70px;float:right;font-size:20px;font-weight:bold;line-height:70px;padding-right:10px;">
    		你好，${user.username},欢迎登陆！
    		<c:choose>
	    		<c:when test="${!empty sessionScope.user}">
	    			<a href="<c:url value='/quit'/>" target="_parent">退出</a>
				</c:when>
			</c:choose>
    	</div>
    </div>   
    <div data-options="region:'south',split:false,collapsible:false" style="height:30px;">
    	<div style="text-align:center;color:gray;height:20px;font-weight:bold;line-height:20px;">
    		Copyright &copy; 2019 lwx
    	</div>
    </div>   
    <div data-options="region:'west',title:'',split:false,collapsible:false" style="width:202px;">
   	 	<header style="text-align: center;background:#EFEFEF;">菜单</header>
    	<div id="main_emp" class="easyui-panel" title="员工管理"     
		        style="width:200px;height:93px;background:#fafafa;"   
		        data-options="iconCls:'icon-edit',collapsible:true">   
		    <a id="emp_sel" page_name="emp/emp_message" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:198px;">员工信息</a>  
		</div> 
		<div id="main_dept" class="easyui-panel" title="部门管理"     
		        style="width:200px;height:93px;background:#fafafa;"   
		        data-options="iconCls:'icon-edit',collapsible:true">   
		    <a id="dept_sel" page_name="dept/dept_message" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:198px;">部门信息</a>  
		</div> 
    </div>   
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
    	<div id="main_tabs" class="easyui-tabs" style="width:500px;height:250px;" data-options="fit:true">   
		    <div title="Tab1" style="padding:20px;">   
		    	<img alt="" src="/hrms/image/20.jpg" width="91%">
		    </div>   
		     
		</div>  
    </div>   
</body>  

</html>