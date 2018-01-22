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
    
    <title>分组管理</title>
    
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
            <li><a href="<%= basePath %>teacher_main.action">主页</a></li>
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

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="jumbotron">
            <h1>分组管理</h1>
            <p>所带班级</p>
          </div>
          <div class="row">
          	 <s:iterator value="#session.exitTeacher.classnames" var="c">
	          	 <div class="col-xs-6 col-lg-4">
	              <h2><s:property value="#c.name"/></h2>
	              <p><a class="btn btn-default" href="<%= basePath %>teacherClassListStudent.action?id=<s:property value="#c.id"/>" role="button">显示学生 &raquo;</a></p>
	              <p><a class="btn btn-default" href="<%= basePath %>teacherDeleteClass.action?id=<s:property value="#c.id"/>" role="button">删除班级 &raquo;</a></p>
	          
	            </div><!--/.col-xs-6.col-lg-4-->
             </s:iterator>
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
            <a href="<%= basePath %>teacherListClass.action?tid=<s:property value="#session.exitTeacher.tid"/>" class="list-group-item active">查看班级</a>
            <a href="<%= basePath %>teacherAddClassList.action" class="list-group-item">添加班级</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->
    </div>
  </body>
</html>
