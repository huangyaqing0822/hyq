$(function(){
	$("#reputation").datagrid({
		url:"../clientManagementAction/queryReputationById", 
		height:500,
		fitColumns:true,
		striped:true,
		rownumbers:true,
		border:false,
		pagination:true,
		
		//分页
		pageSize:10,
		pageList:[10,20,30,40],
		pageNumber:1,
		toolbar:"manager_tool",
		sortName:"date",
		sortOrder:"desc",
		
		columns:[[
		   {
				field:"clientId",
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
				title:"性别",
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
				field:"clReputationrank",
				title:"信誉等级",
				width:100,					 
			},
		]],
	});
	
	
	//查看框
	$("#reputation_look").dialog({
		width:540,
		height:350,
		title:"查看客户信誉信息",
		modal:true,
		closed:true,
		buttons:[{
			
			handler:function(){
				if($("#reputation_look").form("validate")){
					var rows = $('#reputation').datagrid('getSelections'); //选中一行
				}
			},
		}], 
	});
	
	
	
	manager_tool = {	
		

		//模糊查询
		search:function(){
			$('#reputation').datagrid('load',{
				likeName: $("input[name='reputationlikeName']").val(),
			});
		},
			
			
		look:function(){
			var rows = $("#reputation").datagrid("getSelections");
			if(rows.length > 1){
				$.messager.alert("警告操作！","编辑记录只能选定一条记录！","warning");
			}else if(rows.length == 1){
				$.ajax({
					url:"../clientManagementAction/updateReputationPost",
					type:"post",
					data:{
						clientId:rows[0].clientId  
					},
				
					success:function(result){
						console.log(result);
						if(result){
							$('#reputation_look').form('load',{
								"clientName":result.clientName,
								"clientSex":result.clientSex,
								"clientType":result.clientType,
								"count":result.counts,
								"clReputationranks":result.clReputationrank,
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
