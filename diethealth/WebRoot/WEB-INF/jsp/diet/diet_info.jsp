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
<meta content="width=device-width" name="viewport" /> 
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
				<div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:ridge ridge ridge ridge;">
					食物
				</div>
				<div class="ui-block-b"
					style="border: 1px solid black;text-align:center;font-size:10px;border-style:ridge ridge ridge none;">
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge none none;">能量</div>
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none none none none;">脂肪</div>
					</div>
					</div>
				<div class="ui-block-c"
					style="border: 1px solid black;text-align:center;font-size:10px;border-style:ridge ridge ridge none;">蛋白质</div>
				<div class="ui-block-d"
					style="border: 1px solid black;text-align:center;font-size:10px;border-style:ridge ridge ridge none;">碳化物</div>
				<div class="ui-block-e"
					style="border: 1px solid black;text-align:center;font-size:10px;border-style:ridge ridge ridge none;">纤维素</div>
			</div>
				<c:forEach var="mainfood" items="${diet.mainfood}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge ridge;">${mainfood.name }
							
						</div>
						
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge none none;">${mainfood.energy }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none none none none;">${mainfood.fat }</div>
							</div></div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${mainfood.protein }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${mainfood.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${mainfood.cellulose }</div>
					</div>
				</c:forEach>
				<c:forEach var="meat" items="${diet.meat}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge ridge;">${meat.name }
							
						</div>
						
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge none none;">${meat.energy }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none none none none;">${meat.fat }</div>
							</div></div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${meat.protein }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${meat.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${meat.cellulose }</div>
					</div>
				</c:forEach>
				
				<c:forEach var="vegetables" items="${diet.vegetables}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge ridge;">${vegetables.name }
						</div>
						
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge none none;">${vegetables.energy }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none none none none;">${vegetables.fat }</div>
							</div></div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${vegetables.protein }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${vegetables.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${vegetables.cellulose }</div>
					</div>
				</c:forEach>
			<c:forEach var="drink" items="${diet.drink}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge ridge;">${drink.name }
						</div>
						
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge none none;">${drink.energy }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none none none none;">${drink.fat }</div>
							</div></div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${drink.protein }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${drink.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${drink.cellulose }</div>
					</div>
				</c:forEach>
				
				<c:forEach var="nut" items="${diet.nut}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge ridge;">${nut.name }
						</div>
						
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge none none;">${nut.energy }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none none none none;">${nut.fat }</div>
							</div></div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${nut.protein }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${nut.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${nut.cellulose }</div>
					</div>
				</c:forEach>
					<c:forEach var="fruits" items="${diet.fruits}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge ridge;">${fruits.name }
						</div>
						
						<div class="ui-block-b"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">
							<div class="ui-grid-a">
								<div class="ui-block-a"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge none none;">${fruits.energy }</div>
								<div class="ui-block-b"
									style="border: 1px solid black;text-align:center;font-size:10px;border-style:none none none none;">${fruits.fat }</div>
							</div></div>
						<div class="ui-block-c"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${fruits.protein }</div>
						<div class="ui-block-d"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${fruits.carbohydrate }</div>
						<div class="ui-block-e"
							style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">${fruits.cellulose }</div>
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
