<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>饮食记录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>饮食记录</h1>
		</div>

		<div data-role="content">
		<c:forEach var="diet" items="${dietList}" varStatus="s">
		<h3 style="text-align:center;">${diet.type }&nbsp;&nbsp;&nbsp;总能量：${diet.energy}(kal)</h3>
			<div class="ui-grid-d">
				<div class="ui-block-a" style="text-align:center;">
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;text-align:center;">食物</div>
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;">能量(kal)</div>
					</div>
				</div>
				<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;">蛋白质(g)</div>
				<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;">脂肪(g)</div>
				<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;">碳水化和物(g)</div>
				<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;">纤维素(mg)</div>
			</div>
				<c:forEach var="mainfood" items="${diet.mainfood}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="text-align:center;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;">${mainfood.name }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;">${mainfood.energy }</div>
							</div>
						</div>
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;">${mainfood.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;">${mainfood.fat }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;">${mainfood.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;">${mainfood.cellulose }</div>
					</div>
				</c:forEach>
				<c:forEach var="meat" items="${diet.meat}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="text-align:center;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;">${meat.name }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;">${meat.energy }</div>
							</div>
						</div>
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;">${meat.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;">${meat.fat }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;">${meat.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;">${meat.cellulose }</div>
					</div>
				</c:forEach>
				<c:forEach var="vegetables" items="${diet.vegetables}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="text-align:center;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;">${vegetables.name }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;">${vegetables.energy }</div>
							</div>
						</div>
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;">${vegetables.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;">${vegetables.fat }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;">${vegetables.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;">${vegetables.cellulose }</div>
					</div>
				</c:forEach>
				<c:forEach var="drink" items="${diet.drink}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="text-align:center;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;">${drink.name }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;">${drink.energy }</div>
							</div>
						</div>
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;">${drink.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;">${drink.fat }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;">${drink.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;">${drink.cellulose }</div>
					</div>
				</c:forEach>
				<c:forEach var="nut" items="${diet.nut}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="text-align:center;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;">${nut.name }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;">${nut.energy }</div>
							</div>
						</div>
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;">${nut.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;">${nut.fat }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;">${nut.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;">${nut.cellulose }</div>
					</div>
				</c:forEach>
				<c:forEach var="fruits" items="${diet.fruits}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="text-align:center;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;">${fruits.name }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;">${fruits.energy }</div>
							</div>
						</div>
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;">${fruits.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;">${fruits.fat }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;">${fruits.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;">${fruits.cellulose }</div>
					</div>
				</c:forEach>
				<div data-role="fieldcontain">
				<p>备注：${diet.remarks }</p>
			</div>
			</c:forEach>
			<div data-role="fieldcontain">
				<p>医生建议：${advice.content }</p>
			</div>
		</div>
	</div>
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
</script>
</html>
