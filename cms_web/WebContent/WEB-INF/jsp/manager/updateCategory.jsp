<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../theme/1/css/EditingArea.css">

<script type="text/javascript">
	
	$(function(){
		$(".btn_gray").on("click",function(){
			var input1 = $("tbody").find("input").eq(0);
			var input2 = $("tbody").find("input").eq(1);
			var input3 = $("tbody").find("input").eq(2);
			/* console.log(input1.val()+"f"+input2.val()+"f"+input3.val()); */
			 $("form").ajaxSubmit(function(msg){
				console.log("18");
				if(msg){
				$.messager.show({
					title:'操作提示',
					msg:msg,
					timeout:3000,
					showType:'slide'
				}); 
				//清空输入框
				/* input1.val("");
				input2.val("");*/
				//第一个输入框获得焦点
				input1.focus(); 
				//清空span中的验证信息
				$("#msg_span").html("");
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
				<form action="manager/updateCategory.action" method="post">
					<input type="hidden" name="category.id" value="${category.id}">
					<div class="c_condition website_condition dot_line">
						<span class="yx_txt_center">修改栏目</span>
					</div>
					<div class="divtable mt5">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tab3">
							<tbody>
								<tr>
									<td class="tr" width="80">栏目名称：</td>
									<td class="pl5"><input type="text" value="${category.name} " name="category.name"></td>
								</tr>
								<tr>
									<td class="tr" width="80">栏目编号：</td>
									<td class="pl5"><input type="text" value="${category.code}" name="category.code"></td>
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
