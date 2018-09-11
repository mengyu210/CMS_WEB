<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../theme/1/css/EditingArea.css">

<script type="text/javascript">
	
	$(function(){
		$(".btn_gray").on("click",function(){
			 $("form").ajaxSubmit(function(obj){
				console.log("18");
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
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">修改友情链接</span>
				</div>
				<form action="manager/updateLink.action" method="post">
					<input type="hidden" name="link.id" value="${link.id }">
					<div class="divtable mt5">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tab3">
							<tbody>
								<tr>
									<td class="tr" width="80">链接名称：</td>
									<td class="pl5"><input type="text" name="link.name" value="${link.name }"></td>
								</tr>
								<tr>
									<td class="tr" width="80">链接地址：</td>
									<td class="pl5"><input type="text" name="link.url" value="${link.url }"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="c_condition website_condition dot_line add_new_link">
						<button class="btn_gray mr5 ml5">修改</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>