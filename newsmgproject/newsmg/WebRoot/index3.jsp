<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
    <link rel="stylesheet" href="css/login.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
        	
        	$.get("userlistJson.do",function(data){
        		$.each(data,function(i,value){
        			
        			$tr=$("<tr class='alluser'><td>"+value.userId+"</td><td>"+value.userName+"</td><td>"+value.email+"</td><td>"+value.phone+"</td></tr>");
        			
        		   $("#tb").append($tr);
        		});
        	});
        	
        	
        	$("#first").click(function(){
        		
        		$(this).css("cursor","hand");
        		
        		
        		$.getJSON("userlistJsonPage.do",{"currentPage":"1"},function(data){
        			 $("#currentPage").val(data.currentPage);
        			 $("#totalPage").val(data.totalPage);
        			 $("tbody").empty();
        			
        			$.each(data.userList,function(i,value){
        				
        				$tr=$("<tr class='alluser'><td>"+value.userId+"</td><td>"+value.userName+"</td><td>"+value.email+"</td><td>"+value.phone+"</td></tr>");
        				
             		   $("#tb").append($tr);
             		});
        		});
        		
        		
        		
        	});
        	
        	
          $("#next").click(function(){
        	  
        	   var $cp = parseInt($("#currentPage").val())+1;
        	   var $tp = parseInt($("#totalPage").val());
        	   if($cp>$tp)
        		{
        		   return;
        		}
        	   
        	  
        	  $.getJSON("userlistJsonPage.do",{"currentPage":$cp},function(data){
        		$("#currentPage").val(data.currentPage);
        		$("#totalPage").val(data.totalPage);
     			$("tbody").empty();
     			
     			$.each(data.userList,function(i,value){
     				
     				$tr=$("<tr class='alluser'><td>"+value.userId+"</td><td>"+value.userName+"</td><td>"+value.email+"</td><td>"+value.phone+"</td></tr>");
     				
          		   $("#tb").append($tr);
          		});
     		  });
          
          });
          
         
          
          $("#prev").click(function(){
        	  
            
        	  
        	  
       	   var $cp = parseInt($("#currentPage").val())-1;
       	   
       	   if($cp<1)
       	   {
       		   return;
       	   }
       	   
       	   
       	  
       	   $.getJSON("userlistJsonPage.do",{"currentPage":$cp},function(data){
       			$("#currentPage").val(data.currentPage);
       			$("#totalPage").val(data.totalPage);
    			$("tbody").empty();
    			
    			$.each(data.userList,function(i,value){
    				
    				$tr=$("<tr class='alluser'><td>"+value.userId+"</td><td>"+value.userName+"</td><td>"+value.email+"</td><td>"+value.phone+"</td></tr>");
    				
         		   $("#tb").append($tr);
         		});
    		  });
         
         });
          
          $("#last").click(function(){
        	  
          	   var $cp = $("#totalPage").val();
          	  
          	   $.getJSON("userlistJsonPage.do",{"currentPage":$cp},function(data){
          		$("#currentPage").val(data.currentPage);
          		$("#totalPage").val(data.totalPage);
       			$("tbody").empty();
       			
       			$.each(data.userList,function(i,value){
       				
       				$tr=$("<tr class='alluser'><td>"+value.userId+"</td><td>"+value.userName+"</td><td>"+value.email+"</td><td>"+value.phone+"</td></tr>");
       				
            		   $("#tb").append($tr);
            		});
       		  });
            
            });
        	
        })
    
    
    </script>
    
	

  </head>
  
  <body>
    <input type="text" id="currentPage"/>
    <input type="text" id="totalPage"/>
    <table class="table table-bordered table-striped" id="tb">
             <thead>
             	<tr><th>用户编号</th><th>用户名</th><th>用户邮箱</th><th>phone</th></tr>
             </thead>
             <tbody >
	            
             </tbody>
       
       </table>
       
       <div style="width: 500px;margin: 5px auto">
       <nav aria-label="...">
		  <ul class="pager">
		    <li><a  id="first">首页</a></li>
			<li><a  id="prev">上页</a></li> 
			<li><a  id="next">下页</a></li> 
		    <li><a  id="last">末页</a></li>
		  </ul>
	  </nav>
      </div> 
       
  </body>
</html>
