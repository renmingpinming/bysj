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
    <link href="<%=basePath %>css/list_topic.css" rel="stylesheet" type="text/css" />
	
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
            <li><a href="<%= basePath %>teacherListClassPage.action">分组管理</a></li>
            <li><a href="<%= basePath %>teacherListCoursePage.action">课程管理</a></li>
            <li><a href="<%= basePath %>teacherHomeworkMain.action">作业管理</a></li>
            <li class="active"><a href="<%= basePath %>teacherTopicGetAll.action">文章发布</a></li>
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
  	<h2>所有主题</h2>
  	<form class="navbar-form navbar-left" action="teacherTopicSearchAll.action" method="post">
		<div class="form-group">
	    	<input name="key" type="text" class="form-control" placeholder="请输入关键字">
	    </div>
	    <button type="submit" class="btn btn-default">查找</button>
    </form>

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>

          <ul>
		        <s:iterator value="pageBean.list" var="topic">
		        <li>
		            <div class="question-group">
		                <p class="question-title"><a href="<%= basePath %>teacherTopicDetail.action?questionId=<s:property value="#topic.id"/>"><s:property value="#topic.title"/></a></p>
		                <p class="question-content"><s:property value="#topic.content"/></p>
		                <div class="question-info">
		                    <span class="question-author"><s:property value="#topic.author_name"/></span>
		                    <span class="question-time"><s:property value="#topic.create_time"/></span>
		                </div>
		            </div>
		        </li>
		        </s:iterator>
			</ul>
			<table border="0" cellspacing="0" cellpadding="0"  width="550px">
			<tr>
				<td align="right">
				<span>
				第<s:property value="pageBean.currPage"/>/<s:property value="pageBean.totalPage"/>页
				</span>&nbsp;&nbsp;
					总记录数<s:property value="pageBean.totalCount"/>&nbsp;&nbsp;
					每页显示<s:property value="pageBean.pageSize"/>&nbsp;&nbsp;
				<span>
	  		   <s:if test="pageBean.currPage != 1">   
			       <a href="<%= basePath%>teacherTopicGetAll.action?currPage=1">[首页]</a>&nbsp;&nbsp;
			       <a href="<%= basePath%>teacherTopicGetAll.action?currPage=<s:property value="pageBean.currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
			   </s:if>
			   <s:if test="pageBean.currPage != pageBean.totalPage"> 
			       <a href="<%= basePath%>teacherTopicGetAll.action?currPage=<s:property value="pageBean.currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
			       <a href="<%= basePath%>teacherTopicGetAll.action?currPage=<s:property value="pageBean.totalPage"/>">[尾页]</a>&nbsp;&nbsp;
			   </s:if>
			   </span>
				</td>
			</tr>
			</table>
        </div><!--/.col-xs-12.col-sm-9-->

        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group">
            <a href="<%= basePath%>teacherTopicGetTea.action" class="list-group-item">我的主题</a>
            <a href="<%= basePath%>teacherShowTopicAdd.action" class="list-group-item">发布主题</a>
            <a href="<%= basePath%>teacherTopicGetStu.action" class="list-group-item">学生主题</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->
    </div>
  
  </body>
</html>
