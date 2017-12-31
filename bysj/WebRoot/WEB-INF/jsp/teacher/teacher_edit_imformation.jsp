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
    
    <title>个人信息</title>
    
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
            <li><a href="<%= basePath %>teacherListClassPage.action">分组管理</a></li>
            <li><a href="<%= basePath %>teacherListCoursePage.action">课程管理</a></li>
            <li><a href="<%= basePath %>teacherHomeworkMain.action">作业管理</a></li>
            <li><a href="<%= basePath %>teacherTopicGetAll.action">文章发布</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><s:property value="#session.exitTeacher.tname"/>你好</a></li>
            <li class="dropdown active">
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
  	<s:form class="form-signin" action="teacherUpdateImformation.action" method="post" theme="simple">
        <h1>个人信息</h1>
       <table class="table table-striped">
       <s:hidden name="tid" value="%{model.tid}"/>
       <s:hidden name="password" value="%{model.password}"/>
       	<tr>
       		<td>姓名：</td>
       		<td><s:textfield name="tname" class="form-control" value="%{model.tname}"/></td>
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
       	<tr>
       		<td>介绍：</td>
       		<td><s:textarea name="introduce" class="form-control" value="%{model.introduce}"/> </td>   		
       	</tr>
       </table>
       <button class="btn btn-lg btn-primary center-block" type="submit">提交</button>
     </s:form>
  </div>
  </body>
</html>
