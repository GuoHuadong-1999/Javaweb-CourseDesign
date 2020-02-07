<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>发布商品</title>
<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/xcConfirm.css"/>
<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	function check(){
		var fileInput = $('#goodsImgName').get(0).files[0];
		if(fileInput){
			var value = $(".goodsPrice").val().trim();
			if(!isNaN(value)){
				return true;
			}else{
				window.wxc.xcConfirm("商品价格只能为纯整数数字！", window.wxc.xcConfirm.typeEnum.error);
				return false;
			}
		}else{
			window.wxc.xcConfirm("请上传商品图片！", window.wxc.xcConfirm.typeEnum.error);
			return false;
		}
	}
	$(function() {
		$("#all").css("width", window.screen.width);
		$("#footer").css("width", window.screen.width); 
		$('.chosen-select').chosen();
		$(".lined").linedtextarea();
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

#nevagations {
	background-color: rgb(227, 228, 229);
	font-size:16px;
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
	margin: 10px 0;
}
#submit{
	width: 100%;
	height: 50px;
	line-height: 50px;
	position: absolute;
	left: 0px;
	bottom: 0px;
}
#describe{
	width: 450px;
	height: 250px;
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
			<div style="height: 100%;float: right;margin: 0 80px;">
				<img alt="userImg" src="${userMessages.userImgName}" style="height: 100%;border-radius:100%;"/>
			</div>
		</div>
		<div style="width: 100%;height: 500px;background-color: rgb(231,153,5);margin: 30px 0 0 0;padding: 20px 0"align="center">
			<div style="width: 70%;height: 100%;">
				<form action="../PublishGoodsServlet" method="post" style="width: 100%;height: 100%;border-radius:2%;background-color: rgb(240, 243, 239);" onsubmit="return check()" enctype="multipart/form-data">
					<div style="width: 50%;height: 100%;display: inline-block;float: left; line-height: 500px;">
						<div><input type="file" class="jfilestyle" data-theme="blue" data-buttonText="添加商品图片" name="goodsImgName" id="goodsImgName"></div>
					</div>
					<div style="width: 50%;height: 100%;display: inline-block;float: left;position: relative;">
						<div><input type="text" id="search" placeholder="商品名称" name="goodsName"></div>
						<div><input type="text" id="search" placeholder="价格" name="goodsPrice" class="goodsPrice"></div>
						<div class="row" style="width: 485px;">
						    <div class="col-lg-12">
						        <select data-placeholder="请选择一个商品类别" class="chosen-select" tabindex="2" name="goodsClass">
						            <option value=""></option>
						            <option value="女装/内衣">女装/内衣</option>
						            <option value="男装/运动户外">男装/运动户外</option>
						            <option value="女鞋 /男鞋 /箱包">女鞋 /男鞋 /箱包</option>
						            <option value="美妆 /个人护理">美妆 /个人护理</option>
						            <option value="腕表 /眼镜 /珠宝饰品">腕表 /眼镜 /珠宝饰品</option>
						            <option value="手机 /数码 /电脑办公">手机 /数码 /电脑办公</option>
						            <option value="母婴玩具">母婴玩具</option>
						            <option value="零食 /茶酒 /进口食品">零食 /茶酒 /进口食品</option>
						            <option value="生鲜水果">生鲜水果</option>
						            <option value="大家电 /生活电器">大家电 /生活电器</option>
						            <option value="家具建材">家具建材</option>
						            <option value="汽车 /配件 /用品">汽车 /配件 /用品</option>
						            <option value="家纺 /家饰 /鲜花">家纺 /家饰 /鲜花</option>
						            <option value="医药保健">医药保健</option>
						            <option value="厨具 /收纳 /宠物">厨具 /收纳 /宠物</option>
						            <option value="图书音像">图书音像</option>
						        </select>
						    </div>
						</div>
						<div><input type="text" id="search" placeholder="发货地址" name="publishAddress"></div>
						<div>
							<textarea id="describe" rows="3" cols="20" name="goodsDescribe">商品描述！</textarea>
						</div>
						<div id="submit"><button type="submit" class="btn btn-default navbar-btn">发布商品</button></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

