<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础信息</title>

<style type="text/css">
.dialog-button {
	text-align: center;
}

.textbox {
	height: 22px;
	padding: 0 2px;
}
</style>
</head>
<body>
	<table id="tab_baseInfo_LHX">

	</table>
	<div id="div_baseInfo">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="index_baseInfoTime.add()">添加</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="index_baseInfoTime.updat()">修改</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="index_baseInfoTime.del()">删除</a> 
	</div>
	<div id="divaBaseInfoManger">
		参数名称查询：<input type="text" class="easyui-textbox" id="gdfdf"
			name="gdfdf" /> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" id="baseInfoSeach">查询</a>
	</div>
	<form id="tab_baseInfo_LHX_endit"
		style="margin: 0; padding: 5px 0 0 24px; color: #333;">
		系统管理>>基础信息 >> 修改基础信息
		<table>
			<tr>
				<td></td>
				<td><input type="hidden" id="idTui" name="idTui"
					class="textbox" style="height: 23px;"></td>
			</tr>
			<tr>
				<td>参数关键字:</td>
				<td><input type="text" id="baseKeywordsUpdat" name="baseKeywordsUpdat" class="textbox"
					style="height: 23px;"></td>
			</tr>
				<tr>
				<td>参数值:</td>
				<td><input type="text" id="baseValueUpdat" name="baseValueUpdat"  class="textbox"
					style="height: 23px;"></td>
			</tr>
			<tr>
				<td>参数描述:</td>
				<td><textarea id="baseDescribeUpdat" editable="false"
						data-options="validType:'integer',required:'true'"
						name="baseDescribeUpdat" class="textbox" rows="7" /></td>
			</tr>
			<tr>
				<td>备注信息:</td>
				<td><textarea id="baseRamrkUpdate" editable="false"
						data-options="valLidType:'integer',required:'true'"
						name="baseRamrkUpdate" class="textbox" rows="7" /></td>
			</tr>
		</table>
	</form>
	<form id="baseInfo_lhx_adds"
		style="margin: 0; padding: 5px 0 0 24px; color: #333;">
		系统管理>>基础信息 >> 增加基础信息
		<table>
			<tr>
				<td>参数关键字:</td>
				<td><input type="text" id="baseKeywordsAdd" name="baseKeywordsAdd" class="textbox" style="height: 23px;" /></td>
			</tr>
			<tr>
				<td>参数值</td>
				<td><input type="text" id="baseValueAdd" name="baseValueAdd" class="textbox" style="height: 23px;" /></td>
			</tr>
			<tr>
				<td>参数描述:</td>
				<td><textarea id="baseDescribeAdd" editable="false"
						data-options="validType:'integer',required:'true'"
						name="baseRamrkAdd" class="textbox" rows="7" /></td>
			</tr>
			<tr>
				<td>备注信息:</td>
				<td><textarea id="baseRamrkAdd" editable="false"
						data-options="valLidType:'integer',required:'true'"
						name="baseRamrkAdd" class="textbox" rows="7" /></td>
			</tr>
		</table>
	</form>


	<script type="text/javascript">
		$(function() {
			$.extend($.fn.validatebox.defaults.rules, {
				integer : {// 验证整数  
					validator : function(value) {
						return /^[+]?[1-9]+\d*$/i.test(value);
					},
					message : '请输入整数'
				},
				CHS : { //验证只能输入中文
					validator : function(value) {
						return /^[\u0391-\uFFE5]+$/.test(value);
					},
					message : '只能输入汉字'
				},
				english : {// 验证英语  
					message : '请输入英文'
				},
			});
			
			
			$('input[name="baseValueAdd"]').validatebox({
				required : true,
				CHS : { //验证只能输入中文
					validator : function(value) {
						return /^[\u0391-\uFFE5]+$/.test(value);
					},
					message : '只能输入汉字'
				},
			});
			$('input[name="roleCoding"]').validatebox({
				required : true,
				integer : {// 验证整数  
					validator : function(value) {
						return /^[+]?[1-9]+\d*$/i.test(value);
					},
					message : '请输入整数'
				},
			});
			$('input[name="baseKeywordsUpdat"]').validatebox({
				required : true,
				integer : {// 验证整数  
					validator : function(value) {
						return /^[+]?[1-9]+\d*$/i.test(value);
					},
					message : '请输入整数'
				},
			});
			$('input[name="baseRamrkAdd"]').validatebox({
				required : true,
				integer : {// 验证整数  
					validator : function(value) {
						return /^[+]?[1-9]+\d*$/i.test(value);
					},
					message : '请输入整数'
				},
			});
		

			$('#tab_baseInfo_LHX').datagrid({
				url : 'http://localhost:8080/CrmSystem/baseInfoAction/listSelectBaseInfo',
				title : "基础信息",
				toolbar : '#div_baseInfo,#divaBaseInfoManger',
				fitColumns : true,//使列自动展开/收缩到合适的DataGrid宽度。
				striped : true,//是否显示斑马线效果。
				rownumbers : true,//如果为true，则显示一个行号列。
				border : false,//是否有边框
			 	pagination : true,//如果为true，则在DataGrid控件底部显示分页工具栏。
				pageSize : 3,//在设置分页属性的时候初始化页面大小
				pageList : [ 3, 6, 9 ],//在设置分页属性的时候 初始化页面大小选择列表。
				pageNumber : 1,//在设置分页属性的时候初始化页码。
				height : 600,//高度
				columns : [ [ {
					field : 'baseId',
					title : '基本信息id',
					width : 100,
					checkbox : true,
				}, {
					field : 'baseDescribe',
					title : '参数描述',
					width : 100,
				//checkbox : true,
				}, {
					field : 'baseKeywords',
					title : '参数关键字',
					width : 100
				//宽度
				}, {
					field : 'baseValue',
					title : '参考值',
					width : 100,
				}, {
					field : 'staffName',
					title : '添加人',
					width : 100,
				} ] ],
			});
			//增加
			$("#baseInfo_lhx_adds").dialog(
				{
					width : 350,
					height : 400,
					title : "增加信息",
					modal : true,
					closed : true,
					buttons : [
						{
							text : "提交",
							iconCls : "icon-add",
							handler : function() {
								if ($("#baseInfo_lhx_adds").form("validate")) {
									$.ajax({
												url : "http://localhost:8080/CrmSystem/baseInfoAction/insertBaseInfos",
												type : "post",
												data : {
													baseKeywords:$("#baseKeywordsAdd").val(),
													baseValue:$("#baseValueAdd").val(),
													baseDescribe:$("#baseDescribeAdd").val(),
													baseRamrk:$("#baseRamrkAdd").val(),
												},
												success : function(data) {
													$.messager.progress("close");
													if (data == "true") {
														$.messager.show({
																	title : '提示',
																	msg : '信息增加成功',
																	timeout : 5000,
																	showType : 'slide'
																});
														$("#baseInfo_lhx_adds").dialog("close").form("reset");
														$("#tab_baseInfo_LHX").datagrid("reload");
													} else {
														$.messager.alert("添加失败","未知名的错误","warning");
													};
												},
											})
								}
							}
						},
						{
							text : "取消",
							iconCls : "icon-redo",
							handler : function() {
								$("#baseInfo_lhx_adds").dialog("close").form("reset");
							},
						} ]
				})
			//修改
			$("#tab_baseInfo_LHX_endit").dialog(
							{
								width : 350,
								height : 400,
								title : "修改角色信息",
								modal : true,
								closed : true,
								buttons : [
										{
											text : "提交",
											iconCls : "icon-add",
											handler : function() {
												if ($("#tab_baseInfo_LHX_endit").form("validate")) {
													$.ajax({
														url : "http://localhost:8080/CrmSystem/baseInfoAction/updateBaseInfo",
														type : "post",
														data : {
															baseId : $("#idTui").val(),
															baseKeywords:$("#baseKeywordsUpdat").val(),
															baseValue :$("#baseValueUpdat").val(),
															baseDescribe : $("#baseDescribeUpdat").val(),
															baseRamrk:$("#baseRamrkUpdate").val()
														},
														success : function(data,response,status) {
															if (data == "true") {
																$.messager.show({
																			title : '提示',
																			msg : '修改成功',
																			timeout : 5000,
																			showType : 'slide'
																		});
																$("#tab_baseInfo_LHX_endit").dialog("close").form("reset");
																$("#tab_baseInfo_LHX").datagrid("reload");
															} else {
																$.messager.alert("修改失败","未知名的错误","warning");
															};
														},
													})
										}
											}
										},
										{
											text : "取消",
											iconCls : "icon-redo",
											handler : function() {
												$("#tab_baseInfo_LHX_endit").dialog("close").form("reset");
											},
										} ]
							})

			index_baseInfoTime = {
				del : function() {
					var rows = $("#tab_baseInfo_LHX").datagrid("getSelections");
					if (rows.length > 0) {
						$.messager.confirm("确认要删除?","你真的要删除吗？",
										function(flag) {
											if (flag) {
													$.ajax({
															url : "http://localhost:8080/CrmSystem/baseInfoAction/deleteBaseInfos",
															type : "post",
															data : {
																baseId:rows[0].baseId,
															},
															success : function(result) {
																if (result == "true") {
																	$.messager.show({
																		title : "刪除成功"
																			});
																	$("#tab_baseInfo_LHX").datagrid("reload");
																}
															}
														})
											}
										});
					} else {
						$.messager.alert("警告", "至少要选择一条记录删除", "warning");
					}
				},
				//修改
				updat : function() {
					var rows = $("#tab_baseInfo_LHX").datagrid("getSelections");
					if (rows.length > 1) {
						$.messager.alert("警告操作", "编辑记录只能选定一条数据", "warning");
					} else if (rows.length == 1) {
						$.ajax({
							url : "http://localhost:8080/CrmSystem/baseInfoAction/selectBaseinfoOne",
							data : {
								baseId:rows[0].baseId,
							},
							type : "post",
							success : function(result) {
								if (result) {
									$("#tab_baseInfo_LHX_endit").form("load", {
										idTui : result[0].baseId,//
										baseKeywordsUpdat : result[0].baseKeywords,//
										baseValueUpdat : result[0].baseValue,//
										baseDescribeUpdat:result[0].baseDescribe,
										baseRamrkUpdate:result[0].baseRamrk
										
									}).dialog("open");
								}
							},
						})
					} else if (rows.length == 0) {
						$.messager.alert("警告操作", "编辑记录至少要选定一条数据", "warning");
					}
					;
				},
				add : function() {
					$("#baseInfo_lhx_adds").dialog("open");
					$('input[name="baseKeywordsAdd"]').focus();
				},
				raod : function() {
					$('#tab_baseInfo_LHX').datagrid('reload');
				},
				sedd : function() {
					$('#tab_baseInfo_LHX').datagrid('unselectAll');
				},
			}
	
		});

		$("#baseInfoSeach").click(function() {
			$("#tab_baseInfo_LHX").datagrid("load", {
				baseDescribe : $("#gdfdf").val(),
			});
		})

	</script>
</body>
</html>