<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
<head>
<title>选择加餐</title>

<meta content="width=device-width" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>选择加餐</h1>
		</div>
		<div data-role="content">
			<fieldset data-role="controlgroup">
				<legend>选择加餐类型</legend>
				<label for="breakfast">上午加餐</label> 
				<input type="checkbox" name="favcolor" id="breakfast" value="4"> 
				<label for="lunch">下午加餐</label> 
				<input type="checkbox" name="favcolor" id="lunch" value="5">
				<label for="dinner">晚上加餐</label> 
				<input type="checkbox" name="favcolor" id="dinner" value="6">
			</fieldset>
			
			 <div data-role="fieldcontain">
   			   <button onclick="onSubmit();">确认</button>
   			   <button onclick="window.location.href='diet_edit?snacks='">跳过</button>
   			 </div>
		</div>
	</div>
</body>
</html>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
function onSubmit(){
	var sancks = "";
	if($('#breakfast').is(':checked')==true){
		sancks +=$('#breakfast').val()+"|";
	}
	if($('#lunch').is(':checked')==true){
		sancks +=$('#lunch').val()+"|";
	}
	if($('#dinner').is(':checked')==true){
		sancks +=$('#dinner').val();
	}
	window.location.href='diet_edit?snacks='+sancks;
	
}
</script>
