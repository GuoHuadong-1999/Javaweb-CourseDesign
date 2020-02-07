<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>商品详细信息</title>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$("#all").css("width", window.screen.width);
		$("#footer").css("width", window.screen.width); 
		$("#submit").click(function(){
			$.post("../InsertGoodsCartServlet",
					{},
					function(data,status){
						window.wxc.xcConfirm(data, window.wxc.xcConfirm.typeEnum.success);
					}
			);
		});
	});
</script>
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link href="css/bootstrap-chosen.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-filestyle.min.js"></script>
<link rel="stylesheet" href="css/jquery-filestyle.min.css" type="text/css" />
<style type="text/css">
* {
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
a.button {
	padding: 10px 15px;
	border: black solid 1px;
	text-decoration: none;
}

a.button:hover {
	border: red solid 1px;
	text-decoration: none;
}

#nevagations {
	background-color: rgb(227, 228, 229);
}

.nevagation {
	float: right;
	margin: 0 40px;
}
#describe{
	width: 450px;
	height: 180px;
	margin: 30px 0px 0px 0px;
	background: white;
	text-align: left;
	line-height: 25px;
	font-size: 17px;
}
.detile{
	width: 450px;
	height: 25px;
	margin: 30px 0px 0px 0px;
	background: white;
	text-align: left;
	line-height: 25px;
	font-size: 17px;
}
#submit {
	position: relative;
	top: 2px;
	border-radius: 0;
	right: 0;
	width: 200px;
	height: 25pxpx;
	line-height: 25px;
	border: none;
	background-color: #f10215;
	font-size: 20px;
	font-weight: 700;
	color: #fff;
	border-radius: 0;
}
</style>
<script src='js/tastySelect.min.js'></script>
<script src='js/common.js'></script>
</head>

<body style="background-color: rgb(240, 243, 239);">
	<div id="all">
		<div id="nevagations">
			<c:if test="${authority=='manager'}">
				<a href="../ManageGoodsServlet" class="nevagation">管理发布商品</a>
			</c:if>
			<a href="../SwitchShoppingServlet" class="nevagation">购物中心</a>
			<c:if test="${status=='login'}">
				<a href="../ExitServlet" class="nevagation">退出</a>
				<a href="#" class="nevagation">商品发布</a>
				<a href="userMessages.jsp" class="nevagation">${sessionScope.user}</a>
			</c:if>
			<c:if test="${status=='exit'||status==null}">
				<a href="login.jsp" class="nevagation">登录</a>
			</c:if>
			<a href="../IndexGoodsServlet" class="nevagation">首页</a>
			<div style="clear: right;"></div>
		</div>
		<div style="width: 100%;height: 80px;<!--background-color: red-->;margin: 30px 0 0 0;">
			<div style="height: 100%;float: left;margin: 0 80px;">
				<img alt="logo" src="img/logo.gif" style="height: 100%;"/>
			</div>
			<c:if test="${user!=null}">
				<c:if test="${status=='login'}">
					<div style="font-size: 14px; display: inline-block;float:right;margin:0 40px 0 0">
						<h3>
							<a href="../SwitchGoodsCartServlet" class="button"><span class="icon-cart"></span><span>购物车</span></a>
						</h3>
					</div>
				</c:if>
			</c:if>
		</div>
		<div style="width: 100%;height: 550px;background-color: rgb(231,153,5);margin: 20px 0 0 0;padding: 20px 0"align="center">
			<div style="width: 70%;height: 100%;">
				<div style="width: 100%;height: 100%;border-radius:2%;background-color: rgb(240, 243, 239);">
					<div style="width: 50%;height: 100%;display: inline-block;float: left; line-height: 500px;">
						<div style="height: 400px;width: 350px;background-image: url(${goods.goodsImgName});background-size: cover;position: relative;top: 30px;">
						</div>
					</div>
					<div style="width: 50%;height: 100%;display: inline-block;float: left;position: relative;">
						<div class="detile">${goods.goodsName}</div>
						<div class="detile">${goods.goodsPrice}</div>
						<div class="detile">${goods.goodsClass}</div>
						<div class="detile">${goods.publishAddress}</div>
						<div id="describe">${goods.goodsDescribe}</div>
					</div>
					<div style="position:relative;bottom:50px;">
						<c:if test="${user==null}">
							<h4>您目前还未登录，不能加入购物车！</h4>
						</c:if>
						<c:if test="${user!=null}">
							<button type="button" id="submit">加入购物车</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

