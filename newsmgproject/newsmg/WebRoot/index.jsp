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
       
      <div style="width: 500px;margin: 5px auto">
       <nav aria-label="...">
		  <ul class="pager">
		    <li><a href="userinfo/page.do?currentPage=1">首页</a></li>
		    
		    <c:choose>
		        <c:when test="${currentPage==1}">
		            <li class="disabled"><a href="#" class="disabled">上页</a></li>   
		        </c:when>
		        <c:when test="${currentPage>1}">
		           <li><a href="userinfo/page.do?currentPage=${currentPage-1}">上页</a></li> 
		        </c:when>
		    
		    </c:choose>
		    
		    <c:choose>
		        <c:when test="${currentPage==totalPage}">
		            <li class="disabled"><a href="#" class="disabled">下页</a></li>   
		        </c:when>
		        <c:when test="${currentPage<totalPage}">
		           <li><a href="userinfo/page.do?currentPage=${currentPage+1}">下页</a></li> 
		        </c:when>
		    
		    </c:choose>
		    
		 
		    <li><a href="userinfo/page.do?currentPage=${totalPage}">末页</a></li>
		  </ul>
	  </nav>
      </div> 
       
       
  </body>
</html>
