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
	<style type="text/css">
    .form-signin{
    width: 600px;
    margin-left: 280px;
    }
    </style>
  </head>
  
  <body style="background: url('images/bg6.jpg'); background-repeat:no-repeat;background-size:100% 100%;background-attachment: fixed;">
  
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

      <s:form class="form-signin" action="deparementStudentUpdate.action" method="post" theme="simple">
        <h1>个人信息</h1>
       <table class="table table-striped">
       <s:hidden name="sid" value="%{model.sid}"/>
       <s:hidden name="password" value="%{model.password}"/>
       	<tr>
       		<td>姓名：</td>
       		<td><s:textfield name="sname" class="form-control" value="%{model.sname}"/></td>
       	</tr>
       	<tr>
       		<td>班级：</td>
       		<td>
       			<s:select list="list" value="%{model.classname.id}" name="classname.id" listKey="id" listValue="name" headerKey="0" headerValue="请选择班级" class="radio-inline"></s:select>
       		</td>
       	</tr>
       	<tr>
       		<td>性别：</td>
       		<td>
       	
       			<s:radio name="sex" class="radio-inline" list="{'男','女'}" value="%{model.sex}"></s:radio>
       	
       		</td>
       	</tr>
       	<tr>
       		<td>电话：</td>
       		<td><s:textfield name="telephone" class="form-control" value="%{model.telephone}"/></td>
       	</tr>
       	<tr>
       		<td>email：</td>
       		<td><s:textfield name="email" class="form-control" value="%{model.email}"/></td>
       	</tr>
       </table>
       <button class="btn btn-lg btn-primary center-block" type="submit">提交</button>
     </s:form>
    </div>
  
  </body>
</html>
