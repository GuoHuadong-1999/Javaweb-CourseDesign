<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>购物车</title>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<script type="text/javascript">
	$(function(){
		$("#content").css("width",window.screen.width);
		$("#selectAllGoods").click(function(){
			var isChecked = $(this).prop("checked");
			$(".selectAllGoods").prop("checked",isChecked);
		});
		$(".caculatePlus").click(function(){
			var price = parseInt($(this).siblings("#price").text().trim());
			var count = parseInt($(this).siblings("#count").text().trim())+1;
			$(this).siblings("#count").text(count);
			$($(this).parent().next().find("#allPrice")).text(count*price);
		});
		$(".caculateMinus").click(function(){
			var price = parseInt($(this).siblings("#price").text());
			var count = parseInt($(this).siblings("#count").text().trim())-1;
			if(count<=0){
				window.wxc.xcConfirm("商品数量不得低于1件！", window.wxc.xcConfirm.typeEnum.error);
			}else{
				$(this).siblings("#count").text(count);
				$($(this).parent().next().find("#allPrice")).text(count*price);
			}
		});
	});
</script>
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

#nevagations {
	width: 100%;
	background-color: rgb(227, 228, 229);
}

.nevagation {
	float: right;
	margin: 0 40px;
}
table{  
    border-collapse:collapse;
    border-spacing:0;
    margin:0;
    padding:0;
    border:none;
}
.message{
	/*border: black solid 1px;*/
	text-align:center;
}
.title{
	display:inline-block;
	text-align:center;
}
#buy {
	position: relative;
	top: 2px;
	border-radius: 0;
	right: 0;
	width: 200px;
	height: 35px;
	line-height: 35px;
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
	<div id="content">
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
		<div style="height: 80px;margin: 30px 0 0 0;">
			<div style="height: 100%;float: left;margin: 0 80px;">
				<img alt="logo" src="img/logo.gif" style="height: 100%;"/>
			</div>
			<div style="float: left;position: relative;top: 15px;right: 60px;">
				<h3>购物车</h3>
			</div>
			<div style="height: 100%;float: right;margin: 0 80px;">
				<img alt="userImg" src="${userMessages.userImgName}" style="height: 100%;border-radius:100%"/>
			</div>
		</div>
		<div style="width: 100%;height: 5px;background: rgb(230,230,230);margin: 20px 0 0 0;"></div>
		<div style="font-size: 13px;margin: 20px 0 0 0;">
			<form action="" method="get">
				<table style="width: 100%;">
					<tr>
						<td>
							<div style="position:relative;left:87px;">
								<div style="width:145px;display:inline-block;"><input type="checkbox" id="selectAllGoods" /> 全选</div>
								<div class="title" style="width:256px;">商品图片</div>
								<div class="title" style="width:256px;">商品信息</div>
								<div class="title" style="width:215px;">商品类别</div>
								<div class="title" style="width:150px;">单价</div>
								<div class="title" style="width:130px;">数量</div>
								<div class="title" style="width:130px;">金额</div>
								<div class="title" style="width:130px;">操作</div>
							</div>
						</td>
					</tr>
					<c:if test="${relateGoodsListSize!=0}">
						<c:forEach var="relateGoods" items="${relateGoodsList}">
							<tr>
								<td colspan="12">
									<div style="margin: 15px 0 0 0;">
										<table>
											<tr>
												<td colspan="12">
													<div style="position: relative;left: 86px;display: inline-block;">店铺：${relateGoods.user}</div>
												</td>
											</tr>
											<tr>
												<td>
													<div style="padding: 10px 0 10px 0px;background-color: rgb(252,252,252);margin: 0 0 0 100px;">
														<table style="width: 100%;">
															<tr align="center">
																<td width="130px" class="message">
																	<input type="checkbox" class="selectAllGoods selectPublishGoods" />
																</td>
																<td width="263px" class="message"><img src="${relateGoods.goodsImgName}" width="100"/></td>
																<td width="258px" class="message">${relateGoods.goodsDescribe}</td>
																<td width="220px" class="message">${relateGoods.goodsClass}</td>
																<td width="152px" class="message">${relateGoods.goodsPrice}元</td>
																<td width="132px" class="message"><div id="price" style="display:none;">${relateGoods.goodsPrice}</div><a href="#" class="caculateMinus"><span class="icon-minus"></span></a>   <span id="count">1</span>   <a href="#" class="caculatePlus"><span class="icon-plus"></span></a></td>
																<td width="136px" class="message"><div id="allPrice" style="display:inline-block;">${relateGoods.goodsPrice}</div>元</td>
																<td width="130px" class="message"><a href="../DeleteGoodsCartServlet?goodsImgName=${relateGoods.goodsImgName}">删除</a></td>
															</tr>
														</table>
													</div>
												</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td>
								<div style="margin:20px 0 0 0;width:100%;text-align:center;"><button type="submit" id="buy">购买所选商品</button></div>
							</td>
						</tr>
					</c:if>
					<c:if test="${relateGoodsListSize==0}">
						<tr>
							<td>
								<div style="width:100%;text-align:center;padding:50px 0;"><span class="icon-file-empty" style="font-size:30px;">   </span><h3 style="display:inline-block;">您的购物车为空！</h3></div>
							</td>
						</tr>
					</c:if>
				</table>
			</form>
		</div>
	</div>
</body>
</html>





