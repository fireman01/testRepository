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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/weui.min.css">
</head>

<body>
	<div class="weui_cells weui_cells_form" id="form">
		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">姓名：</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" placeholder="请输入姓名" required="true" type="text" />
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd">
				出生日期：
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="date" value="1990-01-01"  required="true" />
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">身高：</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" placeholder="请输入身高（cm）" />
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd">
				孕前体重：
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" placeholder="请输入孕前体重（kg）" />
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd">
				当前体重：
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" placeholder="请输入当前体重（kg）" />
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd">
				工作强度：
			</div>
			 <div class="weui_cell_bd weui_cell_primary">
                    <select class="weui_select" name="select2">
                        <option value="1">轻度劳动</option>
                        <option value="2">中度劳动</option>
                        <option value="3">重度劳动</option>
                    </select>
                </div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">孕期：</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" placeholder="请输入孕期周数" />
			</div>
		</div>
		<div class="weui_cell">
			<div class="weui_cell_hd">
				主治医师：
			</div>
			 <div class="weui_cell_bd weui_cell_primary">
                    <select class="weui_select" name="select2">
                        <option value="">请选择</option>
                        <option value="1">阿三</option>
                        <option value="2">阿四</option>
                    </select>
                </div>
		</div>
		<div class="weui_btn_area">
            <a class="weui_btn weui_btn_primary" href="javascript:;" onclick="submitForm();">确定</a>
        </div>
	</div>
</body>
<script type="text/javascript">
function submitForm(){
	
}
</script>
</html>
