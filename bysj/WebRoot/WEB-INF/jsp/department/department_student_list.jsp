<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生管理</title>
    
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
	
  </head>
  
  <body>
  
  <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">部门端</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="<%= basePath %>department_main.action">主页</a></li>
            <li><a href="<%= basePath %>departmentTeacher.action">教师管理</a></li>
            <li class="active"><a href="<%= basePath %>departmentStudent.action">学生管理</a></li>
            <li><a href="<%= basePath %>departmentCourse.action">课程管理</a></li>
            <li><a href="<%= basePath %>departmentClass.action">班级管理</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><s:property value="#session.exitDepartment.dname"/>你好</a></li>
            <li><a href="<%= basePath %>index.action">注销</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
  </nav>
  
  <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div>
          	<h1>学生显示</h1>
            <table cellspacing="0" border="1" class="table table-striped">
				<thead>
					<tr>
						<td align="center">ID</td>
						<td align="center">姓名</td>
						<td align="center">性别</td>
						<td align="center">电话</td>
						<td align="center">邮箱</td>
						<td align="center">删除</td>
					</tr>
				</thead>
				<tbody>
	  			<s:iterator value="pageBean.list" var="d">  
					<tr>
						<td align="center"><s:property value="#d.sid"/></td>
						<td align="center"><s:property value="#d.sname"/></td>
						<td align="center"><s:property value="#d.sex"/></td>
						<td align="center"><s:property value="#d.telephone"/></td>
						<td align="center"><s:property value="#d.email"/></td>
						<td align="center"><a href="<%= basePath %>departmentStudentDelete.action?sid=<s:property value="#d.sid"/>">删除</a></td>
					</tr>
				</s:iterator> 
				</tbody>
					
			</table>
			<br/>
					
			<table border="0" cellspacing="0" cellpadding="0"  width="900px">
			<tr>
				<td align="right">
				<span>
				第<s:property value="pageBean.currPage"/>/<s:property value="pageBean.totalPage"/>页
				</span>&nbsp;&nbsp;
					总记录数<s:property value="pageBean.totalCount"/>&nbsp;&nbsp;
					每页显示<s:property value="pageBean.pageSize"/>&nbsp;&nbsp;
				<span>
	  		   <s:if test="pageBean.currPage != 1">   
			       <a href="<%= basePath%>departmentStudentList.action?currPage=1">[首页]</a>&nbsp;&nbsp;
			       <a href="<%= basePath%>departmentStudentList.action?currPage=<s:property value="pageBean.currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
			   </s:if>
			   <s:if test="pageBean.currPage != pageBean.totalPage"> 
			       <a href="<%= basePath%>departmentStudentList.action?currPage=<s:property value="pageBean.currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
			       <a href="<%= basePath%>departmentStudentList.action?currPage=<s:property value="pageBean.totalPage"/>">[尾页]</a>&nbsp;&nbsp;
			   </s:if>
			   </span>
				</td>
			</tr>
			</table>
          </div>
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
            <a href="<%= basePath %>departmentStudentList.action" class="list-group-item active">删除学生</a>
            <a href="<%= basePath %>departmentStudentAddList.action" class="list-group-item">添加学生</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->
    </div>
  
  </body>
</html>
