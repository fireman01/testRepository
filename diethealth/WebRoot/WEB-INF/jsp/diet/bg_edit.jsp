<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
String path = request.getContextPath();
String pId = session.getAttribute("pId").toString();
%>
<html>
<head>

<title>血糖录入</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
<div  data-role="header">
 <a href="" data-role="button"  onclick="window.location.href='../user/user_index'">主页</a>
<h1>血糖录入</h1>
</div>
<div data-role="content">
<form method="post" action="">
<div data-role="fieldcontain" style="display:none;">
    <input type="text" id="pId" value="<%=pId%>">
    </div>
  <div data-role="fieldcontain">
    <label for="bloodGlucoseBeforeBreakfast">早餐前：</label>
    <input type="text" name="bloodGlucoseBeforeBreakfast" id="bloodGlucoseBeforeBreakfast" placeholder="早餐前两小时血糖（mmol/l）" required="true" value="${bg.bloodGlucoseBeforeBreakfast }">
    </div>
    <div data-role="fieldcontain">
    <label for="bloodGlucoseAfterBreakfast">早餐后：</label>
    <input type="text" name="bloodGlucoseAfterBreakfast" id="bloodGlucoseAfterBreakfast" placeholder="早餐后两小时血糖（mmol/l）" required="true" value="${bg.bloodGlucoseAfterBreakfast }">
     </div>
    <div data-role="fieldcontain">
    <label for="bloodGlucoseBeforeLunch">午餐前：</label>
    <input type="text" name="bloodGlucoseBeforeLunch" id="bloodGlucoseBeforeLunch" placeholder="午餐前两小时血糖（mmol/l）" required="true" value="${bg.bloodGlucoseBeforeLunch }">
    </div>
    <div data-role="fieldcontain">
    <label for="bloodGlucoseAfterLunch">午餐后：</label>
    <input type="text" name="bloodGlucoseAfterLunch" id="bloodGlucoseAfterLunch" placeholder="午餐后两小时血糖（mmol/l）" required="true" value="${bg.bloodGlucoseAfterLunch }">
     </div>
    <div data-role="fieldcontain">
    <label for="bloodGlucoseBeforeDinner">晚餐前：</label>
    <input type="text" name="bloodGlucoseBeforeDinner" id="bloodGlucoseBeforeDinner" placeholder="晚餐前两小时血糖（mmol/l）" required="true" value="${bg.bloodGlucoseBeforeDinner }">
    </div>
    <div data-role="fieldcontain">
    <label for="bloodGlucoseAfterDinner">晚餐后：</label>
    <input type="text" name="bloodGlucoseAfterDinner" id="bloodGlucoseAfterDinner" placeholder="晚餐后两小时血糖（mmol/l）" required="true" value="${bg.bloodGlucoseAfterDinner }">
     </div>
      <div data-role="fieldcontain">
    <label for="bloodGlucoseBeforeSleep">睡前：</label>
    <input type="text" name="bloodGlucoseBeforeSleep" id="bloodGlucoseBeforeSleep" placeholder="睡前血糖（mmol/l）" required="true" value="${bg.bloodGlucoseBeforeSleep }">
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
	var bloodGlucoseBeforeBreakfast = $('#bloodGlucoseBeforeBreakfast').val();
	var bloodGlucoseAfterBreakfast = $('#bloodGlucoseAfterBreakfast').val();
	var bloodGlucoseBeforeLunch = $('#bloodGlucoseBeforeLunch').val();
	var bloodGlucoseAfterLunch = $('#bloodGlucoseAfterLunch').val();
	var bloodGlucoseBeforeDinner = $('#bloodGlucoseBeforeDinner').val();
	var bloodGlucoseAfterDinner = $('#bloodGlucoseAfterDinner').val();
	var bloodGlucoseBeforeSleep = $('#bloodGlucoseBeforeSleep').val();
	
	$.post("saveBloodGlucose",{pId:pId,bloodGlucoseBeforeBreakfast:bloodGlucoseBeforeBreakfast,bloodGlucoseAfterBreakfast:bloodGlucoseAfterBreakfast,
		bloodGlucoseBeforeLunch:bloodGlucoseBeforeLunch,bloodGlucoseAfterLunch:bloodGlucoseAfterLunch,bloodGlucoseBeforeDinner:bloodGlucoseBeforeDinner,
		bloodGlucoseAfterDinner:bloodGlucoseAfterDinner,bloodGlucoseBeforeSleep:bloodGlucoseBeforeSleep},function(text){
			if(text=="1"){
				alert("保存成功！");
				window.location.href="../user/user_index";
			}else{
				alert("保存失败！")
			}
		}); 
	
}
</script>
</html>
