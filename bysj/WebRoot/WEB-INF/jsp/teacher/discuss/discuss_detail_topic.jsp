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
    
    <title>文章发布</title>
    
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link href="<%=basePath %>css/detail_topic.css" rel="stylesheet" type="text/css" />
    
	
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
          <a class="navbar-brand" href="#">教师端</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<li><a href="<%= basePath %>teacher_main.action">主页</a></li>
            <li><a href="<%= basePath %>teacherListClass.action">分组管理</a></li>
            <li><a href="<%= basePath %>teacherListCourse.action">课程管理</a></li>
            <li><a href="#">作业管理</a></li>
            <li class="active"><a href="#">文章发布</a></li>
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
  
  <div class="container2">

      <h3 class="page-title">title</h3>
    <p class="question-info">
        <span>作者：username</span>
        <span>时间：create_time</span>
    </p>
    <hr>
    <p class="question-content">
        content
    </p>
    <hr>
    <h4>评论：（length）</h4>
    <form action="#" method="post">
        <div class="form-group">
            <input type="text" name="comment" class="form-control" placeholder="请填写评论">
            <input type="hidden" name="question_id" value="{{ question.id }}">
        </div>
        <div class="form-group" style="text-align: right">
            <button type="submit" class="btn btn-primary">立即评论</button>
        </div>
    </form>
    <ul class="comment-list">
      
        <li>
            <div class="user-info">
                <span class="username">username</span>
                <span class="create-time">create_time</span>
            </div>
            <p class="comment-content">content</p>
        </li>
        <li>
            <div class="user-info">
                <span class="username">username</span>
                <span class="create-time">create_time</span>
            </div>
            <p class="comment-content">content</p>
        </li>


    </ul>
    </div>
  
  </body>
</html>
