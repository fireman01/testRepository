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
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
				<p style="text-align:center;">目标能量(kal)：100</p>
				<p style="text-align:center;">总能量(kal)：<span id="sumenergy">0</span></p>
			</div>
			<div data-role="fieldcontain">
				<label for="diettype">餐饮类型：</label> <select name="diettype"
					id="diettype" required="true">
					<option value="0">早餐</option>
					<option value="1">午餐</option>
					<option value="2">晚餐</option>
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
			<div class="ui-grid-d"  id="detailtable">
				<div class="ui-block-a"
					style="text-align:center;">
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
	var pId = "<%=pId%>";
	function typechange(id,idnum){
		var option = $('#'+id+"type"+idnum).find("select option:selected");
		var num = parseInt($('#'+id+"num"+idnum).find("input").val());
			var html = "<div class='ui-block-a' style='text-align:center;'><div class='ui-grid-a'><div class='ui-block-a' style='border: 1px solid black;text-align:center;'>"
			+option.text()+"</div><div class='ui-block-b' style='border: 1px solid black;text-align:center;' name='energyinfo'>"+parseInt(num*parseFloat(option[0].attributes.energy.value)/1000)+"</div></div></div>"
			+"<div class='ui-block-b' style='border: 1px solid black;text-align:center;'>"+parseInt(num*parseFloat(option[0].attributes.protein.value)/1000)+"</div>"
			+"<div class='ui-block-c' style='border: 1px solid black;text-align:center;'>"+parseInt(num*parseFloat(option[0].attributes.fat.value)/1000)+"</div>"
			+"<div class='ui-block-d' style='border: 1px solid black;text-align:center;'>"+parseInt(num*parseFloat(option[0].attributes.carbohydrate.value)/1000)+"</div>"
			+"<div class='ui-block-e' style='border: 1px solid black;text-align:center;'>"+parseInt(num*parseFloat(option[0].attributes.cellulose.value)/1000)+"</div>";
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
			var html = "<div class='ui-block-a' style='text-align:center;'><div class='ui-grid-a'><div class='ui-block-a' style='border: 1px solid black;text-align:center;'>"
				+option.text()+"</div><div class='ui-block-b' style='border: 1px solid black;text-align:center;' name='energyinfo'>"+parseInt(num*parseFloat(option[0].attributes.energy.value)/1000)+"</div></div></div>"
				+"<div class='ui-block-b' style='border: 1px solid black;text-align:center;'>"+parseInt(num*parseFloat(option[0].attributes.protein.value)/1000)+"</div>"
				+"<div class='ui-block-c' style='border: 1px solid black;text-align:center;'>"+parseInt(num*parseFloat(option[0].attributes.fat.value)/1000)+"</div>"
				+"<div class='ui-block-d' style='border: 1px solid black;text-align:center;'>"+parseInt(num*parseFloat(option[0].attributes.carbohydrate.value)/1000)+"</div>"
				+"<div class='ui-block-e' style='border: 1px solid black;text-align:center;'>"+parseInt(num*parseFloat(option[0].attributes.cellulose.value)/1000)+"</div>";
			$('#detail'+id+idnum).html(html);
		}
		updateEnergy();
	}
	function removefood(id){
		var divId = $('#'+id);
		var len = divId.find('div').filter("[name='"+id+"type']").length;
		if(len>1){
			$('#'+id+"type"+len).remove();
			$('#'+id+"num"+len).remove();
			var energy = parseInt($('#detail'+id+len).find('div').filter("[name='energyinfo']").text());
			var sumenergy = parseInt($('#sumenergy').text());
			sumenergy -= energy;
			$('#sumenergy').text(parseInt(sumenergy));
			$('#detail'+id+len).remove();
		}else{
			alert("不可移除");
		}
		
	}
	function addfood(id){
		var divId = $('#'+id);
		var len = parseInt(divId.find('div').filter("[name='"+id+"type']").length)+1;
		var chridrenDiv0 = divId.find('div').filter("[name='"+id+"type']").first().clone(true);
		var chridrenDiv1 = divId.find('div').filter("[name='"+id+"num']").first().clone(true);
		chridrenDiv0.attr("id",id+"type"+len);
		chridrenDiv0.find('select').attr("onchange","typechange(this,"+id+","+len+")");
		chridrenDiv1.attr("id",id+"num"+len);
		chridrenDiv1.find('input').attr("onchange","numberchange(this.value,"+id+","+len+")");
		divId.append(chridrenDiv0).append(chridrenDiv1);
		var detailDiv = $('#detail'+id+(len-1)).clone(false);
		detailDiv.attr("id","detail"+id+len);
		$('#detail'+id+(len-1)).after(detailDiv);
		updateEnergy();
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
		var divs = $('#detailcontent').find('div .ui-block-b').filter("[name='energyinfo']");
		var energy = 0;
		for(var i=0; i<divs.length; i++){
			energy += parseInt(divs[i].innerText);
		}
		$('#sumenergy').text(energy);
	}
	
</script>
</html>
