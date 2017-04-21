
 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<c:import url="common/top.do"></c:import>



	<!-- 两侧对联广告开始 -->
      <div id="leftDiv" style="z-index:9998;position: fixed; top: 60px; left: 2%;">
			<div>
				<img src="${adv2[0].advurl}" alt="${adv2[0].advname}" style="width:${adv2[0].width}px;height:${adv2[0].height}px;">
			</div>
			<span style="font-size:12px;color:red;cursor:pointer;" onclick="document.getElementById('leftDiv').style.display='none'">关闭×</span>
		</div>

		<div id="rightDiv" style="z-index:9998;position: fixed; top: 60px; right: 2%;">
			<div>
				<img src="${adv2[1].advurl}" alt="${adv2[1].advname}" style="width:${adv2[1].width}px;height:${adv2[1].height}px;">
			</div>
			<span style="font-size:12px;color:red;cursor:pointer;text-align:right;" onclick="document.getElementById('rightDiv').style.display='none'">关闭×</span>
		</div>
		<!-- 两侧对联广告结束 -->
		
		
		<!-- 底部广告开始 -->
		<div id="bottomDiv" style="z-index:9999;position: fixed; bottom: 1px; right: 1%;">
			<div>
				<img src="${adv2[2].advurl}" alt="${adv2[2].advname}" style="width:${adv2[2].width}px;height:${adv2[2].height}px;">
			</div>
			<span style="font-size:12px;color:red;cursor:pointer;text-align:right;" onclick="document.getElementById('bottomDiv').style.display='none'">关闭×</span>
		</div>
		<!-- 底部广告结束 -->






<!-- 顶端轮播广告开始 -->
<div id="main">
<span style="font-size:12px;color:red;cursor:pointer;" onclick="document.getElementById('main').style.display='none'">关闭×</span>
       <div class="scollimg">
	       <c:forEach items="${adv}" var="adv">
	           <img src="${adv.advurl}" alt="${adv.time}">
	       </c:forEach>
       </div>

       <div class="item">
	       <c:forEach items="${adv}" var="adv">
	           <span></span>
	       </c:forEach>
       </div>
 </div>
<!-- 顶端轮播广告结束 -->

 <div class="container" style="margin: 15px auto;">

      <div class="col-md-9" style="z-index: 0">
         <c:forEach items="${newslist}" var="news">
              
          <div class="panel panel-default">
              <div class="panel-heading">
                    ${news.newsTitle}
              </div>
              <div class="panel-body">
                      <a href="newsinfo/detail.do?newsid=${news.id}">${fn:substring(news.newsContent,0,150)} ... </a>                             
              </div>
              <div class="panel-footer">
                   	发布:${news.pubtime} 作者:${news.pubuser} 阅读:${news.clickNum}
              </div>
      </div>
              
         
         </c:forEach>
         
         
         <c:import url="http://localhost:8080/newsmg/common/page.do">
           <c:param name="currentPage" value="${currentPage}"></c:param>
           <c:param name="totalPage" value="${totalPage }"></c:param>
           <c:param name="url" value="${url}"></c:param>
         </c:import>
      
      
      </div>

      <div class="col-md-3">
          
              	
   			<div class="list-group">
		      	<span class="list-group-item">
			   		<span class="btn  "><span class="glyphicon   glyphicon-heart"></span> </span> <a href="#"  style="font-size: 12pt;color: #222;">最热新闻</a>
			  	</span>
			   <ul class="nav list-group-item">
			   		<li  ><a href="/my"  >最热新闻1</a></li>
			     	<li  ><a href="/my"  >最热新闻2</a></li>
			       	<li  ><a href="/my"  >最热新闻3</a></li>
			        <li  ><a href="/my"  >最热新闻4</a></li>
			   </ul>
			</div>
          
      </div>

 
 </div>

<c:import url="common/bottom.do"></c:import>