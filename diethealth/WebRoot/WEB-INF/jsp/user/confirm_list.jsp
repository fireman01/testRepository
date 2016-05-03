<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
String path = request.getContextPath();
%>
<html>
<head>

<title>待确诊列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
<div data-role="page" id="pageone">
  <div data-role="header">
   <a href="" data-role="button" onclick="window.location.href='doctor_index'">首页</a>
    <h1>待确诊列表</h1>
   <!--  <a href="#" data-role="button" onclick="window.location.href='doctor_add'">添加</a> -->
  </div>

  <div data-role="content">
    <ul data-role="listview" data-autodividers="false" data-inset="true" data-filter="true" data-filter-placeholder="搜索姓名 ">
     <c:forEach var="patient" items="${patientList}" varStatus="s">
    <li><a href="" onclick="stateChange('${patient.p_id }')">${patient.name }</a></li>
    </c:forEach>
  </ul>
  </div>

  <div data-role="footer">
    <h1><a href="" data-role="button" onclick="pageChange(-1)">上一页</a>${curPage }/${totalPage }<a href="" data-role="button" onclick="pageChange(1)">下一页</a></h1>
  </div>
</div> 
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
function pageChange(num){
	var curPage = ${curPage };
	var totalPage = ${totalPage};
	if(curPage+num<1){
		alert("当前页已经是第一页");
	}else if(curPage+num>totalPage){
		alert("当前页已经是最后一页");
	}else{
		curPage = curPage+num;
		window.location.href='confirm_list?curPage='+curPage;
	}
}
function stateChange(pId){
	var r=confirm("确认就诊？");
	if (r==true)
	  {
	    $.post("updatePatientState",{pId:pId,state:"2"},function(text){
		if(text=="1"){
			alert("更新成功！");
			window.location.href="confirm_list";
		}else{
			alert("更新失败！")
		}
	   }); 
	 }
}
</script>
</html>
