$(function() {
	$("#value").datagrid({
		url:"../clientManagementAction/queryValueById", 
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
				field:"id",
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
				field:"clientSex",
				title:"客户性别",
				width:100,
			},
			{
				field:"clientType",
				title:"客户类型",
				width:100,					 
			},
			{
				field:"counts",
				title:"已消费次数",
				width:100,					 
			},
			{
				field:"moneys",
				title:"消费金额（单位：万元）",
				width:100,					 
			},
			/*{
				field:"clientSid",录入人
				title:"服务代表",
				width:100,					 
			},*/
		]],
	});
	
	
	//查看框
	$("#value_look").dialog({
		width:580,
		height:400,
		title:"查看客户价值信息",
		modal:true,
		closed:true,
		buttons:[{
			
			handler:function(){
				if($("#value_look").form("validate")){
					var rows = $('#value').datagrid('getSelections'); //选中一行
				}
			},
		}], 
	});
	
	
	
	manager_tool = {
			
		//模糊查询
		search:function(){
			$('#value').datagrid('load',{
				likeName: $("input[name='valuelikeName']").val(),
				likeType: $("input[name='likeType']").val(),
			});
		},
			
			
		look:function(){
			var rows = $("#value").datagrid("getSelections");
			if(rows.length > 1){
				$.messager.alert("警告操作！","编辑记录只能选定一条记录！","warning");
			}else if(rows.length == 1){
				$.ajax({
					url:"../clientManagementAction/updateValuePost",
					type:"post",
					data:{
						clientId:rows[0].clientId  
					},
				
					success:function(result){
						console.log(result);
						if(result){
							$('#value_look').form('load',{
								"clientName":result.clientName,
								"clientSex":result.clientSex,
								"clientType":result.clientType,
								"clientSid":result.clientSid,
								"count":result.counts,
								"money":result.moneys,
								
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