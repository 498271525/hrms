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
<body>
<script type="text/javascript">
$(function(){
	$('#dept_message_table').datagrid({    
	    url:'showDept',    
	    columns:[[    
	    	{field:'dept_ck',checkbox:true,width:200,hidden:true},
	    	{field:'dept_id',title:'编号',width:100,hidden:true}, 
	        {field:'dept_name',title:'部门名',width:100},    
	        {field:'dept_leader',title:'部门经理',width:100},    
	        {field:'dept_num',title:'部门总人数',width:50,align:'center'}
	    ]],
	    pagination:true,
	    pageList:["2","3","5","10"],
	    fitColumns:true,
	    striped:true,
	    rownumbers:true,
	    singleSelect:true,
	    toolbar: [{
			iconCls: 'icon-edit',
			text:"编辑",
			handler: function(){
				if($("#dept_message_table").datagrid("getSelections").length!=1){
					$.messager.alert("系统信息","请选择<b style='color:red'>一行</b>");    
				}else if($("#dept_message_table").datagrid("getSelected").dept_name=="无"){
						$.messager.alert("系统信息","<b style='color:red'>所选部门中有部门不能编辑</b>"); 
				}else if($("#dept_message_table").datagrid("getSelections").length==1){
					$('#dept_edit_dialog').dialog({    
					    title: '修改',    
					    width: 600,    
					    height: 250,    
					    closed: false,    
					    cache: false, 
					    draggable:false,
					    href: "dept/dept_edit.jsp",    
					    modal: true,
					    onLoad:function(){
					    	$("#dept_edit_form :text:eq(0)").val($("#dept_message_table").datagrid("getSelected").dept_name);
					    	$("#dept_edit_form :text:eq(1)").val($("#dept_message_table").datagrid("getSelected").dept_leader);
					    	$("#dept_edit_form :hidden:eq(0)").val($("#dept_message_table").datagrid("getSelected").dept_id);
					    }
					});  	
				}
				
			}
		},'-',{
			text:"删除",
			iconCls: 'icon-remove',
			handler: function(){
				if($("#dept_message_table").datagrid("getSelections").length==0){
					$.messager.alert("系统信息","请选择<b style='color:red'>至少一行</b>");    
				}else if($("#dept_message_table").datagrid("getSelected").dept_name=="无"){
						$.messager.alert("系统信息","<b style='color:red'>所选部门中有部门不能删除</b>"); 
				}
				else
				if($("#dept_message_table").datagrid("getSelections").length>=1){
					$.messager.confirm('确认','您确认想要删除这'+$("#dept_message_table").datagrid("getSelections").length+'个部门吗？',function(r){    
					    if (r){
					    	var dept_del_emp_num = 0;
					    	var dept_del_getSelections =  $("#dept_message_table").datagrid("getSelections");
					    	var dept_del_array = new Array(dept_del_getSelections.length);
					    	for(var i=0;i<dept_del_getSelections.length;i++){
					    		dept_del_array[i] = dept_del_getSelections[i].dept_id;
					    		dept_del_emp_num+=dept_del_getSelections[i].dept_num;
					    	}
					    	 $.ajax({  
				                    type : "POST",  //提交方式  
				                    url : "deleteDept",//路径  
				                    data :{"dept_del_array":dept_del_array}, 
				                    traditional:true,//序列化，用来传数组
				                    dataType: "json",
				                    success : function(result) {//返回数据根据结果进行相应的处理  
					        			if(result==dept_del_array.length+dept_del_emp_num){
					        				$.messager.show({
					        					title:'系统消息',
					        					msg:"<b style='color:green'>删除成功!，已删除" + dept_del_array.length + "个部门,共"
					        					+ dept_del_emp_num + "位员工变为无部门状态！",
					        					timeout:3000,
					        					showType:'fade'
					        				});
					        				$('#dept_message_table').datagrid('reload');
					        			}else{
					        				$.messager.show({
					        					title:'系统消息',
					        					msg:'删除失败',
					        					timeout:3000,
					        					showType:'show'
					        				});
					        				$('#dept_message_table').datagrid('reload');
					        			}
				                    }  
				                });  
					    	
					    }    
					    
					});  
				}
			}
		},'-',{
			text:"新增",
			iconCls: 'icon-add',
			handler: function(){
				$('#dept_ins_dialog').dialog({    
				    title: '部门新增',    
				    width: 600,    
				    height: 250,    
				    closed: false,    
				    cache: false,  
				    draggable:false,
				    href: "dept/dept_ins.jsp",    
				    modal: true
				});  	
			}
		},'-',{
			text:"多选",
			iconCls: 'icon-ok',
			handler: function(){
				if($("#dept_message_table").datagrid("getColumnOption","dept_ck").hidden==true){
					$("#dept_message_table").datagrid("showColumn","dept_ck");
					$("#dept_message_table").datagrid("options").singleSelect=false;
					$('#dept_message_table').datagrid('reload');
				}else{
					$("#dept_message_table").datagrid("hideColumn","dept_ck");
					$("#dept_message_table").datagrid("options").singleSelect=true;
					$('#dept_message_table').datagrid('reload');
				}
			}
		},'-',{
			text:"清空所有部门",
			iconCls: 'icon-cut',
			handler: function(){
				$.messager.confirm('确认','您确认想要清空所有部门吗？',function(r){    
				    if (r){
				    	 $.post("emptyDept",  
			                 		function(result) {
				        			if(result>0){
				        				$.messager.show({
				        					title:'系统消息',
				        					msg:'删除成功，已删除' + result + '条部门信息',
				        					timeout:3000,
				        					showType:'fade'
				        				});
				        				$('#dept_message_table').datagrid('reload');
				        			}else{
				        				$.messager.show({
				        					title:'系统消息',
				        					msg:'删除失败',
				        					timeout:3000,
				        					showType:'show'
				        				});
				        				$('#dept_message_table').datagrid('reload');
				        			}
			                });  
				    	
				    }    
				    
				});  

			}
		}]

	}); 
})
</script>
<table id="dept_message_table"></table>  
<div id="dept_edit_dialog"></div>  
<div id="dept_ins_dialog"></div>  

</body>
</html>