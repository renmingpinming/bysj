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
    
    <title>课程管理</title>
    
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
	
  </head>
  
  <body style="background: url('images/bg3.jpg'); background-repeat:no-repeat;background-size:100% 100%;background-attachment: fixed;">
  <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">学生端</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<li><a href="<%= basePath %>student_main.action">主页</a></li>
            <li class="active"><a href="<%= basePath %>studentListCoursePage.action">课程管理</a></li>
            <li><a href="<%= basePath %>studentHomeworkMain.action">作业管理</a></li>
            <li><a href="<%= basePath %>studentTopicGetAll.action">文章发布</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><s:property value="#session.exitStudent.sname"/>你好</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">信息维护 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="<%= basePath %>studentEditImformation.action?sid=<s:property value="#session.exitStudent.sid"/>">个人信息</a></li>
                <li><a href="<%= basePath %>studentEditPassword.action">修改密码</a></li>
              </ul>
            </li>
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
          <div class="jumbotron">
            <h1>课程管理</h1>
            <p>所选的课程</p>
          </div>
          <div class="row">
          	 <s:iterator value="#session.exitStudent.courses" var="c">
	          	 <div class="col-xs-6 col-lg-4">
	              <h2><s:property value="#c.cname"/></h2>
	              <p>简介：<s:property value="#c.introduce"/></p>
	              <p><a class="btn btn-default" href="<%= basePath %>studentDeleteCourse.action?sid=<s:property value="#session.exitStudent.sid"/>&cid=<s:property value="#c.cid"/>">删除课程</a> </p>
	            </div><!--/.col-xs-6.col-lg-4-->
             </s:iterator>
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
            <a href="<%= basePath %>studentListCourse.action?sid=<s:property value="#session.exitStudent.sid"/>" class="list-group-item active">查看课程</a>
            <a href="<%= basePath %>studentAddCourseList.action" class="list-group-item">添加课程</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->
    </div>

  </body>
</html>
