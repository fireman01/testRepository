<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>编辑食物信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta name="viewport" content="width=device-width"/>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">

</head>

<div data-role="page" id="pageone">
	<div data-role="header">
		<h1>编辑食物信息</h1>
	</div>
	<div data-role="content">
		<div data-role="fieldcontain" style="display:none;">
			<input type="text" id="id" value="${food.id }">
		</div>
		<div data-role="fieldcontain">
			<label for="type">类型：</label> <select name="type" id="type"
				required="true" value="${food.type }">
				<option value="1">主食</option>
				<option value="2">肉类</option>
				<option value="3">蔬菜</option>
				<option value="4">饮品</option>
				<option value="5">坚果</option>
				<option value="6">水果</option>
			</select>
		</div>
		<div data-role="fieldcontain">
			<label for="name">名称：</label> <input type="text" name="name"
				id="name" required="true" placeholder="名称" value="${food.name }">
		</div>
		<div data-role="fieldcontain">
			<label for="energy">能量：</label> <input type="text" name="energy"
				id="energy" required="true" placeholder="能量" value="${food.energy }">
		</div>
		<div data-role="fieldcontain">
			<label for="protein">蛋白质：</label> <input type="text" name="protein"
				id="protein" required="true" placeholder="蛋白质"
				value="${food.protein }">
		</div>
		<div data-role="fieldcontain">
			<label for="fat">脂肪：</label> <input type="text" name="fat" id="fat"
				required="true" placeholder="脂肪" value="${food.fat }">
		</div>
		<div data-role="fieldcontain">
			<label for="carbohydrate">碳水化合物：</label> <input type="text"
				name="carbohydrate" id="carbohydrate" required="true"
				placeholder="碳水化合物" value="${food.carbohydrate }">
		</div>
		<div data-role="fieldcontain">
			<label for="cellulose">纤维素：</label> <input type="text"
				name="cellulose" id="cellulose" required="true" placeholder="纤维素"
				value="${food.cellulose }">
		</div>
		<div data-role="fieldcontain">
			<label for="ordername">排序：</label> <input type="text"
				name="ordername" id="ordername" required="true" placeholder="排序"
				value="${food.ordername }">
		</div>
		<div data-role="fieldcontain">
			<input type="button" value="提交" onclick="onSubmit();"> <input
				type="button" value="删除" onclick="onDelete();"> <input
				type="button" value="返回" onclick="window.location.href='food_list'">
		</div>
	</div>
	<div data-role="footer">
		<h1>&nbsp;</h1>
	</div>
</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
function onDelete(){
	var r=confirm("确认删除？");
	if (r==true)
	  {
		var id = $('#id').val();
		var type = $('#type').val()
	    $.post("deleteFoodInfo",{id:id,type:type},function(text){
		if(text=="1"){
			alert("删除成功！");
			window.location.href="food_list";
		}else{
			alert("删除失败！")
		}
	   }); 
	 }
}
function onSubmit(){
var id = $('#id').val();
var type = $('#type').val();
var name = $('#name').val();
var energy = $('#energy').val();
var protein = $('#protein').val();
var fat = $('#fat').val();
var carbohydrate = $('#carbohydrate').val();
var cellulose = $('#cellulose').val();
var ordername = $('#ordername').val();

 $.post("saveFoodInfo",{id:id,type:type,name:name,energy:energy,protein:protein,
	 fat:fat,carbohydrate:carbohydrate,cellulose:cellulose,ordername:ordername},function(text){
		if(text=="1"){
			alert("保存成功！");
			window.location.href="food_list";
		}else{
			alert("保存失败！")
		}
	}); 
}
</script>
</html>
