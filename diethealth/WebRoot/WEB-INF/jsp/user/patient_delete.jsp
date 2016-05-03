<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>患者信息删除</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">

</head>

<div data-role="page" id="pageone">
	<div data-role="header">
		<h1>患者信息删除</h1>
	</div>
	<div data-role="content">
		<div data-role="fieldcontain" style="display:none;">
			<input type="text" id="pId" value="${patient.p_id}">
		</div>
		<div data-role="fieldcontain">
			<label for="username">用户名：</label> <input type="text" name="username"
				id="username" required="true" value="${patient.username}"
				readonly="true">
		</div>
		<div data-role="fieldcontain">
			<label for="name">姓名：</label> <input type="text" name="name"
				id="name" required="true"value="${patient.name}"
				readonly="true">
		</div>
	 <div data-role="fieldcontain">
    <label for="birthday">出生日期：</label>
    <input type="date" name="birthday" id="birthday" placeholder="您的出生日期" required="true" value="${patient.birthday }" readonly="true">
    </div>
     <div data-role="fieldcontain">
    <label for="height">身高：</label>
    <input type="range" name="height" id="height" placeholder="您的身高（cm）" required="true"  min="50" max="250" value="${patient.height }" readonly="true"> 
   </div>
    <div data-role="fieldcontain">
    <label for="prepregnancyWeight">孕前体重：</label>
    <input type="range" name="prepregnancyWeight" id="prepregnancyWeight" required="true"  min="40" max="100" value="${patient.prepregnancyWeight}" readonly="true">
    <!-- <input type="text" name="prepregnancyWeight" id="prepregnancyWeight" placeholder="您的孕前体重（kg）" required="true"> -->
   </div>
     <div data-role="fieldcontain">
    <label for="weight">当前体重：</label>
    <input type="range" name="weight" id="weight" required="true"  min="40" max="100" value="${patient.weight }" readonly="true">
<!--     <input type="text" name="weight" id="weight" placeholder="您的当前体重（kg）" required="true"> -->
   </div>
    <div data-role="fieldcontain">
    <label for="height">患病时间：</label>
    <select name="diabetesType" id="diabetesType" required="true" value="${patient.diabetesType }" readonly="true">
      <option value="0">怀孕前</option>
      <option value="1">怀孕时</option>
    </select>
   </div>
    <div data-role="fieldcontain">
    <label for="strength">工作强度：</label>
    <select name="strength" id="strength" required="true" value="${patient.strength }" readonly="true">
      <option value="0">轻度劳动</option>
      <option value="1">中度劳动</option>
      <option value="2">重度劳动</option>
    </select>
   </div>
    <div data-role="fieldcontain">
    <label for="state">就诊状态：</label>
    <select name="state" id="state" required="true" value="${patient.state }" readonly="true">
      <option value="1">待确认</option>
      <option value="2">治疗中</option>
      <option value="3">已就诊</option>
    </select>
   </div>
    <div data-role="fieldcontain">
    <label for="pregnancy">孕期周数：</label>
    <input type="range" name="pregnancy" id="pregnancy" placeholder="请输入您的孕期周数" required="true" value="${patient.pregnancy }" min="0" max="50" readonly="true">
   </div>
     <div data-role="fieldcontain">
    <label for="email">邮箱：</label>
    <input type="email" name="email" id="email" required="true" value="${patient.email }" readonly="true">
  </div>
   <div data-role="fieldcontain">
    <label for="doctorName">主治医师：</label>
    <input type="text" name="doctorName" id="doctorName"  required="true" value="${patient.doctorName }" readonly="true">
  </div>
   <div data-role="fieldcontain">
    <label for="password">密码：</label>
    <input type="password" name="password" id="password" placeholder="请输入您的密码" required="true" value="${patient.password }" readonly="true">
   </div>
		<div data-role="fieldcontain">
			<input type="button" value="删除" onclick="onSubmit();">
			<input type="button" value="返回" onclick="window.location.href='patient_list'">
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
		var pId = $('#pId').val();
	    $.post("deletePatientInfo",{pId:pId},function(text){
		if(text=="1"){
			alert("删除成功！");
			window.location.href="patient_list";
		}else{
			alert("删除失败！")
		}
	   }); 
	 }
}
</script>
</html>
