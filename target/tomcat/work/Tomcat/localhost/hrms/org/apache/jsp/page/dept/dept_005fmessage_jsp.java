/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-01-26 13:16:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.page.dept;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class dept_005fmessage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\t\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("\t$('#dept_message_table').datagrid({    \r\n");
      out.write("\t    url:'showDept',    \r\n");
      out.write("\t    columns:[[    \r\n");
      out.write("\t    \t{field:'dept_ck',checkbox:true,width:200,hidden:true},\r\n");
      out.write("\t    \t{field:'dept_id',title:'编号',width:100,hidden:true}, \r\n");
      out.write("\t        {field:'dept_name',title:'部门名',width:100},    \r\n");
      out.write("\t        {field:'dept_leader',title:'部门经理',width:100},    \r\n");
      out.write("\t        {field:'dept_num',title:'部门总人数',width:50,align:'center'}\r\n");
      out.write("\t    ]],\r\n");
      out.write("\t    pagination:true,\r\n");
      out.write("\t    pageList:[\"2\",\"3\",\"5\",\"10\"],\r\n");
      out.write("\t    fitColumns:true,\r\n");
      out.write("\t    striped:true,\r\n");
      out.write("\t    rownumbers:true,\r\n");
      out.write("\t    singleSelect:true,\r\n");
      out.write("\t    toolbar: [{\r\n");
      out.write("\t\t\ticonCls: 'icon-edit',\r\n");
      out.write("\t\t\ttext:\"编辑\",\r\n");
      out.write("\t\t\thandler: function(){\r\n");
      out.write("\t\t\t\tif($(\"#dept_message_table\").datagrid(\"getSelections\").length!=1){\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"系统信息\",\"请选择<b style='color:red'>一行</b>\");    \r\n");
      out.write("\t\t\t\t}else if($(\"#dept_message_table\").datagrid(\"getSelected\").dept_name==\"无\"){\r\n");
      out.write("\t\t\t\t\t\t$.messager.alert(\"系统信息\",\"<b style='color:red'>所选部门中有部门不能编辑</b>\"); \r\n");
      out.write("\t\t\t\t}else if($(\"#dept_message_table\").datagrid(\"getSelections\").length==1){\r\n");
      out.write("\t\t\t\t\t$('#dept_edit_dialog').dialog({    \r\n");
      out.write("\t\t\t\t\t    title: '修改',    \r\n");
      out.write("\t\t\t\t\t    width: 600,    \r\n");
      out.write("\t\t\t\t\t    height: 250,    \r\n");
      out.write("\t\t\t\t\t    closed: false,    \r\n");
      out.write("\t\t\t\t\t    cache: false, \r\n");
      out.write("\t\t\t\t\t    draggable:false,\r\n");
      out.write("\t\t\t\t\t    href: \"dept/dept_edit.jsp\",    \r\n");
      out.write("\t\t\t\t\t    modal: true,\r\n");
      out.write("\t\t\t\t\t    onLoad:function(){\r\n");
      out.write("\t\t\t\t\t    \t$(\"#dept_edit_form :text:eq(0)\").val($(\"#dept_message_table\").datagrid(\"getSelected\").dept_name);\r\n");
      out.write("\t\t\t\t\t    \t$(\"#dept_edit_form :text:eq(1)\").val($(\"#dept_message_table\").datagrid(\"getSelected\").dept_leader);\r\n");
      out.write("\t\t\t\t\t    \t$(\"#dept_edit_form :hidden:eq(0)\").val($(\"#dept_message_table\").datagrid(\"getSelected\").dept_id);\r\n");
      out.write("\t\t\t\t\t    }\r\n");
      out.write("\t\t\t\t\t});  \t\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t},'-',{\r\n");
      out.write("\t\t\ttext:\"删除\",\r\n");
      out.write("\t\t\ticonCls: 'icon-remove',\r\n");
      out.write("\t\t\thandler: function(){\r\n");
      out.write("\t\t\t\tif($(\"#dept_message_table\").datagrid(\"getSelections\").length==0){\r\n");
      out.write("\t\t\t\t\t$.messager.alert(\"系统信息\",\"请选择<b style='color:red'>至少一行</b>\");    \r\n");
      out.write("\t\t\t\t}else if($(\"#dept_message_table\").datagrid(\"getSelected\").dept_name==\"无\"){\r\n");
      out.write("\t\t\t\t\t\t$.messager.alert(\"系统信息\",\"<b style='color:red'>所选部门中有部门不能删除</b>\"); \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\telse\r\n");
      out.write("\t\t\t\tif($(\"#dept_message_table\").datagrid(\"getSelections\").length>=1){\r\n");
      out.write("\t\t\t\t\t$.messager.confirm('确认','您确认想要删除这'+$(\"#dept_message_table\").datagrid(\"getSelections\").length+'个部门吗？',function(r){    \r\n");
      out.write("\t\t\t\t\t    if (r){\r\n");
      out.write("\t\t\t\t\t    \tvar dept_del_emp_num = 0;\r\n");
      out.write("\t\t\t\t\t    \tvar dept_del_getSelections =  $(\"#dept_message_table\").datagrid(\"getSelections\");\r\n");
      out.write("\t\t\t\t\t    \tvar dept_del_array = new Array(dept_del_getSelections.length);\r\n");
      out.write("\t\t\t\t\t    \tfor(var i=0;i<dept_del_getSelections.length;i++){\r\n");
      out.write("\t\t\t\t\t    \t\tdept_del_array[i] = dept_del_getSelections[i].dept_id;\r\n");
      out.write("\t\t\t\t\t    \t\tdept_del_emp_num+=dept_del_getSelections[i].dept_num;\r\n");
      out.write("\t\t\t\t\t    \t}\r\n");
      out.write("\t\t\t\t\t    \t $.ajax({  \r\n");
      out.write("\t\t\t\t                    type : \"POST\",  //提交方式  \r\n");
      out.write("\t\t\t\t                    url : \"deleteDept\",//路径  \r\n");
      out.write("\t\t\t\t                    data :{\"dept_del_array\":dept_del_array}, \r\n");
      out.write("\t\t\t\t                    traditional:true,//序列化，用来传数组\r\n");
      out.write("\t\t\t\t                    dataType: \"json\",\r\n");
      out.write("\t\t\t\t                    success : function(result) {//返回数据根据结果进行相应的处理  \r\n");
      out.write("\t\t\t\t\t        \t\t\tif(result==dept_del_array.length+dept_del_emp_num){\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t\ttitle:'系统消息',\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t\tmsg:\"<b style='color:green'>删除成功!，已删除\" + dept_del_array.length + \"个部门,共\"\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t\t+ dept_del_emp_num + \"位员工变为无部门状态！\",\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t\ttimeout:3000,\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t\tshowType:'fade'\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t});\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t$('#dept_message_table').datagrid('reload');\r\n");
      out.write("\t\t\t\t\t        \t\t\t}else{\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t\ttitle:'系统消息',\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t\tmsg:'删除失败',\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t\ttimeout:3000,\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t\tshowType:'show'\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t});\r\n");
      out.write("\t\t\t\t\t        \t\t\t\t$('#dept_message_table').datagrid('reload');\r\n");
      out.write("\t\t\t\t\t        \t\t\t}\r\n");
      out.write("\t\t\t\t                    }  \r\n");
      out.write("\t\t\t\t                });  \r\n");
      out.write("\t\t\t\t\t    \t\r\n");
      out.write("\t\t\t\t\t    }    \r\n");
      out.write("\t\t\t\t\t    \r\n");
      out.write("\t\t\t\t\t});  \r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t},'-',{\r\n");
      out.write("\t\t\ttext:\"新增\",\r\n");
      out.write("\t\t\ticonCls: 'icon-add',\r\n");
      out.write("\t\t\thandler: function(){\r\n");
      out.write("\t\t\t\t$('#dept_ins_dialog').dialog({    \r\n");
      out.write("\t\t\t\t    title: '部门新增',    \r\n");
      out.write("\t\t\t\t    width: 600,    \r\n");
      out.write("\t\t\t\t    height: 250,    \r\n");
      out.write("\t\t\t\t    closed: false,    \r\n");
      out.write("\t\t\t\t    cache: false,  \r\n");
      out.write("\t\t\t\t    draggable:false,\r\n");
      out.write("\t\t\t\t    href: \"dept/dept_ins.jsp\",    \r\n");
      out.write("\t\t\t\t    modal: true\r\n");
      out.write("\t\t\t\t});  \t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t},'-',{\r\n");
      out.write("\t\t\ttext:\"多选\",\r\n");
      out.write("\t\t\ticonCls: 'icon-ok',\r\n");
      out.write("\t\t\thandler: function(){\r\n");
      out.write("\t\t\t\tif($(\"#dept_message_table\").datagrid(\"getColumnOption\",\"dept_ck\").hidden==true){\r\n");
      out.write("\t\t\t\t\t$(\"#dept_message_table\").datagrid(\"showColumn\",\"dept_ck\");\r\n");
      out.write("\t\t\t\t\t$(\"#dept_message_table\").datagrid(\"options\").singleSelect=false;\r\n");
      out.write("\t\t\t\t\t$('#dept_message_table').datagrid('reload');\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$(\"#dept_message_table\").datagrid(\"hideColumn\",\"dept_ck\");\r\n");
      out.write("\t\t\t\t\t$(\"#dept_message_table\").datagrid(\"options\").singleSelect=true;\r\n");
      out.write("\t\t\t\t\t$('#dept_message_table').datagrid('reload');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t},'-',{\r\n");
      out.write("\t\t\ttext:\"清空所有部门\",\r\n");
      out.write("\t\t\ticonCls: 'icon-cut',\r\n");
      out.write("\t\t\thandler: function(){\r\n");
      out.write("\t\t\t\t$.messager.confirm('确认','您确认想要清空所有部门吗？',function(r){    \r\n");
      out.write("\t\t\t\t    if (r){\r\n");
      out.write("\t\t\t\t    \t $.post(\"emptyDept\",  \r\n");
      out.write("\t\t\t                 \t\tfunction(result) {\r\n");
      out.write("\t\t\t\t        \t\t\tif(result>0){\r\n");
      out.write("\t\t\t\t        \t\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\t        \t\t\t\t\ttitle:'系统消息',\r\n");
      out.write("\t\t\t\t        \t\t\t\t\tmsg:'删除成功，已删除' + result + '条部门信息',\r\n");
      out.write("\t\t\t\t        \t\t\t\t\ttimeout:3000,\r\n");
      out.write("\t\t\t\t        \t\t\t\t\tshowType:'fade'\r\n");
      out.write("\t\t\t\t        \t\t\t\t});\r\n");
      out.write("\t\t\t\t        \t\t\t\t$('#dept_message_table').datagrid('reload');\r\n");
      out.write("\t\t\t\t        \t\t\t}else{\r\n");
      out.write("\t\t\t\t        \t\t\t\t$.messager.show({\r\n");
      out.write("\t\t\t\t        \t\t\t\t\ttitle:'系统消息',\r\n");
      out.write("\t\t\t\t        \t\t\t\t\tmsg:'删除失败',\r\n");
      out.write("\t\t\t\t        \t\t\t\t\ttimeout:3000,\r\n");
      out.write("\t\t\t\t        \t\t\t\t\tshowType:'show'\r\n");
      out.write("\t\t\t\t        \t\t\t\t});\r\n");
      out.write("\t\t\t\t        \t\t\t\t$('#dept_message_table').datagrid('reload');\r\n");
      out.write("\t\t\t\t        \t\t\t}\r\n");
      out.write("\t\t\t                });  \r\n");
      out.write("\t\t\t\t    \t\r\n");
      out.write("\t\t\t\t    }    \r\n");
      out.write("\t\t\t\t    \r\n");
      out.write("\t\t\t\t});  \r\n");
      out.write("\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}]\r\n");
      out.write("\r\n");
      out.write("\t}); \r\n");
      out.write("})\r\n");
      out.write("</script>\r\n");
      out.write("<table id=\"dept_message_table\"></table>  \r\n");
      out.write("<div id=\"dept_edit_dialog\"></div>  \r\n");
      out.write("<div id=\"dept_ins_dialog\"></div>  \r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
