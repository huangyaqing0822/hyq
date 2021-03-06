<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>

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
	<table id="tab_lhx_role">

	</table>
	<div id="div_idlhx">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="roleIndex.add()">添加</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="roleIndex.updat()">修改</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="roleIndex.del()">删除</a> <a href="#"
			class="easyui-linkbutton" iconCls="icon-reload" plain="true"
			onclick="roleIndex.raod()" id="savedd">刷新</a>
		<!-- <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick = "roleIndex.sedd()" id = "redoee">取消选择</a> -->
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true"
			onclick="roleIndex.accreditrole()" id="accreditrole">授权</a>
	</div>
	<div id="divroleManager">
		角色名称查询：<input type="text" class="easyui-textbox" id="tuihuoID"
			name="tuihuoID" /> <a href="#" class="easyui-linkbutton"
			iconCls="icon-search" onclick = "roleIndex.seachaa()" id="seachaa">查询</a>
	</div>
	<form id="tab_lhx_role_endit"
		style="margin: 0; padding: 5px 0 0 24px; color: #333;">
		系统管理>> 角色管理 >> 修改角色
		<table>
			<tr>
				<td></td>
				<td><input type="hidden" id="role_Id" disabled="false" name="role_Id"
					class="textbox" style="height: 23px;"></td>
			</tr>
			<tr>
				<td>角色编码:</td>
				<td><input type="text" disabled="false" id="role_roleCoding" name="role_roleCoding"
					data-options="validType:'integer',required:'true'" class="textbox"
					style="height: 23px;"></td>
			</tr>
			<tr>
				<td>角色名称:</td>
				<td><input type="text" class="textbox" id="tuData"
					name="tuData" style="height: 23px;"/></td>
			</tr>
			<tr>
				<td>所属部门:</td>
				<td><input id="ypid_th" name="ypid_th" style="width: 170px;"
					editable="false" data-options="required:'true'" type="text"
					class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>所属角色:</td>
				<td><input  name="roleList1" style="width: 170px;"
					 type="text"
					 /></td>
			</tr>
			<tr>
				<td>备注信息:</td>
				<td><textarea id="role_roleRemark" editable="false"
						data-options="validType:'integer',required:'true'"
						name="role_roleRemark" class="textbox" rows="7" /></td>
			</tr>
		</table>
	</form>
	
	<form id="Role_lhx_accreditrole" style="margin: 0; padding: 5px 0 0 24px; color: #333;">
		请选择权限进行授权：
		<!-- <input id="treecc" value="01">  -->
		<ul id="treecc"></ul>  
		
	</form>
	
	<form id="Role_lhx_adds"
		style="margin: 0; padding: 5px 0 0 24px; color: #333;">
		系统管理>> 角色管理 >> 增加角色
		<table>
			<tr>
				<td>角色名称:</td>
				<td><input type="text" id="roleName" name="roleName"
				 class="textbox"
					style="height: 23px;" /></td>
			</tr>
			<tr>
				<td>所属部门:</td>
				<td><input id="departmentIdS" name="departmentIdS" style="width: 170px;"
					editable="false" data-options="required:'true'" type="text"
					class="easyui-textbox" /></td>
			</tr>
			<tr>
				<td>所属角色:</td>
				<td><input  name="roleList" style="width: 170px;"
					 type="text"
					 /></td>
			</tr>
			<tr>
				<td>备注信息:</td>
				<td><textarea id="roleRemark" editable="false"
						data-options="validType:'integer',required:'true'"
						name="roleRemark" class="textbox" rows="7" /></td>
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

			$('input[name="roleName"]').validatebox({
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
			$('input[name="role_roleCoding"]').validatebox({
				required : true,
				integer : {// 验证整数  
					validator : function(value) {
						return /^[+]?[1-9]+\d*$/i.test(value);
					},
					message : '请输入整数'
				},
			});
			$('input[name="updat_tuiyaoJG"]').validatebox({
				required : true,
				integer : {// 验证整数  
					validator : function(value) {
						return /^[+]?[1-9]+\d*$/i.test(value);
					},
					message : '请输入整数'
				},
			});
			$('input[name="roleRemark"]').validatebox({
				required : true,
				integer : {// 验证整数  
					validator : function(value) {
						return /^[+]?[1-9]+\d*$/i.test(value);
					},
					message : '请输入整数'
				},
			});

			$('#tab_lhx_role').datagrid({
				url : 'http://localhost:8080/CrmSystem/roleAction/getListRole',
				title : "角色管理",
				toolbar : '#div_idlhx,#divroleManager',
				fitColumns : true,//使列自动展开/收缩到合适的DataGrid宽度。
				striped : true,//是否显示斑马线效果。
				rownumbers : true,//如果为true，则显示一个行号列。
				pagination : true,//如果为true，则在DataGrid控件底部显示分页工具栏。
				pageSize : 10,//在设置分页属性的时候初始化页面大小
				pageList : [ 10, 20, 40 ],//在设置分页属性的时候 初始化页面大小选择列表。
				pageNumber : 1,//在设置分页属性的时候初始化页码。
				height : 600,//高度
				columns : [ [ {
					field : 'roleId',
					title : '角色ID',
					width : 100,
					checkbox : true,
				}, {
					field : 'roleName',
					title : '角色名称',
					width : 100,
				//checkbox : true,
				}, {
					field : 'departmentName',
					title : '所属部门',
					width : 100
				//宽度
				}, {
					field : 'roleUdatTime',
					title : '最后修改时间',
					width : 100,
					sortable : true
				}, {
					field : 'staffName',
					title : '操作人',
					width : 100
				}, {
					field : 'roleRemark',
					title : '备注说明',
					width : 100,
					sortable : true
				} ] ],
			});
			
			$("#Role_lhx_accreditrole")
			.dialog(
					{
						width : 350,
						height : 300,
						title : "授权操作",
						modal : true,
						closed : true,
						buttons : [
								{
									text : "授权",
									iconCls : "icon-add",
									handler : function() {
										var rows = $("#tab_lhx_role").datagrid("getSelections");
										var nodes = $('#treecc').tree('getChecked', ['indeterminate','checked']);
										var strArr = [];
										for (var i = 0; i < nodes.length; i++) {
											strArr.push(nodes[i].id);
										}
										$.ajax({
											url:"../roleAction/insertRoleNav",
											data:{
												strRole:strArr.join(","),
												roleId:rows[0].roleId
											},
											success:function(result){
												if(result=="true"){
													alert("授权成功");
													$("#Role_lhx_accreditrole").dialog("close").form("reset");
												}
											}
										})
										console.log(nodes);
										console.log(rows[0].roleId);
									}
								},
								{
									text : "取消",
									iconCls : "icon-redo",
									handler : function() {
										$("#Role_lhx_accreditrole").dialog("close").form("reset");
									},
								}]
				})
			//增加
			$("#Role_lhx_adds").dialog(
				{
					width : 300,
					height : 250,
					title : "增加角色",
					modal : true,
					closed : true,
					buttons : [
						{
							text : "提交",
							iconCls : "icon-add",
							handler : function() {
								if ($("#Role_lhx_adds").form("validate")) {
									$.ajax({
												url : "http://localhost:8080/CrmSystem/roleAction/insertRoles",
												type : "post",
												data : {
													roleName : $("#roleName").val(),
													departmentId : $("#departmentIdS").val(),
													roleRemark : $("#roleRemark").val(),
													roleNid:$("[name=roleList]").val()
												},
												success : function(result) {
													$.messager.progress("close"); 
													if (result == "true") {
														$.messager.show({
																	title : '提示',
																	msg : '角色增加成功',
																	timeout : 5000,
																	showType : 'slide'
																}); 
														$("#Role_lhx_adds").dialog("close").form("reset");
														$("#tab_lhx_role").datagrid("reload");
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
								$("#Role_lhx_adds").dialog("close").form("reset");
							},
						} ]
				})
			//修改
			$("#tab_lhx_role_endit")
			.dialog(
					{
						width : 300,
						height : 250,
						title : "修改角色信息",
						modal : true,
						closed : true,
						buttons : [
								{
									text : "提交",
									iconCls : "icon-add",
									handler : function() {
										if ($("#tab_lhx_role_endit").form("validate")) {
											console.log($("[name=roleList1]").val());
											if(confirm("正在进行敏感操作，是否继续？失误操作可能会导致数据缺失")){
												$.ajax({
													url : "http://localhost:8080/CrmSystem/roleAction/updateRoles",
													type : "post",
													data : {
														roleId : $("#role_Id").val(),
														roleCoding : $("#role_roleCoding").val(),
														roleName : $("#tuData").val(),
														departmentId : $("#ypid_th").val(),
														roleRemark : $("#role_roleRemark").val(),
														roleNid:$("[name=roleList1]").val()
													},
													beforeSend : function() {
														$.messager.progress({
																	text : "正在修改中。。。。",
																});
													},
													success : function(data,response,status) {
														$.messager.progress("close");
														if (data == "true") {
															$.messager.show({
																		title : '提示',
																		msg : '修改成功',
																		timeout : 5000,
																		showType : 'slide'
																	});
															$("#tab_lhx_role_endit").dialog("close").form("reset");
															$("#tab_lhx_role").datagrid("reload");
														} else {
															$.messager.alert("修改失败","未知名的错误","warning");
														};
	
													},
												})
											}
								}
							}
						},
						{
							text : "取消",
							iconCls : "icon-redo",
							handler : function() {
								$("#tab_lhx_role_endit").dialog("close").form("reset");
							},
						} ]
			})

			roleIndex = {
				del : function() {
					var rows = $("#tab_lhx_role").datagrid("getSelections");
					if (rows.length > 0) {
						$.messager.confirm("确认要删除?","你真的要删除吗？",function(flag) {
							if (flag) {
								$.ajax({
									url : "http://localhost:8080/CrmSystem/roleAction/delRoles",
									type : "post",
									data : {
										roleId:rows[0].roleId,
											},
											
											success : function(result) {
												if (result == "true") {
													$.messager.show({
														title : "刪除成功"
													});
													$("#tab_lhx_role").datagrid("reload");
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
					var rows = $("#tab_lhx_role").datagrid("getSelections");
					if (rows.length > 1) {
						$.messager.alert("警告操作", "编辑记录只能选定一条数据", "warning");
					} else if (rows.length == 1) {
						$.ajax({
							url : "http://localhost:8080/CrmSystem/roleAction/listRoleOne",
							data : {
								roleId:rows[0].roleId,
							},
							type : "post",
							success : function(result) {
								if (result) {
									$("#tab_lhx_role_endit").form("load", {
										role_Id : result[0].roleId,//角色id
										role_roleCoding : result[0].roleCoding,//编码
										tuData : result[0].roleName,//名称
										ypid_th : result[0].departmentId,//所属部门
										role_roleRemark : result[0].roleRemark//备注
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
					$("#Role_lhx_adds").dialog("open");
					$('input[name="roleName"]').focus();
				},
				raod : function() {
					$('#tab_lhx_role').datagrid('reload');
				},
				sedd : function() {
					$('#tab_lhx_role').datagrid('unselectAll');
				},
				seachaa:function(){
					$('#tab_lhx_role').datagrid('load',{
						roleName:$('#tuihuoID').val()
					});
				},
				accreditrole:function(){
					var rows = $("#tab_lhx_role").datagrid("getSelections");
					if (rows.length > 1) {
						$.messager.alert("警告操作", "授权只能选定一条数据", "warning");
					} else if (rows.length == 1) {
						$('#treecc').tree({    
						    url: '../treeAction/tree',    
						    cascadeCheck:true,
						    animate:true,
						    lines:true,
						    checkbox:true,
						    onlyLeafCheck:false,
						    onBeforeCollapse:function(node){
						    	console.log(node);
						    	var skt = $('#treecc').tree("getChildren",node.target);
						    	console.log(skt);
								for (var i = 0; i < skt.length; i++) {
									if(skt[i].checked){
										return confirm("警告！危险操作,选定权限后请勿折叠,否则会导致权限缺失,是否继续？");
									}
								}
						    	return true;
						    }
						});
						
						$("#Role_lhx_accreditrole").dialog("open");
					} else if (rows.length == 0) {
						$.messager.alert("警告操作", "授权至少要选定一条数据", "warning");
					}
				}
			}
			$('#ypid_th').combobox({
				url : 'http://localhost:8080/CrmSystem/departmentAction/jsonDepartment',
				valueField : 'departmentId',
				textField : 'departmentFallName',
				onClick : function(record) {
					$("#tab_lhx_role_endit").form('load', {
						role_roleRemark : record.sj
					})
				}
			});
			$('[name=roleList]').combobox({
				url : 'http://localhost:8080/CrmSystem/roleAction/selectAll',
				valueField : 'roleId',
				textField : 'roleName',
				onClick : function(record) {
					
				}
			});
			$('[name=roleList1]').combobox({
				url : 'http://localhost:8080/CrmSystem/roleAction/selectAll',
				valueField : 'roleId',
				textField : 'roleName',
				onClick : function(record) {
					
				}
			});
			$('#departmentIdS').combobox({
				url : 'http://localhost:8080/CrmSystem/departmentAction/jsonDepartment',
				valueField : 'departmentId',
				textField : 'departmentFallName',
				onClick : function(record) {
					
					$("#Role_lhx_adds").form('load', {
						roleRemark : record.sj
					})
				}
			});

		
		});

		
	</script>
</body>
</html>