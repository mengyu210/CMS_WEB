<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>信息详情</title>
<link rel="stylesheet" type="text/css" href="../theme/1/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../theme/1/css/front/style.css">
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
							href="../manager/home.action">后台管理</a></span> <span class="sp_signout">退出</span>
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
				<div class="conarticle">
					<div class="position">
						<span class="poshome">您现在的位置：</span> <a href="home.action">首页</a>
						 >><a href="showArticleListByCondition.action?category.id=${category.id }&category.name=${category.name }"> ${category.name } </a>
					</div>
					<div class="title">${article.title}</div>
					<div class="abstract">
						<span>发布时间：${article.publishDate}</span> <span>作者：${article.author}</span>
						<span>点击${article.clickTimes}次</span>
					</div>
					<div class="details">
						<p>${article.content}</p>
					</div>
				</div>
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
		<div class="footer">
			<div class="foot">
				<p>${basicInfoMap['company_name'] }|${basicInfoMap['company_address'] }|${basicInfoMap['company_copyright'] }</p>
			</div>
		</div>
	</div>
</body>
</html>
