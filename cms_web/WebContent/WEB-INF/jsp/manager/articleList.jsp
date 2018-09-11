<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
$(function(){
	/* $.get("manager/allArticle.action",function(array){
		$("tbody").empty();
		$.each(array,function(i,e){
			var tr=$("<tr> <td>"+e.title+"</td> <td>"+e.category.name+"</td> <td>"+e.author+"</td> <td>"+e.publishDate+"</td> <td>"+e.clickTimes+"</td> <td><span class='ico_edit ml5' val="+e.id+"></span>&nbsp;&nbsp; <span class='ico_del ml5' val="+e.id+"></span></td> </tr>");
			$("tbody").append(tr);
			tr.hide().fadeIn(1000);
		}); */
		
		
		
		
	/* },"json"); */
	
	$(".btn_gray").on("click",function(){
		var input1 =$(".key").val();
		var input2 = $("#search_input").val();
		var url="manager/seachArticle.action";
		$.get(url,{value:input2,key:input1},function(array){
			if(array){
				$("tbody").empty();
				$.each(array,function(i,e){
					var tr=$("<tr> <td>"+e.title+"</td> <td>"+e.category.name+"</td> <td>"+e.author+"</td> <td>"+e.publishDate+"</td> <td>"+e.clickTimes+"</td> <td><span class='ico_edit ml5' val="+e.id+"></span>&nbsp;&nbsp; <span class='ico_del ml5' val="+e.id+"></span></td> </tr>");
					$("tbody").append(tr);
					tr.hide().fadeIn(1000);
				});
				/**/
				$(".ico_edit").on("click",function(){
		console.log("------");
		var article_id=$(this).attr("val");
		console.log("------"+article_id);
		$(".divtable2").load("manager/showUpdateArticleInfoPage.action?article.id="+article_id);
	});
	
	$(".ico_del").on("click",function(){
		var article_id=$(this).attr("val");
		console.log("-----"+article_id);
		var url="manager/deleteArticle.action";
		var _this=this;
		$.get(url,{id:article_id},function(obj){
			if(obj.msg="OK"){
				$(_this).parent().parent().fadeOut(1000,function(){
					$(this).remove;
				});
			}
			else{
				console.log("error");
			}
		},"json");
	});
				/**/
				
				
			}
			
		},"json");
	});
	
	
	$(".ico_edit").on("click",function(){
		console.log("------");
		var article_id=$(this).attr("val");
		console.log("------"+article_id);
		$(".divtable2").load("manager/showUpdateArticleInfoPage.action?article.id="+article_id);
	});
	
	$(".ico_del").on("click",function(){
		var article_id=$(this).attr("val");
		console.log("-----"+article_id);
		var url="manager/deleteArticle.action";
		var _this=this;
		$.get(url,{id:article_id},function(obj){
			if(obj.msg="OK"){
				$(_this).parent().parent().fadeOut(1000,function(){
					$(this).remove;
				});
			}
			else{
				console.log("error");
			}
		},"json");
	});
	
	
	
	return false;
});
</script>
	<div style="padding: 10px;0" class="divtable2">
		<div class="c_condition">
			<span>
					<select name="key" class="key">
						<option value="-1">-请选择-</option>
						<option value="title">标题</option>
						<option value="author">作者</option>
						<option value="category">栏目</option>
					</select>
			</span>
			<span>关键字：<input type="text" name="value" id="search_input"></span> 
			<button class="btn_gray">搜索</button>
		</div>
		<div class="divtable">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="tab1">
				<thead>
				<tr>
					<th class="tl pl5">标题</th>
					<th class="tl pl5">所属栏目</th>
					<th class="tl pl5">作者</th>
					<th class="tl pl5">发布日期</th>
					<th class="tl pl5">点击次数</th>
					<th class="tl pl5">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${articleList }" var="a">
			<tr>
				<td class="pl5">${a.title }</td>
				<td class="pl5">${a.category.name }</td>
				<td class="pl5">${a.author }</td>
				<td class="pl5">${a.publishDate }</td>
				<td class="pl5">${a.clickTimes }</td>
				<!-- 拓展 js -->
				<td class="pl5">
					<span class="ico_edit ml5" val="${a.id }"></span>
					<span class="ico_del ml5" val="${a.id }"></span>
				</td>
			</tr>
			  </c:forEach>
				</tbody>
			</table>
		</div>
	</div>	
