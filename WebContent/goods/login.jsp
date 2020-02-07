<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
	</head>
	
	<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
	<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="js/bootstrap.js"></script>
	
	<script type="text/javascript">
		var user = null;
		var password = null;
		var flag = false;
		function check(){
			user = $(".user").val().trim();
			password = $(".password").val().trim();
			if(!($(".read").is(":checked"))){
				window.wxc.xcConfirm("请阅读有关协议", window.wxc.xcConfirm.typeEnum.error);
				return false;
			}else{
				$.ajaxSettings.async = false;
				$.post("../LoginServlet",
				{
					user:user,
					password:password
				},
				function(data,status){
					if(data=="true"){
						flag = true;
					}else{
						flag = false;
					}
				}
				);
				$.ajaxSettings.async = true;
				if(flag==true){
					return true;
				}else{
					window.wxc.xcConfirm("用户名或密码错误", window.wxc.xcConfirm.typeEnum.error);
					return false;
				}
			}
		}
		$(function(){
			$("#all").css("width", window.screen.width);
			$("#register").click(function(){
				window.location.replace("register01.jsp");
			});
			$("#renovate").click(function(){
				window.location.replace("renovatePassword01.jsp");
			});
		});
	</script>
	<style type="text/css">
		*{   
			color: black;
	        margin: 0;   
	        padding: 0;
        }
		h5 a:hover {
			color: green;
			text-decoration: none
		}
			
		h5 a {
			color: black;
			text-decoration: none
		}
			
		h5 a:active {
			text-decoration: none;
		}
		#login{
			width:100%;
			height: 600px;
			background: url(img/login.png);
			background-size：cover;
			margin: 60px 0;
		}
		table{
			position:absolute;
			top:50%;
			left:50%;
			margin:-150px 0 0 -250px;
			width:500px;
			height:300px;
		}
		.logo{
				position: absolute;
				left: 100px;
				top: 80px;
			}
			.myLogo{
				height: 100px;
			}
			#search {
				left: 0;
				padding: 4px 44px 4px 4px;
				width: 376px;
				height: 50px;
				border: 1px solid transparent;
				line-height: 25px;
				font-size: 14px;
				margin: 10px 0;
			}
			.submit {
				position: relative;
				top: 2px;
				border-radius: 0;
				right: 0;
				width: 376px;
				height: 50px;
				line-height: 35px;
				border: none;
				background-color: #f10215;
				font-size: 20px;
				font-weight: 700;
				color: #fff;
				border-radius: 0;
			}
	</style>
	<body style="background-color: rgb(240, 243, 239);">
		<div id="all">
			<div id="login">
				<div style="position:relative;width: 440px; height: 500px; float: right;margin: 50px 150px; background-color:  rgb(240, 243, 239);"align="center">
					<div style="position: absolute;top:43px;left:32px;"><h4 style="font-weight:bold;">密码登录</h4></div>
					<form action="../SwitchIndexServlet" method="get" onsubmit="return check()">
						<div style="margin: 100px 0 0 0;"><input type="text" id="search" placeholder="用户名" name="user" class="user"></div>
						<div style="margin: 34px 0 0 0;"><input type="password" id="search" placeholder="密码" name="password" class="password"></div>
						<div>
							<input type="checkbox" name="read" class="read"/>
							<h5 style="display: inline;"><a href="#">是否同意有关协议</a></h5>
						</div>
						<div style="margin: 10px 0 0 0;"><button type="submit" class="submit">登录</button></div>
						<div style="margin: 10px 0 0 0;"><button type="button" class="submit" id="register">注册</button></div>
						<div style="margin: 10px 0 0 0;"><button type="button" class="submit" id="renovate">修改密码</button></div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
<!--
问题原因：
1. ajax时return false 的function与onsubmit()不是同一个函数;
2. 在ajax执行时，async默认的设置值为true，这种情况为异步方式，就是说当ajax发送请求后，在等待server端返回的这个过程中，前台会继续 执行ajax块后面的脚本，直到server端返回正确的结果才会去执行success，也就是说这时候执行的是两个线程，ajax块发出请求后一个线程 和ajax块后面的脚本（另一个线程）。
原因：逻辑没弄清楚，要将ajax设置为同步的，需要使用$.ajax，$.get默认是异步的，并且不是在回调函数内return，而是在CheckUserName函数中声明一个变量来接受回调函数的返回值，然后CheckUserName返回这个值。

var flag=false;

 

$.ajax({
    async:false, ////要设置为同步的，要不CheckUserName的返回值永远为false
    url: "${ctx}/register/registeremail.do",
    type: "Post",
    data: {"email" : email},
    success: function(transport){
                   if(transport==0){
                         var html;
                         document.getElementById("em").style.display="inline";
                         html="<font color=010203>恭喜您,该邮箱可以注册!</font>";
                         $("#em").html(html);
                         clearError(frm["email"]);
                        myflag=true;
                 }else{
                       addErrors(frm["email"],"对不起!该邮箱已经注册!");
                       document.getElementById("em").style.display="none";
                      flag=true;
                  }
         }
});
// alert(flag + "...邮箱...");
 if(flag){
        return false;
 }*/  -->

