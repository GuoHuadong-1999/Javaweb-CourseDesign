<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
	</head>
	<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
	<link rel="stylesheet" href="style.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="js/bootstrap.js"></script>
	<style type="text/css">
		*{   
			color: black;
	        margin: 0;   
	        padding: 0;
        }
		.renovatePassword{
			position:absolute;
			top:50%;
			left:50%;
			margin:-250px 0 0 -350px;
			width:700px;
			height:500px;
			border:2px solid black;
		} 
		table{
			position:absolute;
			top:50%;
			left:50%;
			margin:-100px 0 0 -250px;
			width:500px;
			height:200px;
		}
		.logo{
			position: absolute;
			left: 100px;
			top: 80px;
		}
		.myLogo{
			height: 100px;
		}
		.login{
			position: absolute;
			right: 100px;
			top: 80px;
		}
		a:hover {
			color:green;
			text-decoration: none
		}
			
		a {
			color: black;
			text-decoration: none
		}
			
		a:active {
			text-decoration: none;
		}
		a.button {
			padding: 10px 15px;
			line-height: 40px;
			border: black solid 1px;
		}
		a.button:hover {
			border: red solid 1px;
		}
		.index{
			display: inline-block;
			margin: 0 20px;
		}
		.green{
			color: green;
			font-weight:bold;
		}
		.font{
			font-size:40px;
		}
	</style>
	<body style="background-color: rgb(240, 243, 239);">
		<div class="login"/>
			<h4 style="color: rgb(135,135,135);">已有账号？</h4><h4><a href="login.jsp" class="button">登录</a></h4>
		</div>
		<div class="logo"/>
			<img src="img/logo.gif" class="myLogo">
		</div>
		<div class="renovatePassword">
			<div align="center" style="margin: 20px 0;">
				<div class="index green"><h4>1</h4><h4>邮箱验证</h4></div><span class="green">······></span>
				<div class="index green"><h4>2</h4><h4>修改密码</h4></div><span class="green">······></span>
				<div class="index green"><h4>3</h4><h4>修改成功</h4></div>
			</div>
			<table style="padding: 20px;" border="1" rules="all">
				<tr>
					<td colspan="12" align="center">
							<span class="icon-checkmark font" style="color: green;"></span><h1>修改成功！</h1>
					</td>
				</tr>
			</table>
		</div>
		
	</body>
</html>

