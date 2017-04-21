<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<c:import url="common/top.do"></c:import>
    <div class="container" style="margin: 30px auto; min-height:500px;">
         <div class="col-md-8 col-md-offset-3">
                <div class="col-md-2">
                    	请填写接收者
                </div>
                <div class="col-md-5">
                   <input type="text" class="form-control" placeholder="请输入接收者用户名">
                </div>
         
         </div>
         
         
         <div class="col-md-8 col-md-offset-3" style="margin-top: 20px">
                <div class="col-md-2">
                    	输入消息内容:
                </div>
                <div class="col-md-5">
                   <textarea style="height: 200px" class="form-control" placeholder="内容不超过200字"></textarea>
                </div>
         
         </div>
         
         
         <div class="col-md-8 col-md-offset-3" style="margin-top: 20px">
                <div class="col-md-2 col-md-offset-3">
                    	<button id="senndBtn" class="btn btn-info">发送</button>
                </div>
                
         
         </div>
    
    
    </div>



<c:import url="common/bottom.do"></c:import>