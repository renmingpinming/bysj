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
    
    <title>教师管理</title>
    
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
            <li class="active"><a href="<%= basePath %>departmentTeacher.action">教师管理</a></li>
            <li><a href="<%= basePath %>departmentStudent.action">学生管理</a></li>
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
          	<s:form class="form-signin" action="departmentTeacherAdd.action" method="post" theme="simple">
		        <h1>添加教师</h1>
		       <table class="table table-striped">
		       	<tr>
		       		<td>姓名：</td>
		       		<td><s:textfield name="tname" class="form-control"/></td>
		       	</tr>
		       	<tr>
		       		<td>密码：</td>
		       		<td><s:textfield name="password" class="form-control"/></td>
		       	</tr>
		       	<tr>
		       		<td>性别：</td>
		       		<td><s:textarea name="sex" class="form-control"/> </td>   		
		       	</tr>
		       	<tr>
		       		<td>电话：</td>
		       		<td><s:textarea name="telephone" class="form-control"/> </td>   		
		       	</tr>
		       	<tr>
		       		<td>邮箱：</td>
		       		<td><s:textarea name="email" class="form-control"/> </td>   		
		       	</tr>
		       	<tr>
		       		<td>简介：</td>
		       		<td><s:textarea name="email" class="form-control"/> </td>   		
		       	</tr>
		       </table>
		       <button class="btn btn-lg btn-primary center-block" type="submit">提交</button>
		     </s:form>
          </div>
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
            <a href="<%= basePath %>departmentTeacherList.action" class="list-group-item">编辑教师</a>
            <a href="<%= basePath %>departmentTeacherAddList.action" class="list-group-item active">添加教师</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->
    </div>
  
  </body>
</html>
