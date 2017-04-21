<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<c:import url="common/admintop.do"></c:import>

         <select name="selectValue" onchange="mostra(this.value)">
                <option value=""></option>
             <option value="santos">轮播广告位1</option>
             <option value="saoPaulo">轮播广告位2</option>

          </select>
	<style type="text/css">  
		td{  
		width:14%;
		height:45px;
		}  
		/* 
		可以在这里写注释
		*/
	</style>

       <table class="table table-striped table-hover"  id="tabProduct">
             <thead>
             	<tr><th>选择框</th><th>广告编号</th><th>广告名</th><th>广告地址</th><th>广告金额</th><th>时间</th><th>优先级</th></tr>
             </thead>
             <tbody >
	             <c:forEach items="${alladv}" var="adv">
	             
	                  <tr>
	                  <td  name="id"><input type="checkbox" name="checkbox" value="checkbox" /></td>  
	                  <td  Name="id" EditType="TextBox">${adv.id}</td>
	                  <td  Name="advname" EditType="TextBox">${adv.advname}</td>
	                  <td  Name="advurl" EditType="TextBox">${adv.advurl}</td>
	                  <td  Name="advmoney" EditType="TextBox">${adv.advmoney}</td>
	                  <td  Name="time" EditType="TextBox">${adv.time}</td>
	                  <td  Name="sort" EditType="TextBox">${adv.sort}</td>
	                  </tr>
	             
	             </c:forEach>
             </tbody>
       
       </table>
        <input type="button" name="Submit" value="新增" onclick="AddRow(document.getElementById('tabProduct'),1)" />  
		<input type="button" name="Submit2" value="删除" onclick="DeleteRow(document.getElementById('tabProduct'),1)" />  
		<input type="button" name="Submit22" value="重置" onclick="window.location.reload()" />  
		<input type="button" name="Submit3" value="提交" onclick="GetTableData(document.getElementById('tabProduct'))" /> 

	
	<script type="text/javascript" src="js/biaoge.js"></script>  
	<script type="text/javascript">  
    var tabProduct = document.getElementById("tabProduct");   
    // 设置表格可编辑  
    // 可一次设置多个，例如：EditTables(tb1,tb2,tb2,......)  
    EditTables(tabProduct);    
    </script>  
    
<c:import url="common/bottom.do"></c:import>