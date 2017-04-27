<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html> 
<html>
<head>
 <base href="<%=basePath%>">
 <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
  <link rel="stylesheet" href="css/login.css" type="text/css"></link>
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
 

 </head>
 <body>
   <nav class="nav navbar-inverse  " style="filter:alpha(Opacity=90);" role="navigation">
   	<div class="container" style="z-index: 999">
	   		<div class="navbar-header">
	   	     <a href="advinfo/advmanage.do" class="navbar-brand">
	   	         <strong>广告管理模块</strong>
	   	     </a>
	   		</div>
	
		   	<ul class="nav navbar-nav" >
		   			<li><a href="advinfo/advmanage.do">轮播广告</a></li>
		   			
		   			<li><a href="advinfo2/advmanage2.do">普通广告</a></li>
		   			
		   			
		   			
		   	</ul>
		   	
		   	
	   		<div class="navbar-form navbar-right">

	   			<div class="form-group" style="padding-left: 10px; margin: 0px 12px;">
	   			
	   			   <c:if test="${cookie.username.value!=null}">
	   			        <a href="#" style="color: #D2D2D2;">${cookie.username.value}</a>
	   			        <span  style="color: #D2D2D2;padding-left: 5px;">|</span>
		   			    <a href="userinfo/logout.do" style="color: #D2D2D2;padding-left: 5px;">安全退出</a>
	   			   </c:if>
	   			   <c:if test="${cookie.username.value==null}">
	   			        <a href="login.jsp" style="color: #D2D2D2;">登录</a>
	   			        <span  style="color: #D2D2D2;padding-left: 5px;">|</span>
		   			    <a href="register.jsp" style="color: #D2D2D2;padding-left: 5px;">注册</a>
	   			   </c:if>
	   			   
		   			
		   			
	   			</div>
	   		</div>	
   	  </div>
   </nav> 