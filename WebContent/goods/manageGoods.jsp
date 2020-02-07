<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>管理发布商品</title>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	var index = 1;
	var flag = null;
	$(function() {
		$("#all").css("width", window.screen.width);
		$("#footer").css("width", window.screen.width);
		$("#selectAllGoods").click(function(){
			var isChecked = $(this).prop("checked");
			$(".selectAllGoods").prop("checked",isChecked);
		});
		$("#publishToIndex").click(function(){
			var goodsList = [];//定义一个数组    
            $('input[name="checkbox"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数    
            	goodsList.push($(this).parent().next().children("div").text());//将选中的值添加到数组chk_value中    
            });
            $.ajaxSettings.async = false;
            $.get("../PublishGoodsToIndexServlet?list="+goodsList,
            function(data,status) {
            	window.wxc.xcConfirm(data, window.wxc.xcConfirm.typeEnum.success);
            });
            $.ajaxSettings.async = true;
		});
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

#publishToIndex {
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

#select {
	font-size: 0px;
	margin: 30px 0 0 0;
}

a{
	text-decoration: none;
}
.message{
	/*border: black solid 1px;*/
	text-align:center;
}
.title{
	display:inline-block;
	text-align:center;
}
</style>
</head>

<body style="background-color: rgb(240, 243, 239);">
	<div id="all">
		<div id="nevagations">
			<c:if test="${authority=='manager'}">
				<a href="#" class="nevagation">管理发布商品</a>
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
			<a href="../IndexGoodsServlet" class="nevagation">首页</a>
			<div style="clear: right;"></div>
		</div>
		<div style="height: 80px;margin: 30px 0 0 0;">
			<div style="height: 100%;float: left;margin: 0 80px;">
				<img alt="logo" src="img/logo.gif" style="height: 100%;"/>
			</div>
			<div style="height: 100%;float: right;margin: 0 80px;">
				<img alt="userImg" src="${userMessages.userImgName}" style="height: 100%;border-radius:100%"/>
			</div>
		</div>
		<div style="width: 100%;height: 5px;background: rgb(230,230,230);margin: 20px 0 0 0;"></div>
		<div style="font-size: 13px;margin: 20px auto 0 auto;">
				<table style="width: 100%;">
					<tr>
						<td>
							<div style="position:relative;left:87px;">
								<div style="width:145px;display:inline-block;"><input type="checkbox" id="selectAllGoods" /> 全选</div>
								<div class="title" style="width:256px;">商品图片</div>
								<div class="title" style="width:256px;">商品信息</div>
								<div class="title" style="width:215px;">商品类别</div>
								<div class="title" style="width:150px;">单价</div>
								<div class="title" style="width:390px;">操作</div>
							</div>
						</td>
					</tr>
					<c:if test="${allGoodsSize!=0}">
						<c:forEach var="goods" items="${allGoods}">
							<tr>
								<td colspan="12">
									<div style="margin: 15px 0 0 0;">
										<table>
											<tr>
												<td colspan="12">
													<div style="position: relative;left: 86px;display: inline-block;">店铺：${goods.user}</div>
												</td>
											</tr>
											<tr>
												<td>
													<div style="padding: 10px 0 10px 0px;background-color: rgb(252,252,252);margin: 0 0 0 100px;">
														<table style="width: 100%;">
															<tr align="center">
																<td width="130px" class="message">
																	<input type="checkbox" class="selectAllGoods" name = "checkbox" />
																</td>
																<td width="263px" class="message"><div style="display:none;">${goods.id}</div><img src="${goods.goodsImgName}" width="100"/></td>
																<td width="258px" class="message">${goods.goodsDescribe}</td>
																<td width="220px" class="message">${goods.goodsClass}</td>
																<td width="152px" class="message">${goods.goodsPrice}元</td>
																<td width="398px" class="message"><a href="../DeleteGoodsServlet?goodsImgName=${goods.goodsImgName}&goodsId=${goods.id}">删除</a></td>
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
								<div style="margin:20px 0 0 0;width:100%;text-align:center;"><button type="button" id="publishToIndex">发布所选商品到首页</button></div>
							</td>
						</tr>
					</c:if>
					<c:if test="${allGoodsSize==0}">
						<tr>
							<td>
								<div style="width:100%;text-align:center;padding:50px 0;"><span class="icon-file-empty" style="font-size:30px;">   </span><h3 style="display:inline-block;">暂无发布的商品！</h3></div>
							</td>
						</tr>
					</c:if>
				</table>
		</div>
	</div>
</body>
</html>

