<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function(){
	$.get("manager/allCategory.action",function(array){
		console.log("123");
		$("tbody").empty();
		console.log("124"+array);
		$.each(array,function(i,e){
			var tr=$("<tr> <td>"+e.name+"</td> <td>"+e.code+"</td> <td><span class='ico_edit ml5' val="+e.id+"></span>&nbsp;&nbsp; <span class='ico_del ml5' val="+e.id+"></span></td> </tr>");
			$("tbody").append(tr);
			tr.hide().fadeIn(1000);
		});
		
		$(".ico_edit").on("click",function(){
			var id = $(this).attr("val");
			var	name=$(this).parent().parent().find("td").eq(0).html();
			var	code=$(this).parent().parent().find("td").eq(1).html();
			$(".divtable").load("manager/showUpdateCategoryPage.action?category.id="+id+"&category.code="+code+"&category.name="+name);
		});
		
		
		$(".ico_del").on("click",function(){
			var category_id=$(this).attr("val");
			var url="manager/deleteCategory.action";
			var _this=this;
			$.get(url,{id:category_id},function(obj){
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
		
		
	},"json");
});

</script>

<div class="divtable">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="tab1">
			<thead>
				<tr>
					<th class="tl pl5">栏目名称</th>
					<th class="tl pl5">栏目编号</th>
					<th class="tl pl5">操作</th>
				</tr>
			</thead>
			<tbody>

		</tbody>
	</table>
</div>