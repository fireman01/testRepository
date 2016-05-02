<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">

<title>用户注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=0;" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
<div  data-role="header">
 <a href="#" data-role="button">登录</a>
<h1>用户注册</h1>
</div>
<div data-role="content">
<form method="post" action="user/add_user" id="form1">
  <div data-role="fieldcontain">
    <label for="username">用户名：</label>
    <input type="text" name="username" id="username" placeholder="您的用户名" required="true">
    </div>
    <div data-role="fieldcontain">
    <label for="name">姓名：</label>
    <input type="text" name="name" id="name" placeholder="您的真实姓名" required="true">
     </div>
     <div data-role="fieldcontain">
    <label for="birthday">出生日期：</label>
    <input type="date" name="birthday" id="birthday" placeholder="您的出生日期" required="true" value="1990-01-01">
    </div>
     <div data-role="fieldcontain">
    <label for="height">身高：</label>
    <input type="range" name="height" id="height" placeholder="您的身高（cm）" required="true"  min="50" max="250" value="165"> 
   </div>
    <div data-role="fieldcontain">
    <label for="prepregnancyWeight">孕前体重：</label>
    <input type="range" name="prepregnancyWeight" id="prepregnancyWeight" required="true"  min="40" max="100" value="50">
    <!-- <input type="text" name="prepregnancyWeight" id="prepregnancyWeight" placeholder="您的孕前体重（kg）" required="true"> -->
   </div>
     <div data-role="fieldcontain">
    <label for="weight">当前体重：</label>
    <input type="range" name="weight" id="weight" required="true"  min="40" max="100" value="60">
<!--     <input type="text" name="weight" id="weight" placeholder="您的当前体重（kg）" required="true"> -->
   </div>
    <div data-role="fieldcontain">
    <label for="height">患病时间：</label>
    <select name="diabetesType" id="diabetesType" required="true">
      <option value="0">怀孕前</option>
      <option value="1">怀孕时</option>
    </select>
   </div>
    <div data-role="fieldcontain">
    <label for="strength">工作强度：</label>
    <select name="strength" id="strength" required="true">
      <option value="0">轻度劳动</option>
      <option value="1">中度劳动</option>
      <option value="2">重度劳动</option>
    </select>
   </div>
    <div data-role="fieldcontain">
    <label for="pregnancy">孕期周数：</label>
    <input type="range" name="pregnancy" id="pregnancy" placeholder="请输入您的孕期周数" required="true" value="16" min="0" max="50">
   </div>
     <div data-role="fieldcontain">
    <label for="email">邮箱：</label>
    <input type="email" name="email" id="email" placeholder="您的邮件地址" required="true">
  </div>
   <div data-role="fieldcontain">
    <label for="password">密码：</label>
    <input type="password" name="password" id="password" placeholder="请输入您的密码" required="true">
   </div>
     <div data-role="fieldcontain">
    <label for="password1">确认密码：</label>
    <input type="password"  name="password1"  id="password1" placeholder="请再次输入密码" required="true">
   </div>
     <div data-role="fieldcontain">
     <button onclick="return onSubmit();">提交</button>
   </div>
</form>
</div>
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
function onSubmit(){
	var password = $('#password').val();
	var password1 = $('#password1').val();
	   if(password!=password1){
		   alert("两次密码输入不一致，请重新输入!");
		   $('#password').val("");
		   $('#password1').val("");
		   return false;
	   }else{
		   return true;
	   }
	  
}
</script>
</html>
