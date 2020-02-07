<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>购物中心</title>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#all").css("width", window.screen.width);
		$("#footer").css("width", window.screen.width);
	});
</script>
<link rel="stylesheet" href="style.css" type="text/css" />
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
}

a.button:hover {
	border: red solid 1px;
}

#nevagations {
	background-color: rgb(227, 228, 229);
}

.nevagation {
	float: right;
	margin: 0 40px;
}

#search {
	left: 0;
	padding: 4px 44px 4px 4px;
	width: 450px;
	height: 25px;
	border: 1px solid transparent;
	line-height: 25px;
	font-size: 14px;
}

#submit {
	position: relative;
	top: 2px; border-radius : 0;
	right: 0;
	width: 50px;
	height: 35px;
	line-height: 35px;
	border: none;
	background-color: #f10215;
	font-size: 20px;
	font-weight: 700;
	color: #fff;
	border-radius: 0;
}


#select {
	font-size: 0px;
	margin:30px 0 30px 0;
}
#logo{
	border: black solid 1px;
	position: absolute;
	left:0px;
	top:0px;
	width: 100%;
	hight: 200px;
}
#logoImg{
	position: relative;
	left: 200px;
	width: 200px;
}
.goods{
	width: 266px;
	height: 330px;
	display: inline-block;
	float: left;
	margin: 20px;
	background-color: white;
}
.goodsImg{
	width: 226px;
	height: 215px;
	margin: 20px 20px 0 20px;
	display: inline-block;
}
.goodsName{
	margin: 10px 20px 0 20px;
	height: 30px;
	width: 226px;
	display: inline-block;
}
.goodsPrice{
	margin: 10px 20px 0 20px;
	height: 30px;
	width: 226px;
	display: inline-block;
}
.img{
	width: 100%;
}
</style>
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
				<a href="../SwitchPublishGoodsServlet" class="nevagation">商品发布</a>
				<a href="userMessages.jsp" class="nevagation">${sessionScope.user}</a>
			</c:if>
			<c:if test="${status=='exit'||status==null}">
				<a href="login.jsp" class="nevagation">登录</a>
			</c:if>
			<a href="../IndexGoodsServlet" class="nevagation">首页</a>
			<div style="clear: right;"></div>
		</div>
		<div id="select" align="center">
			<form action="../SelectGoodsServlet" method="get" style="display: inline-block; margin: 0 40px;">
				<input type="text" id="search" placeholder="请输入您要搜索的商品" name="search">
				<button type="submit" id="submit">搜索</button>
			</form>
			<c:if test="${status=='login'}">
				<div style="font-size: 14px;display: inline-block;">
					<h3>
						<a href="../SwitchGoodsCartServlet" class="button"><span class="icon-cart"></span><span>购物车</span></a>
					</h3>
				</div>
			</c:if>
		</div>
		<div style="width: 100%;"align="center">
			<div style="width: 80%;">
				<c:if test="${size==0}">
					<h3>抱歉您搜索的物品不存在！</h3>
				</c:if>
				<c:if test="${size!=0}">
					<c:forEach var="goods" items="${goodsList}">
						<a href="../SwitchGoodsDetailServlet?id=${goods.id}">
							<div class="goods">
								<div class="goodsImg" style="background-image: url(${goods.goodsImgName}); background-size: cover;">
									<!-- <img src="/goods/goodsImg/睡衣.png" alt="商品图片"/ class="img"> -->
								</div>
								<div class="goodsName" align="center">
									<span>
										${goods.goodsName}
									</span>
								</div>
								<div class="goodsPrice">
									<span>
										${goods.goodsPrice}
									</span>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
				<div style="clear: left;"></div>
			</div>
		</div>
		
	</div>
</body>
</html>

