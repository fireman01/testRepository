<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bindUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/weui.min.css">
	<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/example.css">

  </head>
  
  <body>
  <div class="page">
    <div class="hd">
        <h1 class="page_title">角色定位</h1>
    </div>
     <div class="button_sp_area">
            <a href="javascript:;" class="weui_btn weui_btn_plain_default">医生</a>
            <a href="javascript:;" class="weui_btn weui_btn_plain_primary">患者</a>
        </div>
    </div>
  </body>
</html>
