<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生列表</title>
    
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
	
  </head>
  
  <body style="background: url('images/bg.jpg'); background-repeat:no-repeat;background-size:100% 100%;background-attachment: fixed;">
  <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">教师端</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<li><a href="<%= basePath %>teacher_main.action"">主页</a></li>
            <li class="active"><a href="<%= basePath %>teacherListClassPage.action">分组管理</a></li>
            <li><a href="<%= basePath %>teacherListCoursePage.action">课程管理</a></li>
            <li><a href="<%= basePath %>teacherHomeworkMain.action">作业管理</a></li>
            <li><a href="<%= basePath %>teacherTopicGetAll.action">文章发布</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><s:property value="#session.exitTeacher.tname"/>你好</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">信息维护 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="<%= basePath %>teacherEditImformation.action?tid=<s:property value="#session.exitTeacher.tid"/>">个人信息</a></li>
                <li><a href="<%= basePath %>teacherEditPassword.action">修改密码</a></li>
              </ul>
            </li>
            <li><a href="<%= basePath %>index.action">注销</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
  </nav>
  
  
  <div class="container">
  	
	<div class="table-responsive">
		<h1><s:property value="%{model.name}"/>--学生名单</h1>
	    <table class="table table-striped">
	      <thead>
	        <tr>
	          <th>学号</th>
	          <th>姓名</th>
	          <th>班级</th>
	          <th>性别</th>
	          <th>电话</th>
	          <th>邮箱</th>
	        </tr>
	      </thead>
	      <tbody>
	        <s:iterator value="%{model.students}" var="s">
		        <tr>
		          <td><s:property value="#s.sid"/></td>
		          <td><s:property value="#s.sname"/></td>
		          <td><s:property value="#s.classname.name"/></td>
		          <td><s:property value="#s.sex"/></td>
		          <td><s:property value="#s.telephone"/></td>
		          <td><s:property value="#s.email"/></td>
		         </tr>
	         </s:iterator>
	       </tbody>
	    </table>
  	 </div>
    </div>
  </body>
</html>
