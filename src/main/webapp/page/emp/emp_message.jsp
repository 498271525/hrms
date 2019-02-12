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
	$('#emp_message_table').datagrid({    
	    url:'showEmp',    
	    columns:[[    
	    	{field:'dept_ck',checkbox:true,width:200,hidden:true},
	    	{field:'emp_id',title:'编号',width:100,hidden:true}, 
	        {field:'emp_name',title:'姓名',width:200},    
	        {field:'emp_email',title:'邮箱',width:300},    
	        {field:'emp_gender',title:'性别',width:20,align:'center'},
	        {field:'dept',title:'部门名称', width:80,
	        	formatter: function(value,row,index){
						return row.dept.dept_name;
				}
	
	        }
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
				if($("#emp_message_table").datagrid("getSelections").length==1){
					$('#emp_edit_dialog').dialog({    
					    title: '修改',    
					    width: 600,    
					    height: 250,    
					    closed: false,    
					    cache: false,    
					    draggable:false,
					    href: "emp/emp_edit.jsp",    
					    modal: true,
					    onLoad:function(){
					    	$("#emp_edit_form :text:eq(0)").val($("#emp_message_table").datagrid("getSelected").emp_name);
					    	$("#emp_edit_form :text:eq(1)").val($("#emp_message_table").datagrid("getSelected").emp_email);
					    	$("#emp_dit_form_gender").combobox("select",$("#emp_message_table").datagrid("getSelected").emp_gender);
					    	$("#emp_edit_form :hidden:eq(0)").val($("#emp_message_table").datagrid("getSelected").emp_id);
					    }
					});  	
				}else{
					$.messager.alert("系统信息","请选择<b style='color:red'>一行</b>");    
				}
			}
		},'-',{
			text:"删除",
			iconCls: 'icon-remove',
			handler: function(){
				var emp_del_getSelections =  $("#emp_message_table").datagrid("getSelections");
		    	var emp_del_array = new Array(emp_del_getSelections.length);
		    	var emp_leader_delete = false;
		    	for(var i=0;i<emp_del_getSelections.length;i++){
		    		emp_del_array[i] = emp_del_getSelections[i].emp_id;
		    		if(emp_del_getSelections[i].emp_name==emp_del_getSelections[i].dept.dept_leader){
		    			emp_leader_delete =true;
		    		}
		    	}
				if($("#emp_message_table").datagrid("getSelections").length==0){
					$.messager.alert("系统信息","请选择<b style='color:red'>至少一行</b>");    
				}else if(emp_leader_delete){
					$.messager.alert("系统信息","<b style='color:red'>所选员工中有部门经理,请更换部门经理后删除！</b>"); 
				}else if($("#emp_message_table").datagrid("getSelections").length>=1){
					$.messager.confirm('确认','您确认想要删除这'+$("#emp_message_table").datagrid("getSelections").length+'位员工吗？',function(r){    
					    if (r){
					    	 $.ajax({  
				                    type : "POST",  //提交方式  
				                    url : "deleteEmp",//路径  
				                    data :{"emp_del_array":emp_del_array}, 
				                    traditional:true,
				                    dataType: "json",
				                    success : function(result) {//返回数据根据结果进行相应的处理  
					        			if(result==emp_del_getSelections.length){
					        				$.messager.show({
					        					title:'系统消息',
					        					msg:'删除成功，已删除' + result + '条',
					        					timeout:3000,
					        					showType:'fade'
					        				});
					        				$('#emp_message_table').datagrid('reload');
					        			}else{
					        				$.messager.show({
					        					title:'系统消息',
					        					msg:'删除失败',
					        					timeout:3000,
					        					showType:'show'
					        				});
					        				$('#emp_message_table').datagrid('reload');
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
				$('#emp_ins_dialog').dialog({    
				    title: '员工新增',    
				    width: 600,    
				    height: 250,    
				    closed: false,    
				    cache: false,   
				    draggable:false,
				    href: "emp/emp_ins.jsp",    
				    modal: true
				});  	
			}
		},'-',{
			text:"多选",
			iconCls: 'icon-ok',
			handler: function(){
				if($("#emp_message_table").datagrid("getColumnOption","dept_ck").hidden==true){
					$("#emp_message_table").datagrid("showColumn","dept_ck");
					$("#emp_message_table").datagrid("options").singleSelect=false;
					$('#emp_message_table').datagrid('reload');
				}else{
					$("#emp_message_table").datagrid("hideColumn","dept_ck");
					$("#emp_message_table").datagrid("options").singleSelect=true;
					$('#emp_message_table').datagrid('reload');
				}
			}
		},'-',{
			text:"清空所有员工",
			iconCls: 'icon-cut',
			handler: function(){
				/* var emp_empty_getSelections =  $("#emp_message_table").datagrid("getSelections");
		    	var emp_leader_empty = false;
		    	for(var i=0;i<emp_del_getSelections.length;i++){
		    		if(emp_empty_getSelections[i].emp_name==emp_empty_getSelections[i].dept.dept_leader){
		    			emp_leader_empty =true;
		    		}
		    	}
				if(emp_leader_empty){
					$.messager.alert("系统信息","<b style='color:red'>员工中有部门经理,请更换部门经理后删除！</b>"); 
				} */
				$.messager.confirm('确认','您确认想要清空所有员工记录吗？',function(r){    
				    if (r){
				    	 $.post("emptyEmp",  
			                 		function(result) {
				        			if(result>0){
				        				$.messager.show({
				        					title:'系统消息',
				        					msg:'删除成功，已删除' + result + '条员工信息',
				        					timeout:3000,
				        					showType:'fade'
				        				});
				        				$('#emp_message_table').datagrid('reload');
				        			}else{
				        				$.messager.show({
				        					title:'系统消息',
				        					msg:'删除失败',
				        					timeout:3000,
				        					showType:'show'
				        				});
				        				$('#emp_message_table').datagrid('reload');
				        			}
			                });  
				    }    
				});  
			}
		}]
	}); 
	
})
</script>
<table id="emp_message_table"></table>  
<div id="emp_edit_dialog"></div>  
<div id="emp_ins_dialog"></div>  

</body>
</html>