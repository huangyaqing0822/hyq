<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户价值管理页面</title>
</head>
<body>
	<h4 style="text-indent: 25px;">客户管理>>客户价值管理</h4> 	
	<span style="margin-left: 300px">
		客户姓名:<input type="text" class="text"
			name="valuelikeName" style="width: 110px">
			
			 类型：<input
			name="likeType" class="easyui-combobox"
			style="width: 100px; height: 20px"
			data-options="panelHeight:'100px',valueField:'dataId',textField:'dataValue',limitToList:'true',url:'../DataDictionaryAction/queryData?dataCode=client_type'" /> 
	 	<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="manager_tool.search();">查询</a>
 	</span>
 	
 	<hr width="1230px;">
 	
 	<div id="manager_tool">
		<span style="margin-left: 30px">客户价值信息列表 </span>
		<span style="margin-left: 800px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="manager_tool.look();">查看</a> 
		</span>
	</div>
	 	
 	<table id="value"></table>
	
	<form id="value_look" style = "padding-left: 70px;padding-top: 20px">
			<table id="xh_table" style="padding-left: 40px;padding-top: 10px">
				<tr>
					<td>客户姓名：</td>
					<td><input type="text" name="clientName" style="height:20px;padding:0 2px;width:200px;"></td>
				</tr>
				<tr>
					<td>客户性别：</td>
					<td><input type="text" name="clientSex" style="height:20px;padding:0 2px;width:200px;"></td>
				</tr>
				<tr>
					<td>客户类型</td>
					<td>
					<input type="text" name="clientType" id="clientType" class="easyui-datebox" required="required"
					 style="height:20px;padding:0 2px;width:200px;"/></td>
				</tr>
				<tr>
					<td>服务代表：</td>
					<td><input type="text" name="clientSid" style="height:20px;padding:0 2px;width:200px;"></td>
				</tr>
				<tr>
					<td>已消费次数：</td>
					<td><input name="count" id="count" style="width:200px;height:20px"></input></td>
				</tr>				
				<tr>
					<td>消费总额：</td>
					<td><input name="money" id="money" style="width:200px;height:20px"></input></td>
				</tr>				
			</table>			
		</form>
 	
 	
 	<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/clientValue.js"></script>
 	
</body>
</html>