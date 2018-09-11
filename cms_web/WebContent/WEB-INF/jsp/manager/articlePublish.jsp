<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
		 $(function(){
			$.get("manager/findCategoryList.action",function(array){
				$.each(array,function(i,e){
					var tr=$("<option value='"+e.id+"'>"+e.name+"</option>");
					$("select").append(tr);
				});
			},"json");
			return false;
		}); 

		$(".btn_gray").on("click",function(){
			$("form").ajaxSubmit(function(msg){
				$.messager.show({
					title:'操作提示',
					msg:msg,
					timeout:5000,
					showType:'slide'
				});
			});
			 return false;
		});	
</script>


<div class="editingarea">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
			<div class="website_base">
				<form action="manager/articlePublish.action" method="post">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">信息发布</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">标题：</td>
								<td class="pl5"><input type="text" name="article.title"></td>
							</tr>
							<tr>
								<td class="tr" width="80">作者：</td>
								<td class="pl5"><input type="text" name="article.author"></td>
							</tr>
							<tr>
								<td class="tr" width="80">所属栏目：</td>
								<td class="pl5">
									<select name="article.category.id">
								
										
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea name="article.content" class="website_edit" cols="100"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_left btn_left_bcol">
					<button class="btn_gray mr5 ml5">发布</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>