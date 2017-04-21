<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<c:import url="common/admintop.do"></c:import>

         <select name="selectValue" onchange="mostra(this.value)">
                <option value=""></option>
             <option value="santos">对联广告位1</option>
             <option value="saoPaulo">对联广告位2</option>

          </select>
   
   	<style type="text/css">  
		td{  
		height:60px;
		}  
		/* 
		可以在这里写注释
		*/
	</style>
	
       <table class="table table-striped table-hover"  id="tabProduct">
             <thead>
             	<tr><th>选择框</th><th>广告编号</th><th>广告名</th><th>广告地址</th><th>广告金额</th><th>宽度</th><th>高度</th><th>广告位</th></tr>
             </thead>
             <tbody >
	             <c:forEach items="${alladv2}" var="adv2">
	             
	                  <tr>
	                  <td  name="id" style="width:5%;"><input type="checkbox" name="checkbox" value="checkbox" /></td>  
	                  <td  Name="id" style="width:12%;"EditType="TextBox">${adv2.id}</td>
	                  <td  Name="advname"style="width:15%;" EditType="TextBox">${adv2.advname}</td>
	                  <td  Name="advurl"style="width:15%;" EditType="TextBox">${adv2.advurl}</td>
	                  <td  Name="advmoney" style="width:12%;"EditType="TextBox">${adv2.advmoney}</td>
	                  <td  Name="width" style="width:14%;"EditType="TextBox">${adv2.width}</td>
	                  <td  Name="height"style="width:14%;" EditType="TextBox">${adv2.height}</td>
	                  <td  Name="position" style="width:10%;"EditType="TextBox">${adv2.position}</td>
	                  </tr>
	             
	             </c:forEach>
             </tbody>
       
       </table>
        <input type="button" name="Submit" value="新增" onclick="AddRow(document.getElementById('tabProduct'),1)" />  
		<input type="button" name="Submit2" value="删除" onclick="DeleteRow(document.getElementById('tabProduct'),1)" />  
		<input type="button" name="Submit22" value="重置" onclick="window.location.reload()" />  
		<input type="button" name="Submit3" value="提交" onclick="GetTableData(document.getElementById('tabProduct'))" /> 

	
	<script type="text/javascript" src="js/biaoge2.js"></script>
 
	<script type="text/javascript">  
    var tabProduct = document.getElementById("tabProduct");  
    //<input type="submit" name="Submit3" value="提交" onclick="return checkFrm()" /> 
    //<input type="submit" name="Submit3" value="提交" onclick="GetTableData(document.getElementById('tabProduct'));return false;" />  
    // 设置表格可编辑  
    // 可一次设置多个，例如：EditTables(tb1,tb2,tb2,......)  
    EditTables(tabProduct);  
   
    </script>  
<c:import url="common/bottom.do"></c:import>