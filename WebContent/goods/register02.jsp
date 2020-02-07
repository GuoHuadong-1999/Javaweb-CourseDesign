<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
	</head>
	<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
	<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="style.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		var user = null;
		var password = null;
		function check(){
			if($(".error").length!=0){
				window.wxc.xcConfirm("注册信息不正确！", window.wxc.xcConfirm.typeEnum.error);
				return false;
			}else{
				return true;
			}
		}
		$(function(){
			$(".user").keyup(function(){
				user = $(".user").val().trim();
				if(user.length!=0){
					$.get("../UserCheckServlet?user="+user,function(data,status){
						//alert(typeof data.equals("false"));
						//alert(data==flag);
						//alert(typeof(data=="flase"));
						if(data=="false"){
							//在后面输出用户名已存在
							$(".user").siblings().remove();
							$(".user").after("<span class='icon-cross error' style='color: red;'></span><span style='color: red;'> 用户名已存在</span>");
						}else{
							if(user.length>8||user.length<3){
								//输出字数没有达到要求
								$(".user").siblings().remove();
								$(".user").after("<span class='icon-cross error' style='color: red;'></span><span style='color: red;'> 用户名长度不符合要求</span>");
							}else{
								//	输出用户名可用
								$(".user").siblings().remove();
								$(".user").after("<span class='icon-checkmark' style='color: green;'></span><span style='color: green;'> 用户名可用</span>");
							}
						}
					});
				}else{
					$(".user").siblings().remove();
					$(".user").after("<span class='error' style='color: red;'>*</span>");
				}
			});
			$(".password").keyup(function(){
				password = $(".password").val().trim();
				if(password.length!=0){
					if(password.length>16||password.length<6){
						//输出字数没有达到要求
						$(".password").siblings().remove();
						$(".password").after("<span class='icon-cross error' style='color: red;'></span><span style='color: red;'> 密码长度长度不符合要求</span>");
					}else{
						//	输出用户名可用
						$(".password").siblings().remove();
						$(".password").after("<span class='icon-checkmark' style='color: green;'></span><span style='color: green;'> 密码可用</span>");
					}
				}else{
					$(".password").siblings().remove();
					$(".password").after("<span class='error' style='color: red;'>*</span>");
				}
			});
		});
	</script>
	<style type="text/css">
		*{   
			color: black;
	        margin: 0;   
	        padding: 0;
        }
		.register{
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
		input{
			margin: 0 10px;
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
	</style>
	<body style="background-color: rgb(240, 243, 239);">
		<div class="login"/>
			<h4 style="color: rgb(135,135,135);">已有账号？</h4><h4><a href="login.jsp" class="button">登录</a></h4>
		</div>
		<div class="logo"/>
			<img src="img/logo.gif" class="myLogo">
		</div>
		<div class="register">
			<div align="center" style="margin: 20px 0;">
				<div class="index green"><h4>1</h4><h4>注册邮箱</h4></div><span class="green">······></span>
				<div class="index green"><h4>2</h4><h4>填写用户信息</h4></div><span class="green">······></span>
				<div class="index"><h4>3</h4><h4>注册成功</h4></div>
			</div>
			<form action="../RegisterServlet" method="get" onsubmit="return check()">
				<table style="padding: 20px;" border="1" rules="all">
					<tr>
						<td colspan="3" align="center">
							<h4>用户名：</h4>
						</td>
						<td colspan="9">
							<input type="text" name="user" class="user" placeholder="用户名长度[3,8]之间"/><span class="error" style="color: red;">*</span>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<h4>密码：</h4>
						</td>
						<td colspan="9">
							<input type="password" name="password" class="password" placeholder="密码长度在[6,16]之间"/><span class="error" style="color: red;">*</span>
						</td>
					</tr>
					<tr align="center">
						<td colspan="12">
							 <button type="submit" class="btn btn-default navbar-btn">注册</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
	</body>
</html>

