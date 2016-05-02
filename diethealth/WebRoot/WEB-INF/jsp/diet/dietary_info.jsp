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
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=0;" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/doctor_index'">主页</a>
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
			
					<h3 style="text-align:center;">血糖记录</h3>
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
			</div>
			<div data-role="fieldcontain">
			<input type="hidden" value="${bg.p_id }" id="pId"> 
			<input type="hidden" value="${bg.date }" id="date"> 
				<label for="content">建议：</label>
				<textarea name="content" id="content">${advice.content }</textarea>
			</div>
				<div data-role="fieldcontain">
     <input type="button" value="提交" onclick="onSubmit();">
   </div>
		</div>

	</div>
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
function onSubmit(){
	var content = $('#content').val();
	var pId = $('#pId').val();
	var date = $('#date').val();
	 $.post("saveAdvice",{content:content,pId:pId,date:date},function(text){
			if(text=="1"){
				alert("保存成功！");
			}else{
				alert("保存失败！")
			}
		}); 
}

</script>
</html>
