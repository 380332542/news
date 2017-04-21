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
  <link rel="stylesheet" href="styles/lunbo.css" type="text/css"</link>



  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/ad.js"></script>

  
  <script type="text/javascript">
        $(function(){
        	$("#keywordsbtn").click(function(){
        		
        		 
        		  if($("#keyword").val().length>0)
        		  {
        			  window.location.href="newsinfo/keywordsquery.do?keyword="+$("#keyword").val() ;
        			  
        		  }
        		  else
        		 {
        			  alert("请输入要搜索的关键字");
        			  return ;
        			  
        		 }
        		
        		  
        	});
        })
      
  
  </script>

 </head>
 <body>
   <nav class="nav navbar-inverse  " style="filter:alpha(Opacity=90);" role="navigation">
   	<div class="container" style="z-index: 999">
	   		<div class="navbar-header">
	   	     <a href="#" class="navbar-brand">
	   	         <strong>南大软件学院</strong>
	   	     </a>
	   		</div>
	
		   	<ul class="nav navbar-nav" >
		   			<li><a href="#">首页</a></li>
		   			<li><a href="newsinfo/newslist.do">新闻</a></li>
		   			
		   			<li><a href="#">教育</a></li>
		   			<li><a href="#">科技</a></li>
		   			<c:if test="${cookie.username.value=='admin'}">
			   			<li  class="dropdown" >
			   			    <a href="#" class="dropdown-toggle" data-toggle="dropdown">管理员设置<span class="caret"></span></a>
			   			    <ul class="dropdown-menu" >
	                              <li ><a href="msg.jsp">信息发送</a></li>
	                             
	                        </ul>
			   			</li>
		   			</c:if>
		   			
		   			
		   			
		   	</ul>
		   	
		   	
	   		<div class="navbar-form navbar-right">
	   			<div class="form-group">	
		   			<div class="input-group">
		   				<input type="text" id="keyword" class="form-control" placeholder="请输入文章关键字"  />
		   				<div class="input-group-btn">
		   					<button class="btn btn-block" id="keywordsbtn"><span class="glyphicon glyphicon-search"></span></button>
		   				</div>
		   			</div>	
	   			</div>
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