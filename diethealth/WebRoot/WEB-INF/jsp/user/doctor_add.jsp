<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>添加医生信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=0;"
	name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">

</head>

<div data-role="page" id="pageone">
	<div data-role="header">
		<h1>添加医生信息</h1>
	</div>
	<div data-role="content">
		<div data-role="fieldcontain">
			<label for="dId">工号：</label> <input type="text" name="dId" id="dId"
				required="true" placeholder="工号">
		</div>
		<div data-role="fieldcontain">
			<label for="name">姓名：</label> <input type="text" name="name"
				id="name" required="true" placeholder="姓名">
		</div>
		<div data-role="fieldcontain">
			<label for="office">科室：</label> <input type="text" name="office"
				id="office" required="true" placeholder="科室">
		</div>
		<div data-role="fieldcontain">
			<label for="phone">手机号码：</label> <input type="text" name="phone"
				id="phone" required="true" placeholder="手机号码">
		</div>
		<div data-role="fieldcontain">
			<label for="password">登录密码：</label> <input type="text"
				name="password" id="password" required="true" placeholder="登录密码"
				value="123456">
		</div>
		<div data-role="fieldcontain">
			<input type="button" value="提交" onclick="onSubmit();">
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
function onSubmit(){
var dId = $('#dId').val();
var name = $('#name').val();
var office = $('#office').val();
var phone = $('#phone').val();
var password = $('#password').val();

 $.post("saveDoctorInfo",{dId:dId,name:name,office:office,phone:phone,
	 password:password},function(text){
		if(text=="1"){
			alert("保存成功！");
			window.location.href="doctor_list";
		}else{
			alert("保存失败！")
		}
	}); 
}
</script>
</html>
