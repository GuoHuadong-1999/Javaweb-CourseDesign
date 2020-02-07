<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>首页</title>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script type="text/javascript">
	var index = 1;
	var flag = null;
	window.onload=function(){
		flag = setInterval("changeImg()",3000);
	}
	function changeImg(){
		$("#img0"+index).css("background","rgb(119, 122, 129)");
		index = (index % 6)+1;
		$("#carousel").css("background-image","url(img/商品0"+index+".png)");
		$("#img0"+index).css("background","rgb(50,14,193)");
	}
	$(function() {
		$("#all").css("width", window.screen.width);
		$("#footer").css("width", window.screen.width);
		$(".point").hover(function(){
			clearInterval(flag);
			$("#img0"+index).css("background","rgb(119, 122, 129)");
			index = $(this).prop("id").substring(4, 5);
			$("#carousel").css("background-image","url(img/商品0"+index+".png)");
			$("#img0"+index).css("background","rgb(50,14,193)");
			flag = setInterval("changeImg()",3000);
		});
		/*$(".gc").hover(function(){
			$("#list").css("display","block");
		});
		$(".gc").mouseout(function(){
			$("#list").css("display","none");
		});*/
	});
</script>
<link rel="stylesheet" href="style.css" type="text/css" />
<style type="text/css">
* {
	color: black;
	margin: 0;
	padding: 0;
}

#nevagations a:hover {
	color: green;
	text-decoration: none
}

#nevagations a {
	color: black;
	text-decoration: none
}

#nevagations a:active {
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
	top: 2px;
	border-radius: 0;
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
	margin: 30px 0 0 0;
}

#logo {
	border: black solid 1px;
	position: absolute;
	left: 0px;
	top: 0px;
	width: 100%;
	hight: 200px;
}

#logoImg {
	position: relative;
	left: 200px;
	width: 200px;
}

#content {
	width: 100%;
}

.point {
	height: 6px;
	width: 31px;
	background: rgb(119, 122, 129);
	display: inline-block;
	margin: 0 20px;
}

ul {
	float: left;
	height: 100%;
}

li {
	margin: 0 0 6px 0;
	list-style-type: none;
	width: 100%;
	float: left;
}
li:hover{
	background-color: white;
}
.gc{
	font-weight: bold;
}
.gc a:hover{
	color: rgb(99,71,237);
}
a{
	text-decoration: none;
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
				<a href="../UserMessagesServlet" class="nevagation">${sessionScope.user}</a>
			</c:if>
			<c:if test="${status=='exit'||status==null}">
				<a href="login.jsp" class="nevagation">登录</a>
			</c:if>
			<a href="#" class="nevagation">首页</a>
			<div style="clear: right;"></div>
		</div>
		<div id="select" align="center">
			<form action="../SelectGoodsServlet" method="get"
				style="display: inline-block; margin: 0 40px;">
				<input type="text" id="search" placeholder="请输入您要搜索的商品" name="search">
				<button type="submit" id="submit">搜索</button>
			</form>
			<c:if test="${status=='login'}">
				<div style="font-size: 14px; display: inline-block;">
					<h3>
						<a href="../SwitchGoodsCartServlet" class="button"><span class="icon-cart"></span><span>购物车</span></a>
					</h3>
				</div>
			</c:if>
		</div>
		<div
			style="width: 100%; height: 429px; margin: 20px 0 0 0; background: rgb(231, 153, 5);"
			align="center">
			<div id="carousel"
				style="width: 70%; height: 100%; background-image: url(img/商品01.png); position: relative; z-index: 2; background-size: cover;">
				<div
					style="position: absolute; top: 0px; left: 0px; width: 18%; height: 100%; background: rgb(105, 105, 105); z-index: 3; opacity: 0.4;">
					<ul>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=女装/内衣">女装/内衣</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=男装/运动户外">男装/运动户外</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=女鞋 /男鞋 /箱包">女鞋 /男鞋 /箱包</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=美妆 /个人护理">美妆 /个人护理</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=腕表 /眼镜 /珠宝饰品">腕表 /眼镜 /珠宝饰品</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=手机 /数码 /电脑办公">手机 /数码 /电脑办公</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=母婴玩具">母婴玩具</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=零食 /茶酒 /进口食品">零食 /茶酒 /进口食品</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=生鲜水果">生鲜水果</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=大家电 /生活电器">大家电 /生活电器</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=家具建材">家具建材</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=汽车 /配件 /用品">汽车 /配件 /用品</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=家纺 /家饰 /鲜花">家纺 /家饰 /鲜花</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=医药保健">医药保健</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=厨具 /收纳 /宠物">厨具 /收纳 /宠物</a></span></li>
						<li><span class="gc"><a href="../SelectGoodsServlet?search=图书音像">图书音像</a></span></li>
					</ul>
				</div>
				<div style="position: absolute; top: 0px; right: 0px; width: 82%; height:100%; backGround: white; z-index: 3;display: none;" id="list">
					
				</div>
				<div
					style="position: absolute; left: 0px; bottom: 0px; z-index: -1; width: 100%; height: 20px;"
					align="center">
					<div class="point" id="img01" style="background: rgb(50,14,193);"></div>
					<div class="point" id="img02"></div>
					<div class="point" id="img03"></div>
					<div class="point" id="img04"></div>
					<div class="point" id="img05"></div>
					<div class="point" id="img06"></div>
				</div>
			</div>
		</div>
		<div style="width:100%;hight:40px;line-hight:40px;margin:40px 0 0 0;"align="center"><h2>推荐商品</h2></div>
		<div style="width: 100%;"align="center">
			<div style="width: 80%;">
				<c:if test="${indexGoodsListSize!=0}">
					<c:forEach var="indexGoods" items="${indexGoodsList}">
						<a href="../SwitchGoodsDetailServlet?id=${indexGoods.id}">
							<div class="goods">
								<div class="goodsImg" style="background-image: url(${indexGoods.goodsImgName}); background-size: cover;">
									<!-- <img src="/goods/goodsImg/睡衣.png" alt="商品图片"/ class="img"> -->
								</div>
								<div class="goodsName" align="center">
									<span>
										${indexGoods.goodsName}
									</span>
								</div>
								<div class="goodsPrice">
									<span>
										${indexGoods.goodsPrice}
									</span>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
				<c:if test="${indexGoodsListSize==0}">
					<div style="margin: 30px;"><span class="icon-file-empty" style="font-size:30px;">   </span><h3 style="display:inline-block;">管理员并未发布推荐的商品！</h3></div>
				</c:if>
				<div style="clear: left;"></div>
			</div>
		</div>
	</div>
</body>
</html>

