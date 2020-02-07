<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户中心</title>
		<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
		<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="css/bootstrap.css">
		<script src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/jquery-filestyle.min.js"></script>
		<link rel="stylesheet" href="css/jquery-filestyle.min.css" type="text/css" />
		<script type="text/javascript">
			function check(){
				var fileInput = $('.jfilestyle').get(0).files[0];
				if(fileInput){
					$.ajaxSettings.async = false;
				    $.post("../IsFileServlet", {userImg:"1"}, function(result) {
				    },"json");
				    $.ajaxSettings.async = true;
				}else{
					$.ajaxSettings.async = false;
				    $.post("../IsFileServlet", {userImg:"0"}, function(result) {
				    },"json");
				    $.ajaxSettings.async = true;
				}
				var sex = $("#sex").val().trim();
				if(sex!="男"&&sex!="女"){
					window.wxc.xcConfirm("性别只能填写'男'或者'女' ！", window.wxc.xcConfirm.typeEnum.confirm);
					return false;
				}
				return true;
			}
			$(function(){
				$(".all").attr("width", window.screen.width);
				$(".footer").css("width", window.screen.width);
				$("#changeUser").click(function(){
					 $(".message").removeAttr("readonly");
					 $("#submit").css("display","block");
					 $("#updateUserImg").css("display","block");
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
				color: green;
				text-decoration: none
			}
			
			a {
				color: black;
				text-decoration: none
			}
			
			a:active {
				text-decoration: none;
			}
			
			#nevagations{
				background-color: rgb(227, 228, 229);
				font-size:16px;
			}
			.nevagation{
				float: right;
				margin: 0 40px;
			}
			.logo{
				position: absolute;
				left: 100px;
				top: 80px;
			}
			.myLogo{
				height: 100px;
			}
			.userMessages{
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
				margin:-150px 0 0 -250px;
				width:500px;
				height:300px;
			}
			a.button {
				padding: 10px 15px;
				line-height: 40px;
				border: rgb(132, 132, 132) solid 1px;
			}
			
			a.button:hover {
				border: red solid 1px;
			}
			.footer {
				width: 100%;
				height: 100px;
				/*background-color: pink;*/
				position: fixed;
				bottom: 0;
			}
			h3{
				float: right;
			}
			#submit{
				width: 100%;
				height: 50px;
				position: absolute;
				left: 0px;
				bottom: 0px;
				/*background-color: pink;*/
				display: none;
			}
		</style>
	</head>
	<body style="background-color: rgb(240, 243, 239);">
		<div id="all">
			<div class="logo"/>
				<img src="img/logo.gif" class="myLogo" alt="logo" />
			</div>
			<div id="nevagations">
				<c:if test="${authority=='manager'}">
					<a href="../ManageGoodsServlet" class="nevagation">管理发布商品</a>
				</c:if>
				<a href="../SwitchShoppingServlet" class="nevagation">购物中心</a>
				<c:if test="${status=='login'}">
					<a href="../ExitServlet" class="nevagation">退出</a>
					<a href="../SwitchPublishGoodsServlet" class="nevagation">商品发布</a>
					<a href="#" class="nevagation">${sessionScope.user}</a>
				</c:if>
				<c:if test="${status=='exit'||status==null}">
					<a href="login.jsp" class="nevagation">登录</a>
				</c:if>
				<a href="../IndexGoodsServlet" class="nevagation">首页</a>
				<div style="clear: right;"></div>
			</div>
			<div class="userMessages">
				<form action="../UpdateUserMessagesServlet" method="post" onsubmit="return check()" enctype="multipart/form-data">
					<table style="padding: 20px;" border="1" rules="all">
						<tr align="center">
							<td colspan="12">
								<img src="${userMessages.userImgName}" alt="用户头像" style="width:100px;border-radius:100%;"/>
								<div id="updateUserImg" style="display:none;"><input type="file"name="userImg" class="jfilestyle" data-theme="blue" data-buttonText="更换头像"></div>
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
								<h4>性别：</h4>
							</td>
							<td colspan="9">
								<c:if test="${userMessages.sex==null}">
									<input type="text" name="sex" class="message" id="sex" value="" readonly="readonly"/>
								</c:if>
								<c:if test="${userMessages.sex!=null}">
									<input type="text" name="sex" class="message" id="sex" value="${userMessages.sex}" readonly="readonly"/>
								</c:if>
							</td>
						</tr>
						<tr align="center">
							<td colspan="3">
								<h4>收货地址：</h4>
							</td>
							<td colspan="9">
								<c:if test="${userMessages.address==null}">
									<input type="text" name="address" class="message" id="address" value="" readonly="readonly"/>
								</c:if>
								<c:if test="${userMessages.address!=null}">
									<input type="text" name="address" class="message" id="address" value="${userMessages.address}" readonly="readonly"/>
								</c:if>
							</td>
						</tr>
					</table>
					<div id="submit" align="center">
						<button type="submit" class="btn btn-default navbar-btn" style="display: inline-block;">确认</button>
					</div>
				</form>
			</div>
			<div class="footer">
				<h3 style="display: block;">
					<a href="#" class="nevagation button" id="changeUser"><span class="icon-cart"></span><span> 修改用户信息</span></a>
					<a href="index.jsp" class="nevagation button"><span class="icon-undo2"></span><span> 返回</span></a>
				</h3>
			</div>
		</div>
	</body>
</html>

