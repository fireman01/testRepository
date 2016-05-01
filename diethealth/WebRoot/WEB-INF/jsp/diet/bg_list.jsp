<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String pId = session.getAttribute("pId").toString();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>血糖记录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
	<div data-role="page">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>血糖记录</h1>
		</div>
		<div data-role="content">
			<div class="ui-grid-b">
				<div class="ui-block-a" style="text-align:center;">偏高</div>
				<div class="ui-block-b" style="text-align:center;">正常</div>
				<div class="ui-block-c" style="text-align:center;">偏低</div>
				<div class="ui-block-a" style="border: 1px solid black;border-style:none ridge none none;text-align:center;" id="heightTime"></div>
				<div class="ui-block-b" style="border: 1px solid black;border-style:none ridge none none;text-align:center;" id="normolTime"></div>
				<div class="ui-block-c" style="text-align:center;" id="lowTime"></div>
				<div class="ui-block-a" style="text-align:center;">次</div>
				<div class="ui-block-b" style="text-align:center;">次</div>
				<div class="ui-block-c" style="text-align:center;">次</div>
			</div>
			<div data-role="fieldcontain">
				<span>餐前标准：4.4-6.1mmol/L</span>
			</div>
			<span>餐后标准：4.8-8.8mmol/L</span>
		</div>
		<div data-role="content">
			<div class="ui-grid-d" id="bggrid">
				<div class="ui-block-a"
					style="border: 1px solid black;border-style:ridge ridge ridge ridge;text-align:center;">
					日期
					<div class="ui-grid-a">
						<div class="ui-block-a">&nbsp;</div>
						<div class="ui-block-b">&nbsp;</div>
					</div>
				</div>
				<div class="ui-block-b"
					style="border: 1px solid black; border-style:ridge ridge ridge none;text-align:center;">
					早餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:ridge ridge none none;text-align:center;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:ridge none none none; text-align:center;">后</div>
					</div>
				</div>
				<div class="ui-block-c"
					style="border: 1px solid black;border-style:ridge ridge ridge none;text-align:center;">
					午餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:ridge ridge none none;text-align:center;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:ridge none none none; text-align:center;">后</div>
					</div>
				</div>
				<div class="ui-block-d"
					style="border: 1px solid black;border-style:ridge ridge ridge none;text-align:center;">
					晚餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:ridge ridge none none;text-align:center;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:ridge none none none; text-align:center;">后</div>
					</div>
				</div>
				<div class="ui-block-e"
					style="border: 1px solid black;border-style:ridge ridge ridge none;text-align:center;">
					睡前
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:none none none none;text-align:center;">&nbsp;</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:none none none none; text-align:center;">&nbsp;</div>
					</div>
				</div>

				<c:forEach var="bg" items="${bgList}" varStatus="s">
					<div class="ui-block-a"
						style="border: 1px solid black;border-style:none ridge ridge ridge;text-align:center;">
						${bg.date }</div>
					<div class="ui-block-b"
						style="border: 1px solid black; border-style:none ridge ridge none;text-align:center;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black;border-style:none ridge none none;text-align:center;"
								name="before">${bg.bloodGlucoseBeforeBreakfast }</div>
							<div class="ui-block-b"
								style="border: 1px solid black;border-style:none none none none; text-align:center;"
								name="after">${bg.bloodGlucoseAfterBreakfast }</div>
						</div>
					</div>
					<div class="ui-block-c"
						style="border: 1px solid black;border-style:none ridge ridge none;text-align:center;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black;border-style:none ridge none none;text-align:center;"
								name="before">${bg.bloodGlucoseBeforeLunch }</div>
							<div class="ui-block-b"
								style="border: 1px solid black;border-style:none none none none; text-align:center;"
								name="after">${bg.bloodGlucoseAfterLunch }</div>
						</div>
					</div>
					<div class="ui-block-d"
						style="border: 1px solid black;border-style:none ridge ridge none;text-align:center;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black;border-style:none ridge none none;text-align:center;"
								name="before">${bg.bloodGlucoseBeforeDinner }</div>
							<div class="ui-block-b"
								style="border: 1px solid black;border-style:none none none none; text-align:center;"
								name="after">${bg.bloodGlucoseAfterDinner }</div>
						</div>
					</div>
					<div class="ui-block-e"
						style="border: 1px solid black;border-style:none ridge ridge none;text-align:center;"
						name="before">${bg.bloodGlucoseBeforeSleep }</div>

				</c:forEach>
			</div>
		</div>
		<div data-role="footer">
			<h1>
				<a href="" data-role="button" onclick="pageChange(-1)">上一页</a>${curPage }/${totalPage }<a
					href="" data-role="button" onclick="pageChange(1)">下一页</a>
			</h1>
		</div>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
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
		window.location.href='bg_list?curPage='+curPage;
	}
}

function count(){
	var low = 0;
	var height = 0;
	var normol = 0;
	var divs = $('#bggrid').find('div').filter("[name='before']");
	for(var i=0; i<divs.length; i++){
		var value = parseFloat(divs[i].innerText);
		if(value<4.4){
			low++;
			divs[i].style.color = "red";
		}else if(value>6.1){
			divs[i].style.color = "red";
			height++;
		}else{
			normol++;
		}
	}
	divs = $('#bggrid').find('div').filter("[name='after']");
	for(var i=0; i<divs.length; i++){
		var value = parseFloat(divs[i].innerText);
		if(value<4.8){
			low++;
			divs[i].style.color = "red";
		}else if(value>8.8){
			divs[i].style.color = "red";
			height++;
		}else{
			normol++;
		}
	}
	$('#lowTime').text(low);
	$('#normolTime').text(normol);
	$('#heightTime').text(height);
}
count();
</script>
</html>
