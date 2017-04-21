<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
    <link rel="stylesheet" href="css/login.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery.js"></script>
  </head>
  
  <body>
  
      
  
       <table class="table table-bordered table-striped">
             <thead>
             	<tr><th>用户编号</th><th>用户名</th><th>用户邮箱</th><th>phone</th></tr>
             </thead>
             <tbody >
	             <c:forEach items="${alluser}" var="user">
	             
	                  <tr><td>${user.userId}</td><td>${user.userName}</td><td>${user.email}</td><td>${user.phone}</td></tr>
	             
	             </c:forEach>
             </tbody>
       
       </table>
       
      <c:import url="http://localhost:8080/newsmg/common/page.do">
           <c:param name="currentPage" value="${currentPage}"></c:param>
           <c:param name="totalPage" value="${totalPage }"></c:param>
           <c:param name="url" value="${url}"></c:param>
      </c:import>
       
       
  </body>
</html>
