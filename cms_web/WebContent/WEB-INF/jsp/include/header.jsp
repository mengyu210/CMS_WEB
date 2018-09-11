<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="top">
	<div class="topbg">
        <div class="logo_sign">
        	<div class="logo"></div>
            <div class="sign">
            	<span>欢迎您系统管理员</span>
                <span class="sp_home"><a href="home.action">首页</a></span>
                <span class="sp_backstage"><a href="../manager/home.action">后台管理</a></span>
            </div>
        </div> 
        <div class="nav">
        	<ul class="navUI">
            	<li><a href="javascript:void(0);">首页</a></li>
            	<c:forEach items="${categoryList}" var="category">
            		<li><a href="showArticleListByCondition.action?category.id=${category.id }&category.name=${category.name }" class="showArticleList">${category.name }</a></li>
            	</c:forEach>
            </ul>
        </div>
        <div class="banner">
        	<div class="banimg"><img src="../theme/1/images/front/banner.png"></div>
        </div>
    </div>
</div>
