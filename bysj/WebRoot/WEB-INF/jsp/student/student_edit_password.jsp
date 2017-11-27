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
    
    <title>主页</title>
    
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
	<style type="text/css">
	.container2{
	 width: 600px;
    margin: 0 auto;
	}
	</style>
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
          <a class="navbar-brand" href="#">学生端</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<li><a href="<%= basePath %>student_main.action">主页</a></li>
            <li><a href="<%= basePath %>studentListCourse.action">课程管理</a></li>
            <li><a href="#">作业管理</a></li>
            <li><a href="#">文章发布</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><s:property value="#session.exitStudent.sname"/>你好</a></li>
            <li class="dropdown active">
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
  
  <div class="container2">
  <h3><s:actionerror/></h3>
  	<s:form class="form-signin" action="studentUpdatePassword.action" method="post" theme="simple">
       <h1>修改密码</h1>
       <table class="table table-striped">
       <s:hidden name="sid" value="%{#session.exitStudent.sid}"/>
       	<tr>
       		<td>账号：</td>
       		<td><s:property value="#session.exitStudent.sid"/> </td>
       	</tr>
       	<tr>
       		<td>输入原始密码：</td>
       		<td><s:password name="oldpassword"  class="form-control"/> </td>
       	</tr>
       	<tr>
       		<td>输入新密码：</td>
       		<td><s:password name="newpassword1" class="form-control"/></td>
       	</tr>
       	<tr>
       		<td>确认新密码：</td>
       		<td><s:password name="newpassword2" class="form-control"/></td>
       	</tr>
       </table>
       <button class="btn btn-lg btn-primary btn-block" type="submit">修改</button>
     </s:form>
  </div>

  </body>
</html>
