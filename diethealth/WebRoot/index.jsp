<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%//response.sendRedirect(request.getContextPath() + "/form/register"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
var path = "<%=path %>";
</script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/weui.min.css">
	<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/example.css">
	<script type="text/javascript" src="<%=path %>/js/zepto.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/diet.js"></script>
</head>

<body>
<!--  <div class="hd"> -->
        <h1 class="page_title">饮食录入</h1>
<!--     </div> -->
	<div class=" weui_cells_form">
		<div class="weui_cells">
			<div class="weui_cell weui_cell_select weui_select_after">
				<div class="weui_cell_hd">餐饮类型</div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_select" name="select2">
						<option value="1">早餐</option>
						<option value="2">午餐</option>
						<option value="3">晚餐</option>
					</select>
				</div>
			</div>
		<!-- </div>
		<div class="weui_cells"> -->
			<div class="weui_cell">
				<div class="weui_cell_bd weui_cell_primary">
					<p>目标：80千卡</p>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<p>总能量：80千卡</p>
				</div>
			</div>
		</div>
		<div class="weui_cells_title">
			主食<a href="javascript:;" onclick="addFood();" style="float:right;"><img alt="添加"
				src="<%=path %>/image/add.png" width="20px;" heigth="20px;"></a>
		</div>
		<div class="weui_cells" id="mianfoodpanel">
			<div class="weui_cell weui_cell_select weui_select_before">
				<div class="weui_cell_hd">
					<select class="weui_select" name="mainfoodselect">
						<!-- <option value="1">米饭</option>
						<option value="2">面食</option>
						<option value="3">火锅</option> -->
					</select>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="number" placeholder="请输入食量（克）" />
				</div>
			</div>
		</div>
		<div class="weui_cells_title">
			肉类<a href="javascript:;" style="float:right;"><img alt="添加"
				src="<%=path %>/image/add.png" width="20px;" heigth="20px;"></a>
		</div>
		<div class="weui_cells">

			<div class="weui_cell weui_cell_select weui_select_before">
				<div class="weui_cell_hd">
					<select class="weui_select" name="select2">
						<option value="1">牛肉</option>
						<option value="2">猪肉</option>
						<option value="3">鸡肉</option>
					</select>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="number" placeholder="请输入食量（克）" />
				</div>
			</div>
		</div>
		<div class="weui_cells_title">
			蔬菜<a href="javascript:;" style="float:right;"><img alt="添加"
				src="<%=path %>/image/add.png" width="20px;" heigth="20px;"></a>
		</div>
		<div class="weui_cells">
			<div class="weui_cell weui_cell_select weui_select_before">
				<div class="weui_cell_hd">
					<select class="weui_select" name="select2">
						<option value="1">青菜</option>
						<option value="2">香菜</option>
						<option value="3">胡萝卜</option>
					</select>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="number" placeholder="请输入食量（克）" />
				</div>
			</div>
		</div>

		<div class="weui_cells_title">
			饮品<a href="javascript:;" style="float:right;"><img alt="添加"
				src="<%=path %>/image/add.png" width="20px;" heigth="20px;"></a>
		</div>
		<div class="weui_cells">

			<div class="weui_cell weui_cell_select weui_select_before">
				<div class="weui_cell_hd">
					<select class="weui_select" name="select2">
						<option value="1">牛奶</option>
						<option value="2">酸奶</option>
					</select>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="number" placeholder="请输入食量（克）" />
				</div>
			</div>
		</div>
		<div class="weui_cells_title">
			坚果<a href="javascript:;" style="float:right;"><img alt="添加"
				src="<%=path %>/image/add.png" width="20px;" heigth="20px;"></a>
		</div>
		<div class="weui_cells">

			<div class="weui_cell weui_cell_select weui_select_before">
				<div class="weui_cell_hd">
					<select class="weui_select" name="select2">
						<option value="1">核桃</option>
						<option value="2">花生</option>
					</select>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="number" placeholder="请输入食量（克）" />
				</div>
			</div>
		</div>
		<div class="weui_cells_title">
			水果<a href="javascript:;" style="float:right;"><img alt="添加"
				src="<%=path %>/image/add.png" width="20px;" heigth="20px;"></a>
		</div>
		<div class="weui_cells">

			<div class="weui_cell weui_cell_select weui_select_before">
				<div class="weui_cell_hd">
					<select class="weui_select" name="select2">
						<option value="1">苹果</option>
						<option value="2">香蕉</option>
					</select>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="number" placeholder="请输入食量（克）" />
				</div>
			</div>
		</div>
		<div class="weui_cells_title">备注</div>
		<div class="weui_cell">
			<div class="weui_cell_bd weui_cell_primary">
				<textarea class="weui_textarea" placeholder="请输入备注信息" rows="3"></textarea>
				<div class="weui_textarea_counter">
					<span>0</span>/200
				</div>
			</div>
		</div>
	</div>
	<div class="weui_btn_area">
		<a class="weui_btn weui_btn_primary" href="javascript:"
			id="showTooltips">确定</a> <a href="javascript:;"
			class="weui_btn weui_btn_warn">取消</a>
	</div>
	
</body>
</html>
