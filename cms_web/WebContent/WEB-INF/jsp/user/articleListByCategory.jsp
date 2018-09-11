<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>文章信息列表</title>
<link rel="stylesheet" type="text/css" href="../theme/1/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../theme/1/css/front/style.css">
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
/* $(function(){
	console.log("11");
	$(".art_img").on("click",function(){
		console.log("12");
		var id=$(this).attr("val");
		console.log("11"+id);
		$(".search_result").load("showArticleContentPage.action?article.id="+id);
	});
	return false;
}); */

</script>
</head>
<body>
	<div id="main">
		<div class="top">
			<div class="topbg">
				<div class="logo_sign">
					<div class="logo"></div>
					<div class="sign">
						<span>欢迎您系统管理员</span> <span class="sp_home"><a
							href="home.action">首页</a></span> <span class="sp_backstage"><a
							href="../manager/home.action">后台管理</a></span>
					</div>
				</div>
				<div class="nav">
					<ul class="navUI">
						<li><a href="home.action">首页</a></li>
						<c:forEach items="${categoryList}" var="category">
							<li><a
								href="showArticleListByCondition.action?category.id=${category.id }&category.name=${category.name }"
								class="showArticleList">${category.name }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="congw">
				<div class="conlist">
					<div class="position">
						<span class="poshome">您现在的位置：</span> <a href="home.action">首页</a>
						>> <a href="#"> ${category.name } </a>
					</div>
					<div class="search_result">
						<c:forEach items="${articleList }" var="a">
							<div class="art_box">
								<div class="art_img" val="${a.id}">
									<a
										href="showArticleContentPage.action?article.id=${a.id }&category.id=${category.id }"><img
										src="../theme/1/images/front/doc.png"></a>
								</div>
								<div class="art_txt">
									<div class="title">${a.title }<span class="icon_pen"></span>
									</div>
									<div class="tag_txt">
										<span>栏目名称：${a.category.name }</span><span class="pl30">点击次数：${a.clickTimes }</span>
									</div>
									<div class="tag_txt">
										<span>作者：${a.author }</span><span class="pl30">发布时间：${a.publishDate }</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="page"></div>
			</div>

		</div>
		<div class="link">
			<div class="linelink">
				<span>友情链接：</span>
				<c:forEach items="${linkList }" var="cc">
					<a href="${cc.url }">${cc.name }</a>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="foot">
			<p>${basicInfoMap['company_name'] }|${basicInfoMap['company_address'] }|${basicInfoMap['company_copyright'] }</p>
		</div>
	</div>
</body>
</html>
