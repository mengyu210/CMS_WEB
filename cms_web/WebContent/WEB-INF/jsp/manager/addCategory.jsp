<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	
	$(function(){
		
		$("tbody").find("input").eq(0).on("blur",function(){
			var name = $(this).val();
			//栏目名称必须有值
			if(!name){
				$("#msg_span").html("");
				return false;
			}
			//category.name=tom
			var url = "manager/findCategoryByName.action";
			$.get(url+"?category.name="+name,function(obj){
				
				var className = "error_span";
				if(obj.flag=="SUCCESS"){
					className = "success_span";
				}
				$("#msg_span").html(obj.msg).attr("class",className);
				
			},"json");
			
		});
		
		
		$(".btn_gray").on("click",function(){
			
			
			var input1 = $("tbody").find("input").eq(0);
			var input2 = $("tbody").find("input").eq(1);
			
			if(!input1.val() || !input2.val()){
				$.messager.alert('操作提示','栏目名称或编号不能为空！','info');
				return false;
			}
			
			if(isNaN(input2.val())){
				$.messager.alert('操作提示','栏目编号必须是数字！','info');
				return false;
			}
			
			//栏目名是否可用
			if($("#msg_span").attr("class")=="error_span"){
				$.messager.alert('操作提示',$("#msg_span").html(),'info');
				return false;
			}
			
			$("form").ajaxSubmit(function(msg){
				console.log("18");
				$.messager.show({
					title:'操作提示',
					msg:msg,
					timeout:5000,
					showType:'slide'
				});
				//清空输入框
				input1.val("");
				input2.val("");
				//第一个输入框获得焦点
				input1.focus();
				//清空span中的验证信息
				$("#msg_span").html("");
			});
			
			
			return false;
		});
		
	});

</script>

<style>
	.success_span{
		color: green;
	}
	.error_span{
		color: red;
	}
</style>

<div class="editingarea">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
		<form action="manager/addCategory.action" method="post">
			<div class="website_base">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">添加栏目</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">栏目名称：</td>
								<td class="pl5"><input type="text" name="category.name"><span id="msg_span"></span></td>
								
							</tr>
							<tr>
								<td class="tr" width="80">栏目编号：</td>
								<td class="pl5"><input type="text" name="category.code"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_left btn_left_bcol">
					<button class="btn_gray mr5 ml5">发布</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>