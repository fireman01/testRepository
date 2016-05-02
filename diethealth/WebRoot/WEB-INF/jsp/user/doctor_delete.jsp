<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>医生信息删除</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=0;" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">

</head>

<div data-role="page" id="pageone">
	<div data-role="header">
		<h1>医生信息删除</h1>
	</div>
	<div data-role="content">
		<div data-role="fieldcontain">
			<label for="dId">工号：</label> <input type="text" name="dId" id="dId"
				required="true" placeholder="您的工号" value="${doctor.d_id}"
				readonly="true">
		</div>
		<div data-role="fieldcontain">
			<label for="name">姓名：</label> <input type="text" name="name"
				id="name" required="true" placeholder="您的姓名" value="${doctor.name}"
				readonly="true">
		</div>
		<div data-role="fieldcontain">
			<label for="office">科室：</label> <input type="text" name="office"
				id="office" required="true" placeholder="您的科室"
				value="${doctor.office}" readonly="true">
		</div>
		<div data-role="fieldcontain">
			<label for="phone">手机号码：</label> <input type="text" name="phone"
				id="phone" required="true" placeholder="您的手机号码"
				value="${doctor.phone}" readonly="true">
		</div>
		<div data-role="fieldcontain">
			<label for="password">登录密码：</label> <input type="text"
				name="password" id="password" required="true" placeholder="您的登录密码"
				value="${doctor.password}" readonly="true">
		</div>
		<div data-role="fieldcontain">
			<input type="button" value="删除" onclick="onSubmit();">
			<input type="button" value="返回" onclick="window.location.href='doctor_list'">
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
	var r=confirm("确认删除？");
	if (r==true)
	  {
		var dId = $('#dId').val();
	    $.post("deleteDoctorInfo",{dId:dId},function(text){
		if(text=="1"){
			alert("删除成功！");
			window.location.href="doctor_list";
		}else{
			alert("删除失败！")
		}
	   }); 
	 }
}
</script>
</html>
