<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关怀提醒页面</title>
</head>
<body>
	<h4 style="text-indent: 25px;">客户管理>>客户关怀管理>>关怀提醒</h4> 	
	<div id="love_look">
		<div style="margin: 20px 50px">
				<table style="line-height: 30px;font-size: 18px;width: 510px">
					<tr style="display: none">
						<td colspan="2">id：<span name="serveId"></span></td>
					</tr>
					<tr>	
						<td>客户姓名：<span name="clientName"></span></td>
						<td>性别：<span name="clientSex"></span></td>
					</tr>
					<tr>
						<td>客户类型：<span name="clientType"></span></td>
						<td>客户状态：<span name="clientState"></td>
					</tr>
					<tr>
						<!-- <td>生日：<span name="clientBirthday"></span></td> -->
						<td>满意度：<span name="csZtdegree"></span></span></td>
						<td>价值等级：<span name="clientLv"></span></span></td>
					</tr>
					<!-- <tr>
						<td>信誉等级：<span name="clReputationrank"></span></td>
						
					</tr> -->
				</table>
		</div>
	</div>
 	
 	<hr width="1230px;">
 	
 	<div id="manager_tool">
		<span style="margin-left: 30px">角色信息列表 </span>
		<span style="margin-left: 700px">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="manager_tool.add();">添加</a> 
		<a href="#"	class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="manager_tool.edits();">修改</a> 
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="manager_tool.remove();">删除</a>
		<!-- <a href="#"	class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="selectClose()">返回</a> -->
		</span>
	</div>  	
 			
 	
 	<table id="loveRemind"></table>
 	
 	<form id="loveRemind_add" style = "padding-left: 70px;padding-top: 20px">
			<table id="xh_table" style="padding-left: 40px;padding-top: 10px">
				<!-- <tr>
					<td><input type="hidden" name="cdId_edit" id="cdId_edit"  /></td>
				</tr> -->
				<tr>
					<td>提醒名称：</td>
					<td><input type="text" name="clWarnname" style="height:20px;padding:0 2px;width:200px;"></td>
				</tr>
				<tr>
					<td>提醒时间：</td>
					<td><input type="text" name="clWarntime" style="height:20px;padding:0 2px;width:200px;"></td>
				</tr>
				<tr>
					<td>提醒类型：</td>
					<td>
					<input type="text" name="clWarntype" id="clWarntype" class="easyui-datebox" 
					 style="height:20px;padding:0 2px;width:70px;"/></td>
				</tr>
				<tr>
					<td>提醒周期：</td>										
					<td><input type="text" name="clPeriod" id="clPeriod" class="easyui-datebox" 
					 style="height:20px;padding:0 2px;width:70px;"/></td>
				</tr>
				<tr>
					<td>提醒频率：</td>
					<td><textarea name="clRate" id="clRate" style="width:70px;height:20px"></textarea></td>
				</tr>				
				<tr>
					<td>备注信息：</td>
					<td><textarea name="clRemarkremind" id="clRemarkremind" style="width:280px;height:110px"></textarea></td>
				</tr>				
			</table>			
		</form>
		
		
		
		
		<form id="loveRemind_edit" style = "padding-left: 70px;padding-top: 20px">
			<table id="xh_table" style="padding-left: 40px;padding-top: 10px">
				<tr>
					<td><input type="hidden" name="cdId_edit" id="cdId_edit"  /></td>
				</tr>
				<tr>
					<td>提醒名称：</td>
					<td><input type="text" name="clWarnname_edit" style="height:20px;padding:0 2px;width:200px;"></td>
				</tr>
				<tr>
					<td>提醒时间：</td>
					<td><input type="text" name="clWarntime_edit" style="height:20px;padding:0 2px;width:200px;"></td>
				</tr>
				<tr>
					<td>提醒类型：</td>
					<td>
					<input type="text" name="clWarntype_edit" id="clWarntype_edit" class="easyui-datebox" 
					 style="height:20px;padding:0 2px;width:70px;"/></td>
				</tr>
				<tr>
					<td>提醒周期：</td>					
					
					<td><input type="text" name="clPeriod_edit" id="clPeriod_edit" class="easyui-datebox" 
					 style="height:20px;padding:0 2px;width:70px;"/></td>
				</tr>
				<tr>
					<td>提醒频率：</td>
					<td><textarea name="clRate_edit" id="clRate_edit" style="width:70px;height:20px"></textarea></td>
				</tr>				
				<tr>
					<td>备注信息：</td>
					<td><textarea name="clRemarkremind_edit" id="clRemarkremind_edit" style="width:280px;height:110px"></textarea></td>
				</tr>				
			</table>			
		</form>
		
		 	
	<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/loveRemind.js"></script>
</body>
</html>