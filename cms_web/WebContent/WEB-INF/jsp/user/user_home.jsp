<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>首页</title>
<link rel="stylesheet" type="text/css" href="../theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="../theme/1/css/front/style.css">
</head>
<body>
<div id="main">
    <jsp:include page="../include/header.jsp"></jsp:include>
    <div class="content">
    	<div class="congw">
            <div class="clear"></div>
            <div class="box">
            
            <c:forEach items="${categoryList }" var="category">
            	<div class="box_b">
                	<div class="title">
                    	<span class="txt_title">${category.name }</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
	                        	<a href="showArticleListByCondition.action?category.id=${category.id }&category.name=${category.name }">更多>></a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                    	<c:forEach items="${category.articles}" var="article">
                        	<li>
                            	<a href="showArticleContentPage.action?article.id=${article.id }&category.id=${category.id }" class="txt_title">${article.title }</a><span class="txt_discipline">${article.author }</span>
                            	<span class="txt_time"><fmt:formatDate value="${article.publishDate }"/></span>
                            </li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                
                </c:forEach>
                
            </div>
           <jsp:include page="../include/link.jsp"></jsp:include>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</div>
</body>
</html>
