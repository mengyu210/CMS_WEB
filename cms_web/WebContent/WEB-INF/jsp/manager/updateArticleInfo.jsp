<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="../theme/1/css/EditingArea.css">

<script type="text/javascript">
	
	$(function(){
		$(".btn_gray").on("click",function(){
			 $("form").ajaxSubmit(function(obj){
				console.log("18");
				/* $(".ee") */
				if(obj.msg="OK"){
				$.messager.show({
					title:'操作提示',
					msg:"修改成功",
					timeout:5000,
					showType:'slide'
				}); 
				}
			});
			return false;
		});
		
	});

</script>


<div class="editingarea">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
			<div class="website_base">
				<form action="manager/updateArticleInfo.action" method="post">
					<input type="hidden" name="article.id" value="${article.id }">
					<input type="hidden" name="publishDate" value="${article.publishDate }">
					<input type="hidden" name="article.clickTimes" value="0">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">修改信息</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">标题：</td>
								<td class="pl5"><input type="text" value="${article.title }" name="article.title"></td>
							</tr>
							<tr>
								<td class="tr" width="80">作者：</td>
								<td class="pl5"><input type="text" value="${article.author }" name="article.author"></td>
							</tr>
							
							
							<tr>
								<td class="tr" width="80">所属栏目：</td>
								<td class="pl5">
								
									<select name="article.category.id" class="ee">
									<c:forEach items="${categoryList }" var="c">
										<option value="${c.id }">${c.name }</option>
									</c:forEach>
									</select>
								</td>
							</tr>
							
							<tr>
								<td colspan="2">
									<textarea name="article.content" class="website_edit" cols="100">${article.content }</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_left btn_left_bcol">
					<button class="btn_gray mr5 ml5">修改</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>