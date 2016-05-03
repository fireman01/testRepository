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
				onclick="window.location.href='../user/doctor_index'">主页</a>
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
			
					<h3 style="text-align:center;">血糖记录</h3>
		<div class="ui-grid-d" id="bggrid">
				<div class="ui-block-a"
					style="border: 1px solid black;border-style:ridge ridge ridge ridge;text-align:center;font-size:10px;">
					日&nbsp;期
					<div class="ui-grid-a">
						<div class="ui-block-a">&nbsp;</div>
						<div class="ui-block-b">&nbsp;</div>
					</div>
				</div>
				<div class="ui-block-b"
					style="border: 1px solid black; border-style:ridge ridge ridge none;text-align:center;font-size:10px;">
					早餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:ridge ridge none none;text-align:center;font-size:10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:ridge none none none; text-align:center;font-size:10px;">后</div>
					</div>
				</div>
				<div class="ui-block-c"
					style="border: 1px solid black;border-style:ridge ridge ridge none;text-align:center;font-size:10px;">
					午餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:ridge ridge none none;text-align:center;font-size:10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:ridge none none none; text-align:center;font-size:10px;">后</div>
					</div>
				</div>
				<div class="ui-block-d"
					style="border: 1px solid black;border-style:ridge ridge ridge none;text-align:center;font-size:10px;">
					晚餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:ridge ridge none none;text-align:center;font-size:10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:ridge none none none; text-align:center;font-size:10px;">后</div>
					</div>
				</div>
				<div class="ui-block-e"
					style="border: 1px solid black;border-style:ridge ridge ridge none;text-align:center;font-size:10px;">
					睡前
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black;border-style:none none none none;text-align:center;font-size:10px;">&nbsp;</div>
						<div class="ui-block-b"
							style="border: 1px solid black;border-style:none none none none; text-align:center;font-size:10px;">&nbsp;</div>
					</div>
				</div>
					<div class="ui-block-a"
						style="border: 1px solid black;border-style:none ridge ridge ridge;text-align:center;font-size:10px;">
						${bg.date }</div>
					<div class="ui-block-b"
						style="border: 1px solid black; border-style:none ridge ridge none;text-align:center;font-size:10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black;border-style:none ridge none none;text-align:center;font-size:10px;"
								name="before">${bg.bloodGlucoseBeforeBreakfast }</div>
							<div class="ui-block-b"
								style="border: 1px solid black;border-style:none none none none; text-align:center;font-size:10px;"
								name="after">${bg.bloodGlucoseAfterBreakfast }</div>
						</div>
					</div>
					<div class="ui-block-c"
						style="border: 1px solid black;border-style:none ridge ridge none;text-align:center;font-size:10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black;border-style:none ridge none none;text-align:center;font-size:10px;"
								name="before">${bg.bloodGlucoseBeforeLunch }</div>
							<div class="ui-block-b"
								style="border: 1px solid black;border-style:none none none none; text-align:center;font-size:10px;"
								name="after">${bg.bloodGlucoseAfterLunch }</div>
						</div>
					</div>
					<div class="ui-block-d"
						style="border: 1px solid black;border-style:none ridge ridge none;text-align:center;font-size:10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black;border-style:none ridge none none;text-align:center;font-size:10px;"
								name="before">${bg.bloodGlucoseBeforeDinner }</div>
							<div class="ui-block-b"
								style="border: 1px solid black;border-style:none none none none; text-align:center;font-size:10px;"
								name="after">${bg.bloodGlucoseAfterDinner }</div>
						</div>
					</div>
					<div class="ui-block-e"
						style="border: 1px solid black;border-style:none ridge ridge none;text-align:center;font-size:10px;"
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
