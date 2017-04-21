<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
    <link rel="stylesheet" href="css/login.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	
	
	
	  function trim(str){
		 return  str.replace(/(^\s+)|(\s+$)/,"");
	  }
	     
	   function checkFrm()
	   {
		   if(trim($("#username").val())=="")
		   {
			   $("#username").css("border","solid 1px red");
			   return false;
		   }
		   
		   
		   if(trim($("#password").val())=="")
		   {
			   $("#password").css("border","solid 1px red");
			   return false;
		   }
		   
		   if(trim($("#repassword").val())=="")
		   {
			   $("#repassword").css("border","solid 1px red");
			   return false;
		   }
		   
		   
		   if(trim($("#email").val())=="")
		   {
			   $("#email").css("border","solid 1px red");
			   return false;
		   }
		   
		   
		   if(trim($("#repassword").val())!=trim($("#password").val()))
			{
			   alert("两次密码必须一致");
			   $("#repassword").css("border","solid 1px red");
			   $("#password").css("border","solid 1px red");
			   return false;
			}
		   
		   
		   if(trim($("#email").val())!="")
		   {
			   
			   var reg=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
			   
			   var isEmail = reg.test(trim($("#email").val()));
			   
			   if(!isEmail)
			   {
				   alert("emai格式不对");
				   $("#email").css("border","solid 1px red");
				   return false;
			   }
			   
			   
		   }

          return true;
		   
	   }
	
	</script>
	

  </head>
  
  <body>
      <div class="container">
			<div class="row main">
			
			   <div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">${msg}</h1>
	               		<hr />
	               	</div>
	            </div> 
			
			
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">注册</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="userinfo/register.do">
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">用户名</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="username" id="username" value=""  placeholder="输入用户名"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">密码</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="输入密码"/>
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">确认密码</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="repassword" id="repassword"  placeholder="输入密码"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">邮箱</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="email" id="email"  placeholder="输入email"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">电话号码</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="phone" id="phone"  placeholder="输入电话号码"/>
								</div>
							</div>
						</div>

						

						<div class="form-group ">
							<%--<button type="button" class="btn btn-primary btn-lg btn-block login-button">登录</button>
						--%>
						   <input type="submit" class="btn btn-primary btn-lg btn-block login-button" value="登录" onclick="return checkFrm()"/>
						</div>

					</form>
				</div>
			</div>
		</div>
		
	
  </body>
</html>
