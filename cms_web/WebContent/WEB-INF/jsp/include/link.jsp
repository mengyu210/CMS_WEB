<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="link">
	<div class="linelink"><span>友情链接：</span>
	<c:forEach items="${linkList }" var="cc">
		<a href="${cc.url }">${cc.name }</a>
    </c:forEach>
    </div>
</div>