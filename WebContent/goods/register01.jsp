<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		var regex = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
		var mailbox = null;
		var code = null;
		var flag = null;
		function check(){
			if($(".error").length!=0){
				window.wxc.xcConfirm("注册信息不正确！", window.wxc.xcConfirm.typeEnum.error);
				return false;
			}else{
				return true;
			}
		}
		$(function(){
			$(".mailbox").keyup(function(){
				mailbox = $(".mailbox").val().trim();
				if(mailbox.length!=0){
					$.get("../MailBoxCheckServlet?mailbox="+mailbox,function(data,status){
						if(data=="false"){
							$(".mailbox").siblings().remove();
							$(".mailbox").after("<span class='icon-cross error' style='color: red;'></span><span style='color: red;'> 邮箱已注册</span>");
						}else{
							if(!regex.test(mailbox)){
								$(".mailbox").siblings().remove();
								$(".mailbox").after("<span class='icon-cross error' style='color: red;'></span><span style='color: red;'> 邮箱格式不符合规范</span>");
							}else{
								$(".mailbox").siblings().remove();
								$(".mailbox").after("<span class='icon-checkmark' style='color: green;'></span><span style='color: green;'> 邮箱可用</span>");
								if($(".code").val().trim().length!=0){
									$.get("../CheckCodeServlet?mailbox="+mailbox+"&code="+code,function(data,status){
										if(data=="false"){
											$(".code").siblings().remove();
											$(".code").after("<span class='icon-cross error' style='color: red;'></span><span style='color: red;'> 验证码不正确</span>");
										}else{
											$(".code").siblings().remove();
											$(".code").after("<span class='icon-checkmark' style='color: green;'></span><span style='color: green;'> 验证码正确</span>");
										}
									});
								}
							}
						}
					});
				}else{
					$(".mailbox").siblings().remove();
					$(".mailbox").after("<span style='color: red;' class='error'>*</span>");
				}	
			});
			$(".code").keyup(function(){
				code = $(".code").val().trim();
				if(code.length!=0){
					$.get("../CheckCodeServlet?mailbox="+mailbox+"&code="+code,function(data,status){
						if(data=="false"){
							$(".code").siblings().remove();
							$(".code").after("<span class='icon-cross error' style='color: red;'></span><span style='color: red;'> 验证码不正确</span>");
						}else{
							$(".code").siblings().remove();
							$(".code").after("<span class='icon-checkmark' style='color: green;'></span><span style='color: green;'> 验证码正确</span>");
						}
					});
				}else{
					$(".code").siblings().remove();
					$(".code").after("<span style='color: red;' class='error'>*</span>");
				}
			});
			$(".getcode").click(function(){
				if($(".mailbox").siblings(".error").length!=0){
					var txt = "邮箱格式不正确！";
					window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
				}else{
					$.get("../GetCodeServlet?mailbox="+mailbox,function(data,status){
						window.wxc.xcConfirm(data, window.wxc.xcConfirm.typeEnum.success);
					});
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
			margin:-125px 0 0 -250px;
			width:500px;
			height:150px;
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
			top: 80px
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
				<div class="index"><h4>2</h4><h4>填写用户信息</h4></div><span>······></span>
				<div class="index"><h4>3</h4><h4>注册成功</h4></div>
			</div>
			<form action="../SetMailBoxServlet" method="get"  onsubmit="return check()">
				<table style="padding: 20px;" border="1" rules="all">
					<tr>
						<td colspan="3" align="center">
							<h4>邮箱：</h4>
						</td>
						<td colspan="9">
							<input type="text" name="mailbox" class="mailbox" placeholder="请输入邮箱"/><span style="color: red;" class="error">*</span>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<h4>验证码：</h4>
						</td>
						<td colspan="9">
							<input type="text" name="code" class="code" placeholder="请点击按钮获取验证码"/><span style="color: red;" class="error">*</span>
						</td>
					</tr>
					<tr align="center">
						<td colspan="12">
							 <button type="button" class="btn btn-default navbar-btn getcode">获取验证码</button>
						</td>
					</tr>
					<tr align="center">
						<td colspan="12">
							 <button type="submit" class="btn btn-default navbar-btn">下一步</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>