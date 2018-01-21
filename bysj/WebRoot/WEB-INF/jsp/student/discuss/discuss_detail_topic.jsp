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
            <li><a href="<%= basePath %>studentListCoursePage.action">课程管理</a></li>
            <li><a href="<%= basePath %>studentHomeworkMain.action">作业管理</a></li>
            <li class="active"><a href="<%= basePath %>studentTopicGetAll.action">文章发布</a></li>
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
  
  <div class="container2">

      <h3 class="page-title"><s:property value="question.title"/></h3>
    <p class="question-info">
        <span>作者：<s:property value="question.author_name"/></span>
        <span>时间：<s:property value="question.create_time"/></span>
    </p>
    <hr>
    <p class="question-content">
        <s:property value="question.content"/>
    </p>
    <hr>
    <h4>评论：（<s:property value="pageBean.totalCount"/>）</h4>
    <s:form class="form-signin" action="studentCommentAdd.action" method="post" theme="simple">
        <div class="form-group">
            <s:textfield name="content"  class="form-control" placeholder="请填写评论"/>
            <s:hidden name="author_id" value="%{#session.exitStudent.sid}"/>
		    <s:hidden name="author_name" value="%{#session.exitStudent.sname}"/>
		    <s:hidden name="question_id" value="%{question.id}"/>
        </div>
        <div class="form-group" style="text-align: right">
            <button type="submit" class="btn btn-primary">立即评论</button>
        </div>
    </s:form>
    <ul class="comment-list">
      <s:iterator value="pageBean.list" var="comment">
        <li>
            <div class="user-info">
                <span class="username"><s:property value="#comment.author_name"/></span>
                <span class="create-time"><s:property value="#comment.create_time"/></span>
            </div>
            <p class="comment-content"><s:property value="#comment.content"/></p>
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
			       <a href="<%= basePath%>studentTopicDetail.action?currPage=1&questionId=<s:property value="question.id"/>">[首页]</a>&nbsp;&nbsp;
			       <a href="<%= basePath%>studentTopicDetail.action?currPage=<s:property value="pageBean.currPage-1"/>&questionId=<s:property value="question.id"/>">[上一页]</a>&nbsp;&nbsp;
			   </s:if>
			   <s:if test="pageBean.currPage != pageBean.totalPage"> 
			       <a href="<%= basePath%>studentTopicDetail.action?currPage=<s:property value="pageBean.currPage+1"/>&questionId=<s:property value="question.id"/>">[下一页]</a>&nbsp;&nbsp;
			       <a href="<%= basePath%>studentTopicDetail.action?currPage=<s:property value="pageBean.totalPage"/>&questionId=<s:property value="question.id"/>">[尾页]</a>&nbsp;&nbsp;
			   </s:if>
			   </span>
				</td>
			</tr>
			</table>
    </div>
  
  </body>
</html>
