<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
String path = request.getContextPath();
%>
<html>
<head>

<title>用户信息修改</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=0;" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
<div  data-role="header">
 <a href="" data-role="button"  onclick="window.location.href='user_index'">主页</a>
<h1>用户信息修改</h1>
</div>
<div data-role="content">
<form method="post" action="">
<div data-role="fieldcontain" style="display:none;">
    <input type="text" id="pId" value="${user.p_id }">
    </div>
  <div data-role="fieldcontain">
    <label for="username">用户名：</label>
    <input type="text" name="username" id="username" placeholder="您的用户名" required="true" value="${user.username }" readonly="true">
    </div>
    <div data-role="fieldcontain">
    <label for="name">姓名：</label>
    <input type="text" name="name" id="name" placeholder="您的真实姓名" required="true" value="${user.name }">
     </div>
     <div data-role="fieldcontain">
    <label for="birthday">出生日期：</label>
    <input type="date" name="birthday" id="birthday" placeholder="您的出生日期" required="true" value="${user.birthday }">
    </div>
     <div data-role="fieldcontain">
    <label for="height">身高：</label>
    <input type="range" name="height" id="height" placeholder="您的身高（cm）" required="true"  min="50" max="250" value="${user.height }"> 
   </div>
    <div data-role="fieldcontain">
    <label for="prepregnancyWeight">孕前体重：</label>
    <input type="range" name="prepregnancyWeight" id="prepregnancyWeight" required="true"  min="40" max="100" value="${user.prepregnancyWeight}">
    <!-- <input type="text" name="prepregnancyWeight" id="prepregnancyWeight" placeholder="您的孕前体重（kg）" required="true"> -->
   </div>
     <div data-role="fieldcontain">
    <label for="weight">当前体重：</label>
    <input type="range" name="weight" id="weight" required="true"  min="40" max="100" value="${user.weight }">
<!--     <input type="text" name="weight" id="weight" placeholder="您的当前体重（kg）" required="true"> -->
   </div>
    <div data-role="fieldcontain">
    <label for="diabetesType">患病时间：</label>
    <select name="diabetesType" id="diabetesType" required="true" value="${user.diabetesType }">
      <option value="0">怀孕前</option>
      <option value="1">怀孕时</option>
    </select>
   </div>
    <div data-role="fieldcontain">
    <label for="strength">工作强度：</label>
    <select name="strength" id="strength" required="true" value="${user.strength }">
      <option value="0">轻度劳动</option>
      <option value="1">中度劳动</option>
      <option value="2">重度劳动</option>
    </select>
   </div>
    <div data-role="fieldcontain">
    <label for="pregnancy">孕期周数：</label>
    <input type="range" name="pregnancy" id="pregnancy" placeholder="请输入您的孕期周数" required="true" value="${user.pregnancy }" min="0" max="50">
   </div>
     <div data-role="fieldcontain">
    <label for="email">邮箱：</label>
    <input type="email" name="email" id="email" placeholder="您的邮件地址" required="true" value="${user.email }">
  </div>
   <div data-role="fieldcontain">
    <label for="password">密码：</label>
    <input type="password" name="password" id="password" placeholder="请输入您的密码" required="true" value="${user.password }">
   </div>
    <div data-role="fieldcontain">
    <label for="doctorId">主治医师：</label>
    <select name="doctorId" id="doctorId" required="false" value="${user.doctorId }">
      <c:forEach var="doctor" items="${doctorlist}" varStatus="s">
       <option value="${doctor.d_id }">${doctor.name }</option>
      </c:forEach>
    </select>
   </div>
     <div data-role="fieldcontain">
     <button onclick="onSubmit();">提交</button>
   </div>
</form>
</div>
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
function onSubmit(){
	var pId = $('#pId').val();
	var username = $('#username').val();
	var name = $('#name').val();
	var birthday = $('#birthday').val();
	var height = $('#height').val();
	var prepregnancyWeight = $('#prepregnancyWeight').val();
	var weight = $('#weight').val();
	var diabetesType = $('#diabetesType').val();
	var strength = $('#strength').val();
	var pregnancy = $('#pregnancy').val();
	var email = $('#email').val();
	var password = $('#password').val();
	var doctorId = $('#doctorId').val();
	
	$.post("saveUserInfo",{pId:pId,name:name,username:username,birthday:birthday,
		height:height,prepregnancyWeight:prepregnancyWeight,weight:weight,
		diabetesType:diabetesType,strength:strength,pregnancy:pregnancy,email:email,
		password:password,doctorId:doctorId},function(text){
			if(text=="1"){
				alert("保存成功！");
				window.location.href="user_index";
			}else{
				alert("保存失败！")
			}
		}); 
	
}
</script>
</html>
