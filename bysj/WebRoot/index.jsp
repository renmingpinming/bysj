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
    
    <title>登录</title>
    
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
	
	<style type="text/css">
	.container{
	 width: 300px;
    margin: 0 auto;
	}
	
	</style>
  </head>
  
  <body>
  <div class="container">
      <s:form class="form-signin" action="login.action" method="post" theme="simple">
      
        <h2 class="form-signin-heading">欢迎登录</h2>
        <h3><s:actionerror/></h3>
        <s:textfield name="user_id" class="form-control" placeholder="账号"/>
        <s:password name="password" class="form-control" placeholder="密码"/>
        <div class="checkbox" align="left">
          <label>
            <s:radio name="ptype" class="radio-inline" list="{'部门','教师','学生'}"></s:radio>
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </s:form>

    </div> 
  
  </body>
</html>
