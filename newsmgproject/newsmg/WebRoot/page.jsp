<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div style="width: 500px;margin: 5px auto">
       <nav aria-label="...">
		  <ul class="pager">
		    <li><a href="${url}?currentPage=1">首页</a></li>
		    
		    <c:choose>
		        <c:when test="${currentPage==1}">
		            <li class="disabled"><a  class="disabled">上页</a></li>   
		        </c:when>
		        <c:when test="${currentPage>1}">
		           <li><a href="${url}?currentPage=${currentPage-1}">上页</a></li> 
		        </c:when>
		    
		    </c:choose>
		    
		    <c:choose>
		        <c:when test="${currentPage==totalPage}">
		            <li class="disabled"><a  class="disabled">下页</a></li>   
		        </c:when>
		        <c:when test="${currentPage<totalPage}">
		           <li><a href="${url}?currentPage=${currentPage+1}">下页</a></li> 
		        </c:when>
		    
		    </c:choose>
		    
		 
		    <li><a href="${url}?currentPage=${totalPage}">末页</a></li>
		  </ul>
	  </nav>
      </div> 