<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(function(){
	$(".btn_gray").on("click",function(){
		console.log("18");
 		$("form").ajaxSubmit(function(msg){	
			$.messager.show({
			title:'操作提示',
			msg:msg,
			timeout:5000,
			showType:'slide'
			});
			$(".editingarea").empty().load("manager/showBaseSetPage.action");
    	});
 		return false;
	});
	
	$(".ico_edit").on("click",function(){
		console.log("------");
		var link_id=$(this).attr("val");
		$(".editingarea").empty().load("manager/showUpdateLinkPage.action?link.id="+link_id);
	});
	
	$(".ico_del").on("click",function(){
		var link_id=$(this).attr("val");
		var url="manager/deleteLink.action";
		var _this=this;
		$.get(url,{id:link_id},function(msg){
			if(msg){
				 $(_this).parent().parent().fadeOut(1000,function(){
					$(this).remove;
				}); 
			}
			else{
				console.log("error");
			}
		},"text");
	});
	
	$(".btn_set").on("click",function(){
		console.log("18");
 		$(".form2").ajaxSubmit(function(msg){	
			$.messager.show({
			title:'操作提示',
			msg:msg,
			timeout:5000,
			showType:'slide'
			});
    	});
 		return false;
	});
	
});
</script>

<div class="editingarea">
<div style="float:left;width:48%">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
		<form action="manager/addLink.action" method="post">
			<div class="website_base">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">添加友情链接</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">链接名称：</td>
								<td class="pl5"><input type="text" name="link.name"></td>
							</tr>
							<tr>
								<td class="tr" width="80">链接地址：</td>
								<td class="pl5"><input type="text" name="link.url"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="c_condition website_condition dot_line">
					<button class="btn_gray mr5 ml5">添加</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	
	<div class="c_editview">
		<div class="c_r_right_border">
		<form action="manager/setBasicInfo.action" method="post" class="form2">
			<div class="website_base">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">基础信息设置</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">公司名称：</td>
								<td class="pl5"><input  style="width:80%" type="text" name="company_name" value="${basicInfoMap['company_name'] }"></td>
							
							</tr>
							<tr>
								<td class="tr" width="80">公司地址：</td>
								<td class="pl5"><input  style="width:80%" type="text" name="company_address" value="${basicInfoMap['company_address'] }"></td>
							</tr>
							<tr>
								<td class="tr" width="80">版权信息：</td>
								<td class="pl5"><input style="width:80%" type="text" name="company_copyright" value="${basicInfoMap['company_copyright'] }"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="c_condition website_condition dot_line">
					<button class="btn_set mr5 ml5">设置</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
<div style="float:right;width:50%">
	<div class="divtable">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tab1">
			<tbody>
				<tr>
					<th class="tl pl5">链接名称</th>
					<th class="tl pl5">链接地址</th>
					<th class="tl pl5">操作</th>
				</tr>
				<c:forEach items="${linkList }" var="linklist">
				<tr>
					<td class="pl5">${linklist.name }</td>
					<td class="pl5">
						<span class="fontLv">${linklist.url }</span>
					</td>
					<td class="pl5">
						<span class="ico_edit" val="${linklist.id }"></span>
						<span class="ico_del ml5" val="${linklist.id }"></span>
					</td>
				</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>

</div>
