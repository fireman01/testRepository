<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
	String path = request.getContextPath();
	String pId = session.getAttribute("pId").toString();
%>
<html>
<head>

<title>个人饮食录入</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
		<a href="" data-role="button" onclick="window.location.href='../user/user_index'">主页</a>
			<h1>饮食录入</h1>
		</div>
		<div data-role="content">
			<div data-role="fieldcontain">
				<p style="text-align:center;">目标能量(kal)：<span id="targetenergy"></span></p>
				<p style="text-align:center;">总能量(kal)：<span id="sumenergy">0</span></p>
			</div>
			<div data-role="fieldcontain">
				<label for="diettype">餐饮类型：</label> 
				<select name="diettype" id="diettype" required="true" onchange="setTargetEnergy()">
				    <c:forEach var="diettype" items="${typeList}" varStatus="s">
					    <option value="${diettype.value }">${diettype.name }</option>
					 </c:forEach>
				</select>
			</div>
			<div data-role="collapsible">
				<h1>主食</h1>
				<div id="mainfood">
				<div data-role="fieldcontain" name="mainfoodtype" id="mainfoodtype1">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('mainfood','1')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="mainfood" items="${mainfoodList}" varStatus="s">
						  <option value="${mainfood.id }" energy="${mainfood.energy }" protein="${mainfood.protein }" fat="${mainfood.fat }" carbohydrate="${mainfood.carbohydrate }" cellulose="${mainfood.cellulose }">${mainfood.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum1" >
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'mainfood','1')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				
				
				<div data-role="fieldcontain" name="mainfoodtype" id="mainfoodtype2" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('mainfood','2')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="mainfood" items="${mainfoodList}" varStatus="s">
						  <option value="${mainfood.id }" energy="${mainfood.energy }" protein="${mainfood.protein }" fat="${mainfood.fat }" carbohydrate="${mainfood.carbohydrate }" cellulose="${mainfood.cellulose }">${mainfood.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum2" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'mainfood','2')"
						required="true" value="200" min="0" max="1000">
				</div>
				<div data-role="fieldcontain" name="mainfoodtype" id="mainfoodtype3" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('mainfood','3')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="mainfood" items="${mainfoodList}" varStatus="s">
						  <option value="${mainfood.id }" energy="${mainfood.energy }" protein="${mainfood.protein }" fat="${mainfood.fat }" carbohydrate="${mainfood.carbohydrate }" cellulose="${mainfood.cellulose }">${mainfood.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum3" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'mainfood','3')"
						required="true" value="200" min="0" max="1000">
				</div>
				<div data-role="fieldcontain" name="mainfoodtype" id="mainfoodtype4" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('mainfood','4')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="mainfood" items="${mainfoodList}" varStatus="s">
						  <option value="${mainfood.id }" energy="${mainfood.energy }" protein="${mainfood.protein }" fat="${mainfood.fat }" carbohydrate="${mainfood.carbohydrate }" cellulose="${mainfood.cellulose }">${mainfood.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum4" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'mainfood','4')"
						required="true" value="200" min="0" max="1000">
				</div>
				<div data-role="fieldcontain" name="mainfoodtype" id="mainfoodtype5" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('mainfood',5')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="mainfood" items="${mainfoodList}" varStatus="s">
						  <option value="${mainfood.id }" energy="${mainfood.energy }" protein="${mainfood.protein }" fat="${mainfood.fat }" carbohydrate="${mainfood.carbohydrate }" cellulose="${mainfood.cellulose }">${mainfood.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnum5" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'mainfood','5')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				</div>
				 <div data-role="fieldcontain">
			     <button onclick="addfood('mainfood');">新增</button>
			     <button onclick="removefood('mainfood');">移除</button>
			   </div> 
			</div>
			<div data-role="collapsible">
				<h1>肉类</h1>
				<div id="meat">
				<div data-role="fieldcontain" name="meattype" id="meattype1">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('meat','1')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						   <c:forEach var="meat" items="${meatList}" varStatus="s">
						  <option value="${meat.id }" energy="${meat.energy }" protein="${meat.protein }" fat="${meat.fat }" carbohydrate="${meat.carbohydrate }" cellulose="${meat.cellulose }">${meat.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="meatnum"  id="meatnum1">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'meat','1')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				
				<div data-role="fieldcontain" name="meattype" id="meattype2" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('meat','2')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						   <c:forEach var="meat" items="${meatList}" varStatus="s">
						  <option value="${meat.id }" energy="${meat.energy }" protein="${meat.protein }" fat="${meat.fat }" carbohydrate="${meat.carbohydrate }" cellulose="${meat.cellulose }">${meat.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="meatnum"  id="meatnum2" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'meat','2')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="meattype" id="meattype3" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('meat','3')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						   <c:forEach var="meat" items="${meatList}" varStatus="s">
						  <option value="${meat.id }" energy="${meat.energy }" protein="${meat.protein }" fat="${meat.fat }" carbohydrate="${meat.carbohydrate }" cellulose="${meat.cellulose }">${meat.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="meatnum"  id="meatnum3" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'meat','3')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				
				<div data-role="fieldcontain" name="meattype" id="meattype4" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('meat','4')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						   <c:forEach var="meat" items="${meatList}" varStatus="s">
						  <option value="${meat.id }" energy="${meat.energy }" protein="${meat.protein }" fat="${meat.fat }" carbohydrate="${meat.carbohydrate }" cellulose="${meat.cellulose }">${meat.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="meatnum"  id="meatnum4" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'meat','4')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="meattype" id="meattype5" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('meat','5')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						   <c:forEach var="meat" items="${meatList}" varStatus="s">
						  <option value="${meat.id }" energy="${meat.energy }" protein="${meat.protein }" fat="${meat.fat }" carbohydrate="${meat.carbohydrate }" cellulose="${meat.cellulose }">${meat.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="meatnum"  id="meatnum5" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'meat','5')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain">
			     <button onclick="addfood('meat');">新增</button>
			     <button onclick="removefood('meat');">移除</button>
			   </div>
				</div>
			</div>
			<div data-role="collapsible">
				<h1>蔬菜</h1>
				<div id="vegetables">
				<div data-role="fieldcontain" name="vegetablestype" id="vegetablestype1">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('vegetables','1')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="vegetables" items="${vegetablesList}" varStatus="s">
						  <option value="${vegetables.id }" energy="${vegetables.energy }" protein="${vegetables.protein }" fat="${vegetables.fat }" carbohydrate="${vegetables.carbohydrate }" cellulose="${vegetables.cellulose }">${vegetables.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnum1">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'vegetables','1')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="vegetablestype" id="vegetablestype2" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('vegetables','2')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="vegetables" items="${vegetablesList}" varStatus="s">
						  <option value="${vegetables.id }" energy="${vegetables.energy }" protein="${vegetables.protein }" fat="${vegetables.fat }" carbohydrate="${vegetables.carbohydrate }" cellulose="${vegetables.cellulose }">${vegetables.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnum2" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'vegetables','2')"
						required="true" value="200" min="0" max="1000">
				</div>
				
					<div data-role="fieldcontain" name="vegetablestype" id="vegetablestype3" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('vegetables','3')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="vegetables" items="${vegetablesList}" varStatus="s">
						  <option value="${vegetables.id }" energy="${vegetables.energy }" protein="${vegetables.protein }" fat="${vegetables.fat }" carbohydrate="${vegetables.carbohydrate }" cellulose="${vegetables.cellulose }">${vegetables.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnum3" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'vegetables','3')"
						required="true" value="200" min="0" max="1000">
				</div>
					<div data-role="fieldcontain" name="vegetablestype" id="vegetablestype4" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('vegetables','4')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="vegetables" items="${vegetablesList}" varStatus="s">
						  <option value="${vegetables.id }" energy="${vegetables.energy }" protein="${vegetables.protein }" fat="${vegetables.fat }" carbohydrate="${vegetables.carbohydrate }" cellulose="${vegetables.cellulose }">${vegetables.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnum4" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'vegetables','4')"
						required="true" value="200" min="0" max="1000">
				</div>
					<div data-role="fieldcontain" name="vegetablestype" id="vegetablestype5" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('vegetables','5')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="vegetables" items="${vegetablesList}" varStatus="s">
						  <option value="${vegetables.id }" energy="${vegetables.energy }" protein="${vegetables.protein }" fat="${vegetables.fat }" carbohydrate="${vegetables.carbohydrate }" cellulose="${vegetables.cellulose }">${vegetables.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="vegetablesnum" id="vegetablesnum5" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'vegetables','5')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain">
			     <button onclick="addfood('vegetables');">新增</button>
			     <button onclick="removefood('vegetables');">移除</button>
			   </div>
				</div>
			</div>
			<div data-role="collapsible">
				<h1>饮品</h1>
				<div id="drink">
				<div data-role="fieldcontain" name="drinktype" id="drinktype1">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('drink','1')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="drink" items="${drinkList}" varStatus="s">
						  <option value="${drink.id }" energy="${drink.energy }" protein="${drink.protein }" fat="${drink.fat }" carbohydrate="${drink.carbohydrate }" cellulose="${drink.cellulose }">${drink.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="dirnknum" id="drinknum1">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'drink','1')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="drinktype" id="drinktype2" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('drink','2')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="drink" items="${drinkList}" varStatus="s">
						  <option value="${drink.id }" energy="${drink.energy }" protein="${drink.protein }" fat="${drink.fat }" carbohydrate="${drink.carbohydrate }" cellulose="${drink.cellulose }">${drink.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="dirnknum" id="drinknum2" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'drink','2')"
						required="true" value="200" min="0" max="1000">
				</div>
				
								<div data-role="fieldcontain" name="drinktype" id="drinktype3" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('drink','3')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="drink" items="${drinkList}" varStatus="s">
						  <option value="${drink.id }" energy="${drink.energy }" protein="${drink.protein }" fat="${drink.fat }" carbohydrate="${drink.carbohydrate }" cellulose="${drink.cellulose }">${drink.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="dirnknum" id="drinknum3" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'drink','3')"
						required="true" value="200" min="0" max="1000">
				</div>
				
								<div data-role="fieldcontain" name="drinktype" id="drinktype4" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('drink','4')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="drink" items="${drinkList}" varStatus="s">
						  <option value="${drink.id }" energy="${drink.energy }" protein="${drink.protein }" fat="${drink.fat }" carbohydrate="${drink.carbohydrate }" cellulose="${drink.cellulose }">${drink.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="dirnknum" id="drinknum4" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'drink','4')"
						required="true" value="200" min="0" max="1000">
				</div>
				
								<div data-role="fieldcontain" name="drinktype" id="drinktype5" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype" onchange="typechange('drink','5')"
						required="true">
						<option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="drink" items="${drinkList}" varStatus="s">
						  <option value="${drink.id }" energy="${drink.energy }" protein="${drink.protein }" fat="${drink.fat }" carbohydrate="${drink.carbohydrate }" cellulose="${drink.cellulose }">${drink.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="dirnknum" id="drinknum5" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'drink','5')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain">
			     <button onclick="addfood('drink');">新增</button>
			     <button onclick="removefood('drink');">移除</button>
			   </div>
				</div>
			</div>
			<div data-role="collapsible">
				<h1>坚果</h1>
				<div id="nut">
				<div data-role="fieldcontain" name="nuttype" id="nuttype1">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('nut','1')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="nut" items="${nutList}" varStatus="s">
						  <option value="${nut.id }" energy="${nut.energy }" protein="${nut.protein }" fat="${nut.fat }" carbohydrate="${nut.carbohydrate }" cellulose="${nut.cellulose }">${nut.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="nutnum" id="nutnum1">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'nut','1')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="nuttype" id="nuttype2" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('nut','2')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="nut" items="${nutList}" varStatus="s">
						  <option value="${nut.id }" energy="${nut.energy }" protein="${nut.protein }" fat="${nut.fat }" carbohydrate="${nut.carbohydrate }" cellulose="${nut.cellulose }">${nut.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="nutnum" id="nutnum2" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'nut','2')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="nuttype" id="nuttype3" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('nut','3')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="nut" items="${nutList}" varStatus="s">
						  <option value="${nut.id }" energy="${nut.energy }" protein="${nut.protein }" fat="${nut.fat }" carbohydrate="${nut.carbohydrate }" cellulose="${nut.cellulose }">${nut.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="nutnum" id="nutnum3" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'nut','3')"
						required="true" value="200" min="0" max="1000">
				</div>
				<div data-role="fieldcontain" name="nuttype" id="nuttype4" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('nut','4')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="nut" items="${nutList}" varStatus="s">
						  <option value="${nut.id }" energy="${nut.energy }" protein="${nut.protein }" fat="${nut.fat }" carbohydrate="${nut.carbohydrate }" cellulose="${nut.cellulose }">${nut.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="nutnum" id="nutnum4" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'nut','4')"
						required="true" value="200" min="0" max="1000">
				</div>
				<div data-role="fieldcontain" name="nuttype" id="nuttype5" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('nut','5')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						  <c:forEach var="nut" items="${nutList}" varStatus="s">
						  <option value="${nut.id }" energy="${nut.energy }" protein="${nut.protein }" fat="${nut.fat }" carbohydrate="${nut.carbohydrate }" cellulose="${nut.cellulose }">${nut.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="nutnum" id="nutnum5" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number" onchange="numberchange(this.value,'nut','5')"
						required="true" value="200" min="0" max="1000">
				</div>
				<div data-role="fieldcontain">
			     <button onclick="addfood('nut');">新增</button>
			     <button onclick="removefood('nut');">移除</button>
			   </div>
				</div>
			</div>
			<div data-role="collapsible">
				<h1>水果</h1>
				<div id="fruits">
				<div data-role="fieldcontain" name="fruitstype" id="fruitstype1">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('fruits','1')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="fruits" items="${fruitsList}" varStatus="s">
						  <option value="${fruits.id }" energy="${fruits.energy }" protein="${fruits.protein }" fat="${fruits.fat }" carbohydrate="${fruits.carbohydrate }" cellulose="${fruits.cellulose }">${fruits.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum1">
					<label for="number">食量：</label> <input type="range"
						name="number"  onchange="numberchange(this.value,'fruits','1')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="fruitstype" id="fruitstype2" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('fruits','2')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="fruits" items="${fruitsList}" varStatus="s">
						  <option value="${fruits.id }" energy="${fruits.energy }" protein="${fruits.protein }" fat="${fruits.fat }" carbohydrate="${fruits.carbohydrate }" cellulose="${fruits.cellulose }">${fruits.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum2" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number"  onchange="numberchange(this.value,'fruits','2')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="fruitstype" id="fruitstype3" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('fruits','3')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="fruits" items="${fruitsList}" varStatus="s">
						  <option value="${fruits.id }" energy="${fruits.energy }" protein="${fruits.protein }" fat="${fruits.fat }" carbohydrate="${fruits.carbohydrate }" cellulose="${fruits.cellulose }">${fruits.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum3" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number"  onchange="numberchange(this.value,'fruits','3')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="fruitstype" id="fruitstype4" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('fruits','4')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="fruits" items="${fruitsList}" varStatus="s">
						  <option value="${fruits.id }" energy="${fruits.energy }" protein="${fruits.protein }" fat="${fruits.fat }" carbohydrate="${fruits.carbohydrate }" cellulose="${fruits.cellulose }">${fruits.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum4" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number"  onchange="numberchange(this.value,'fruits','4')"
						required="true" value="200" min="0" max="1000">
				</div>
				
				<div data-role="fieldcontain" name="fruitstype" id="fruitstype5" style="display:none;">
					<label for="diettype">种类：</label> <select name="diettype"  onchange="typechange('fruits','5')"
						 required="true">
						 <option value="0" energy="0" protein="0" fat="0" carbohydrate="0" cellulose="0">请选择</option>
						 <c:forEach var="fruits" items="${fruitsList}" varStatus="s">
						  <option value="${fruits.id }" energy="${fruits.energy }" protein="${fruits.protein }" fat="${fruits.fat }" carbohydrate="${fruits.carbohydrate }" cellulose="${fruits.cellulose }">${fruits.name }</option>
						   </c:forEach>
					</select>
				</div>
				<div data-role="fieldcontain" name="fruitsnum" id="fruitsnum5" style="display:none;">
					<label for="number">食量：</label> <input type="range"
						name="number"  onchange="numberchange(this.value,'fruits','5')"
						required="true" value="200" min="0" max="1000">
				</div>
				<div data-role="fieldcontain">
			     <button onclick="addfood('fruits');">新增</button>
			     <button onclick="removefood('fruits');">移除</button>
			   </div>
				</div>
			</div>
			<div data-role="fieldcontain">
				<label for="remarks">备注：</label>
				<textarea name="remarks" id="remarks"></textarea>
			</div>
		</div>
		<div data-role="content" id="detailcontent">
		
			<div class="ui-grid-d" id="detailtable">
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
		</div>
		<div data-role="fieldcontain">
     <input type="button" value="提交" onclick="onSubmit();">
   </div>
		<div data-role="footer">
			<h1>&nbsp;</h1>
		</div>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
var mainfoodCount = 1;
var meatCount = 1;
var vegetablesCount = 1;
var drinkCount = 1;
var nutCount = 1;
var fruitsCount = 1;
var targetsumenergy = parseInt(${energy});
	var pId = "<%=pId%>";
	function typechange(id,idnum){
		var option = $('#'+id+"type"+idnum).find("select option:selected");
		var num = parseInt($('#'+id+"num"+idnum).find("input").val());
		var html ='<div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge ridge;">'
		+option.text()+'</div><div class="ui-block-b"style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">'
		+	'<div class="ui-grid-a"><div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge none none;" name="energyinfo">'
		+parseInt(num*parseFloat(option[0].attributes.energy.value))
		+'</div><div class="ui-block-b" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none none none none;">'
		+parseInt(num*parseFloat(option[0].attributes.fat.value))+'</div></div></div>'
		+'<div class="ui-block-c" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">'
		+parseInt(num*parseFloat(option[0].attributes.protein.value))
		+'</div><div class="ui-block-d" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">'
		+parseInt(num*parseFloat(option[0].attributes.carbohydrate.value))
		+'</div><div class="ui-block-e" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">'
		+parseInt(num*parseFloat(option[0].attributes.cellulose.value))+'</div>';
			if($('#detail'+id+idnum).html()==undefined){
			$('#detailtable').after("<div class='ui-grid-d' id='detail"+id+idnum+"'></div>");
			$('#detail'+id+idnum).append(html);
		}else{
			if(option.text()=="请选择"){
				$('#detail'+id+idnum).remove();
			}else{
				$('#detail'+id+idnum).html(html);
			}
		}
			updateEnergy();
	}
	function numberchange(num,id,idnum){
		var sumenergy = parseInt($('#sumenergy').text());
		var option = $('#'+id+"type"+idnum).find("select option:selected");
		if(option.val()!=0){
			var html ='<div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge ridge;">'
				+option.text()+'</div><div class="ui-block-b"style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">'
				+	'<div class="ui-grid-a"><div class="ui-block-a" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge none none;" name="energyinfo">'
				+parseInt(num*parseFloat(option[0].attributes.energy.value))
				+'</div><div class="ui-block-b" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none none none none;">'
				+parseInt(num*parseFloat(option[0].attributes.fat.value))+'</div></div></div>'
				+'<div class="ui-block-c" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">'
				+parseInt(num*parseFloat(option[0].attributes.protein.value))
				+'</div><div class="ui-block-d" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">'
				+parseInt(num*parseFloat(option[0].attributes.carbohydrate.value))
				+'</div><div class="ui-block-e" style="border: 1px solid black;text-align:center;font-size:10px;border-style:none ridge ridge none;">'
				+parseInt(num*parseFloat(option[0].attributes.cellulose.value))+'</div>';
			$('#detail'+id+idnum).html(html);
		}
		updateEnergy();
	}
	function removefood(id){
		var divId = $('#'+id);
		var len = countChange(id,false);
		if(len>0){
			$('#'+id+'type'+len).hide();
			$('#'+id+'num'+len).hide();
			$('#detail'+id+len).remove();
			updateEnergy();
		}else{
			alert("不可移除!");
			countChange(id,true);
		}
		
	}
	function addfood(id){
		var divId = $('#'+id);
		var len = countChange(id,true);
		if(len<6){
			$('#'+id+'type'+len).show();
			$('#'+id+'num'+len).show();
			var detailDiv = $('#detail'+id+(len-1)).clone(false);
			detailDiv.attr("id","detail"+id+len);
			$('#detail'+id+(len-1)).after(detailDiv);
			updateEnergy();
		}else{
			alert("已达上限！");
			countChange(id,false);
		}
		
	}
	
	function countChange(id,isAdd){
		if(isAdd){
			if("mainfood"==id){
				mainfoodCount++;
				return mainfoodCount;
			}else if("meat"==id){
				meatCount++;
				return meatCount;
			}else if("vegetables"==id){
				vegetablesCount++;
				return vegetablesCount;
			}else if("drink"==id){
				drinkCount++;
				return drinkCount;
			}else if("nut"==id){
				nutCount++;
				return nutCount;
			}else if("fruits"==id){
				fruitsCount++;
				return fruitsCount;
			}
		}else{
			if("mainfood"==id){
				mainfoodCount--;
				return mainfoodCount;
			}else if("meat"==id){
				meatCount--;
				return meatCount;
			}else if("vegetables"==id){
				vegetablesCount--;
				return vegetablesCount;
			}else if("drink"==id){
				drinkCount--;
				return drinkCount;
			}else if("nut"==id){
				nutCount--;
				return nutCount;
			}else if("fruits"==id){
				fruitsCount--;
				return fruitsCount;
			}
		}
	}
	
	function onSubmit(){
		var sumenergy = $('#sumenergy').text();
		var diettype = $('#diettype').find("option:selected").val();
		var mainfoodJson = parseFoodList("mainfood");
		var meatJson = parseFoodList("meat");
		var vegetablesJson = parseFoodList("vegetables");
		var drinkJson = parseFoodList("drink");
		var nutJson = parseFoodList("nut");
		var fruitsJson = parseFoodList("fruits");
		var remarks = $('#remarks').val();
		 $.post("../diet/saveDiet",{energy:sumenergy,type:diettype,pId:pId,mainfood:mainfoodJson.mainfood,
			 mainfoodNum:mainfoodJson.mainfoodNum,meat:meatJson.meat,meatNum:meatJson.meatNum,
			 vegetables:vegetablesJson.vegetables,vegetablesNum:vegetablesJson.vegetablesNum,
			 drink:drinkJson.drink,drinkNum:drinkJson.drinkNum,nut:nutJson.nut,nutNum:nutJson.nutNum,
			 fruits:fruitsJson.fruits,fruitsNum:fruitsJson.fruitsNum,remarks:remarks},function(text){
				if(text=="1"){
					alert("保存成功！");
					window.location.href="../user/user_index";
				}else{
					alert("保存失败！")
				}
			}); 
	}
	
	function parseFoodList(id){
		var len = $('#'+id).find('div').filter("[name='"+id+"type']").length;;
		var nums = $('#'+id).find('div').filter("[name='"+id+"num']");
		var typevalues = "";
		var numvalues = "";
		for(var i=1; i<len; i++){
			var option = $('#'+id+"type"+i).find("select option:selected");
			typevalues+=option.val()+",";
		}
		typevalues += $('#'+id+"type"+len).find("select option:selected").val();
		for(var i=1; i<len; i++){
			numvalues+=$('#'+id+"num"+i).find("input").val()+",";
		}
		numvalues += $('#'+id+"num"+len).find("input").val();
		return eval("({'"+id+"':'"+typevalues+"','"+id+"Num"+"':'"+numvalues+"'})");
	}
	
	function updateEnergy(){
		var divs = $('#detailcontent').find('div .ui-block-a').filter("[name='energyinfo']");
		var energy = 0;
		for(var i=0; i<divs.length; i++){
			energy += parseInt(divs[i].innerText);
		}
		$('#sumenergy').text(energy);
		if(parseInt($('#targetenergy').text())<energy){
			$('#sumenergy').css("color","red");
		}
	}
	function setTargetEnergy(){
		var type = $('#diettype').val();
		var num = $('#diettype').find("option").length-3;
		var tmpEnergy = 0;
		if(type=="1"){
			tmpEnergy = parseInt(targetsumenergy*0.1+targetsumenergy*(3-num)/15);
		}else if(type=="2"||type=="3"){
			tmpEnergy = parseInt(targetsumenergy*0.3+targetsumenergy*(3-num)/60);
		}else if(type=="4"||type=="5"||type=="6"){
			tmpEnergy = parseInt(targetsumenergy*0.1);
		}
		$('#targetenergy').text(tmpEnergy);	
	}
	setTargetEnergy();

</script>
</html>
