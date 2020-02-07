<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改密码</title>
		<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
		<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="css/bootstrap.css">
		<script src="js/bootstrap.js"></script>
		<script type="text/javascript">
		    var password = null;
		    var passwordDefine = null;
			function check(){
				if($(".error").length!=0){
					window.wxc.xcConfirm("修改密码信息不正确！", window.wxc.xcConfirm.typeEnum.error);
					return false;
				}else{
					return true;
				}
			}
			$(function(){
				$(".all").attr("width", window.screen.width);
				$("#password").keyup(function(){
					password = $("#password").val().trim();
					if(password.length!=0){
						if(password.length>16||password.length<6){
							//输出字数没有达到要求
							$("#password").siblings().remove();
							$("#password").after("<span class='icon-cross error' style='color: red;'></span><span style='color: red;'> 密码长度长度不符合要求</span>");
						}else{
							//	输出用户名可用
							$("#password").siblings().remove();
							$("#password").after("<span class='icon-checkmark' style='color: green;'></span><span style='color: green;'> 密码可用</span>");
						}
					}else{
						$("#password").siblings().remove();
						$("#password").after("<span class='error' style='color: red;'>*</span>");
					}
				});
				$("#passwordDefine").keyup(function(){
					passwordDefine = $("#passwordDefine").val().trim();
					if(passwordDefine.length!=0){
						if(passwordDefine==password){
							$("#passwordDefine").siblings().remove();
							$("#passwordDefine").after("<span class='icon-checkmark' style='color: green;'></span><span style='color: green;'> 密码可用</span>");
						}else{
							$("#passwordDefine").siblings().remove();
							$("#passwordDefine").after("<span class='icon-cross error' style='color: red;'></span><span style='color: red;'> 两次密码不同</span>");
						}
					}else{
						$("#passwordDefine").siblings().remove();
						$("#passwordDefine").after("<span class='error' style='color: red;'>*</span>");
					}
				});
			});
		</script>
		<link rel="stylesheet" href="style.css" type="text/css" />
		<style type="text/css">
			*{   
				color: black;
		        margin: 0;   
		        padding: 0;
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
			.logo{
				position: absolute;
				left: 100px;
				top: 80px;
			}
			.login{
				position: absolute;
				right: 100px;
				top: 80px
			}
			.myLogo{
				height: 100px;
			}
			.renovatePassword{
				position:absolute;
				top:50%;
				left:50%;
				margin:-250px 0 0 -350px;
				width:700px;
				height:500px;
				border:2px solid #008800;
			} 
			table{
				position:absolute;
				top:50%;
				left:50%;
				margin:-100px 0 0 -250px;
				width:500px;
				height:200px;
			}
			.index{
				display: inline-block;
				margin: 0 20px;
			}
			.green{
				color: green;
				font-weight:bold;
			}
			#submit{
				width: 100%;
				height: 50px;
				position: absolute;
				left: 0px;
				bottom: 0px;
			}
			
		</style>
	</head>
	<body style="background-color: rgb(240, 243, 239);">
		<div id="all">
			<div class="login"/>
				<h4 style="color: rgb(135,135,135);">已有账号？</h4><h4><a href="login.jsp" class="button">登录</a></h4>
			</div>
			<div class="logo"/>
				<img src="img/logo.gif" class="myLogo" alt="logo" />
			</div>
			<div class="renovatePassword">
				<div align="center" style="margin: 20px 0;">
					<div class="index green"><h4>1</h4><h4>邮箱验证</h4></div><span class="green">······></span>
					<div class="index green"><h4>2</h4><h4>修改密码</h4></div><span class="green">······></span>
					<div class="index"><h4>3</h4><h4>修改成功</h4></div>
				</div>
				<form action="../UpdatePasswordServlet" method="get" onsubmit="return check()">
					<table style="padding: 20px;" border="1" rules="all">
						<tr align="center">
							<td colspan="12">
								<img src="${userMessages.userImgName}" alt="用户头像" style="width:100px;border-radius:100%;"/>
							</td>
						</tr>
						<tr align="center">
							<td colspan="3">
								<h4>用户名：</h4>
							</td>
							<td colspan="9">
								<span class="user" style="display: inline-block;">${userMessages.user}</span>
							</td>
						</tr>
						<tr align="center">
							<td colspan="3">
								<h4>密码：</h4>
							</td>
							<td colspan="9">
								<input type="password" name="password" id="password" placeholder="密码长度在[6,16]之间"/><span class="error" style="color: red;">*</span>
							</td>
						</tr>
						<tr align="center">
							<td colspan="3">
								<h4>确认密码：</h4>
							</td>
							<td colspan="9">
								<input type="password" name="passwordDefine" id="passwordDefine" placeholder="密码要与上面的密码相同"/><span class="error" style="color: red;">*</span>
							</td>
						</tr>
					</table>
					<div id="submit" align="center">
						<button type="submit" class="btn btn-default navbar-btn" style="display: inline-block;">确认</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>

