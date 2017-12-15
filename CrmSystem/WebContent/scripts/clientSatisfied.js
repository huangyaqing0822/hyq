$(function() {
	$("#satisfied").datagrid({
		url:"../clientManagementAction/querySatisfiedById", 
		height:520,
		fitColumns:true,
		striped:true,
		rownumbers:true,
		border:false,
		pagination:true,
		
		//分页的
		pageSize:10,
		pageList:[10,20,30,40],
		pageNumber:1,
		toolbar:"manager_tool",
		sortName:"date",
		sortOrder:"desc",
		
		columns:[[
		   {
				field:"csId",
				title:"自动编号",
				width:100,
				checkbox:true,	 
			},
			{
				field:"clientName",
				title:"客户姓名",
				width:100,
			},
			{
				field:"clientType",
				title:"客户类型",
				width:100,					 
			},			
			{
				field:"csSurveyTime",
				title:"调查时间",
				width:100,					 
			},
			{
				field:"csMydegree",
				title:"质量满意度",
				width:100,					 
			},
			{
				field:"csFwdegree",
				title:"服务满意度",
				width:100,					 
			},
			{
				field:"csZtdegree",
				title:"总体满意度",
				width:100,					 
			},
		]],
	});
	
	
	//添加框
	$("#satisfied_add").dialog({
		width:610,
		height:510,
		title:"添加满意度",
		modal:true,
		closed:true,
		buttons:[{
			text:"保存",
			iconCls:"icon-add",
			handler:function(){
				if($("#satisfied_add").form("validate")){
					$.ajax({
						url:"../clientManagementAction/addSatisfiedPost",
						type:"post",
						data:{
							"csMydegree":$("input[name='csMydegree']").val(),
							"csFwdegree":$("input[name='csFwdegree']").val(),
							"csXjbdegree":$("textarea[name='csXjbdegree']").val(),					
							"csZtdegree":$("textarea[name='csZtdegree']").val(),					
						},
						beforeSend:function(){
							$.messager.progress({
								text:"正在更新中。。。",
							});
						},
						success : function(result) {
							$.messager.progress("close");
							$.messager.show({
								title:"提示",
								msg:"添加满意度成功",
							});
							$("#satisfied_add").dialog("close").form("reset");
							$("#satisfied").datagrid("reload");  
						}
					});
				}else{
					alert("请填写完整信息")
				}
			},
		},{
			text:"返回",
			iconCls:"icon-redo",
			handler:function(){
				$("#satisfied_add").dialog("close").form("reset");
			},
		}],
	});
	
	
	//修改提交
	 $("#satisfied_edit").dialog({
		width:600,
		height:450,
		title:"修改满意度",
		modal:true,
		closed:true,
		buttons:[{
			text:"提交",
			iconCls:"icon-edit",
			handler:function(){
				if($("#satisfied_edit").form("validate")){
					var rows = $('#satisfied').datagrid('getSelections');
					$.ajax({						
						url:"../clientManagementAction/updateSubmitSatisfiedPost",
						type:"post",
						data:{							
							clientCoding:$("input[name='clientCoding_edit']").val(),
							clientName:$("input[name='clientName_edit']").val(),
							clientSex:$("input[name='clientSex_edit']").val(),
							clientType:$("input[name='clientType_edit']").val(),
							clientState:$("textarea[name='clientState_edit']").val(),
							csMydegree:$("textarea[name='csMydegree_edit']").val(),
							csFwdegree:$("textarea[name='csFwdegree_edit']").val(),
							csXjbdegree:$("textarea[name='csXjbdegree_edit']").val(),
							csZtdegree:$("textarea[name='csZtdegree_edit']").val(),
							csFeedback:$("textarea[name='csFeedback_edit']").val(),
														
						},
						success : function(result) {					
					    	console.log(result)
					    	if(result == "true"){
					    		$.messager.confirm('提示操作','修改成功','warning');
					    		$('#satisfied_edit').dialog('close');
								$('#satisfied').datagrid('reload');  //到首页刷新
					    	}else{
								$.messager.confirm('提示操作','修改失败','warning');
							}
						}
					});
				}else{
					alert("请填写完整信息")
				} 
			},
		},{
			text:"取消",
			iconCls:"icon-redo",
			handler:function(){
				$("#satisfied_edit").dialog("close").form("reset");
			},
		}], 
	});
	
	
	
	
	
	manager_tool = {				
			//新增
			add:function(){
				$("#satisfied_add").dialog("open")	;
				$("input[name='csMydegree']").focus();
	
				
			},
			
			//模糊查询
			search:function(){
				$('#satisfied').datagrid('load',{
					likeName: $("input[name='satisfiedlikeName']").val(),
				});
			},
			
			
			
			
			remove:function(){
				var rows = $("#satisfied").datagrid("getSelections");
				if(rows.length == 1){
					$.messager.confirm("确定操作","您确定要删除所选的记录吗？",function(flag){
						if(flag){
							console.log(rows);							
							$.ajax({
								type:"post",
								url:"../clientManagementAction/deleteSatisfiedPost",
								data:{
									csId:rows[0].csId
								},
								  
								success:function(result){
									 if(result == "true"){		
										alert("删除成功")
										$("#satisfied").datagrid("reload"); //自动刷新	  
									} else{
										$.messager.confrim("提示操作","删除失败","warning");
									}
								},
							});
						}
					});
				}else{
					$.messager.alert("提示","请选择要删除的记录","info");
				}
			}, 
			
			
			
			edit:function(){
				var rows = $("#satisfied").datagrid("getSelections");
				if(rows.length > 1){
					$.messager.alert("警告操作！","查看记录只能选定一条记录！","warning");
				}else if(rows.length == 1){
					$.ajax({
						url:"../clientManagementAction/updateSatisfiedPost",
						type:"post",
						data:{
							csId:rows[0].csId  
						},
					
						success:function(result){
							console.log(result);
							if(result){
								$('#satisfied_edit').form('load',{
									
									"clientCoding_edit":result.clientCoding,
									"clientName_edit":result.clientName,
									"clientSex_edit":result.clientSex,
									"clientType_edit":result.clientType,
									"clientState_edit":result.clientState,
									"csMydegree_edit":result.csMydegree,
									"csFwdegree_edit":result.csFwdegree,
									"csXjbdegree_edit":result.csXjbdegree,
									"csZtdegree_edit":result.csZtdegree,
									"csFeedback_edit":result.csFeedback,
									
								}).dialog('open')
							}
						}
					});	
				}else if(rows.length == 0){
					$.messager.alert("警告操作！","编辑记录至少选定一条记录！","warning");
				}
			},
			
			
			
			look:function(){
				var rows = $("#satisfied").datagrid("getSelections");
				if(rows.length > 1){
					$.messager.alert("警告操作！","查看记录只能选定一条记录！","warning");
				}else if(rows.length == 1){
					$.ajax({
						url:"../clientManagementAction/updateSatisfiedPost",
						type:"post",
						data:{
							csId:rows[0].csId  
						},
					
						success:function(result){
							console.log(result);
							if(result){
								$('#satisfied_edit').form('load',{
									"clientCoding_edit":result.clientCoding,
									"clientName_edit":result.clientName,
									"clientSex_edit":result.clientSex,
									"clientType_edit":result.clientType,
									"clientState_edit":result.clientState,
									"csMydegree_edit":result.csMydegree,
									"csFwdegree_edit":result.csFwdegree,
									"csXjbdegree_edit":result.csXjbdegree,
									"csZtdegree_edit":result.csZtdegree,
									"csFeedback_edit":result.csFeedback,
									
								}).dialog('open')
							}
						}
					});	
				}else if(rows.length == 0){
					$.messager.alert("警告操作！","编辑记录至少选定一条记录！","warning");
				}
			},
			
			
		};
	
	
	
	
	
})