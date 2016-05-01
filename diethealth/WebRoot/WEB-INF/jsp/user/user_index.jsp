<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String name = session.getAttribute("name").toString();
String pId = session.getAttribute("pId").toString();
%>
<html>
<head>

<title>用户主页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
<div data-role="page" id="pageone">
  <div data-role="header">
    <h1>我的主页</h1>
  </div>
<div data-role="content">
<h1 style="text-align:center;"><%=name %>,您好！</h1>
</div>
  <div data-role="content">
    <div data-role="navbar">
      <ul>
        <li><a href="" data-icon="grid" onclick="window.location.href='../diet/diet_edit'">饮食录入</a></li>
        <li><a href="#" data-icon="info" onclick="window.location.href='../diet/diet_list'">饮食记录</a></li>
        <li><a href="#" data-icon="grid" onclick="window.location.href='../diet/bg_edit'">血糖录入</a></li>
        <li><a href="#" data-icon="grid" onclick="window.location.href='../diet/bg_list'">血糖记录</a></li>
        <li><a href="#" data-icon="grid" onclick="window.location.href='user_edit'">信息修改</a></li>
      </ul>
    </div>
  </div>

  <div data-role="footer">
    <h1>&nbsp;</h1>
  </div>
</div> 
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>

</script>
</html>
