$("#manager3").datagrid({
	url : "../ServerAction/queryById?flag=1",
	height : 520,
	fitColumns : true,
	striped : true,
	rownumbers : true,
	border : false,
	pagination : true,
	singleSelect : true,

	// 分页的
	pageSize : 10,
	pageList : [ 5, 10, 15, 20 ],
	pageNumber : 1,
	toolbar : "manager_tool",

	columns : [ [ {
		field : "serveId",
		width : 20,
		formatter : function(value, row, index) {
			var s = '<input name="isShow3" type="radio"/> ';
			return s;
		}
	}, {
		field : "serveName",
		title : "服务名称",
		width : 100,
	}, {
		field : "dataType",
		title : "类型",
		width : 100,
	}, {
		field : "dataValue",
		title : "状态",
		width : 100,
	}, {
		field : "serveUpdateTime",
		title : "最后操作时间  ",
		width : 100,
	}, {
		field : "serveManageName",
		title : "操作人  ",
		width : 100,
	}, {
		field : "serveStayhandle",
		title : "待处理人  ",
		width : 100,
	}, ] ],
});

function handle() {
	var id;// 返回该行的id
	$("input[name='isShow3']").each(function(i, e) {
		if (e.checked == true) {
			id = i;
		}
	})
	var arrays = $("#manager3").datagrid("getRows");

	if (arrays[id] != undefined) {
			$.ajax({
				url : "../ServerAction/update",
				type : "post",
				data : {
					serveId : arrays[id].serveId
				},
				success : function(result) {
					if (result != null) {
						$("span[name='serveId']").val(result.serveId);
						$("span[name='serveName']").text(result.serveName);
						$("span[name='serveContent']")
								.text(result.serveContent);
						$("span[name='dataType']").text(result.dataType);
						$("span[name='dataValue']").text(result.dataValue);
						$("span[name='serveManageName']").text(
								result.serveManageName);
						$("span[name='serveCreateTime']").text(
								result.serveCreateTime);
						$("span[name='serveStayhandle']").text(
								result.serveStayhandle);

						$('#Handle').window({
							width : 600,
							height : 400,
							modal : true,
							title : "服务处理"
						});
					} else {
						alert("处理出错！");
					}
				}

			})
		
	} else {
		alert("你还未选择你要处理的服务")
	}
}
function close() {
	$("#Handle").window("close")
}
function submit() {
		$.ajax({
			url : "../ServerAction/updateHandle",
			type : "post",
			data : {
				serveId : $("span[name='serveId']").val(),
				serveState:$("#dataValue").val(),
				serveRemark:$("input[name='serveRemark']").val()
			},
			success : function(result) {
				if(result=="true"){
					alert("处理成功");
					$("#Handle").window("close");
					$('#manager3').datagrid('reload');
				}else{
					alert("处理失败");
				}
			}
		})
}
function select() {
	var id;// 返回该行的id
	$("input[name='isShow3']").each(function(i, e) {
		if (e.checked == true) {
			id = i;
		}
	})
	var arrays = $("#manager3").datagrid("getRows");
	if (arrays[id] != undefined) {

		$.ajax({
			url : "../ServerAction/update",
			type : "post",
			data : {
				serveId : arrays[id].serveId
			},
			success : function(result) {
				if (result != null) {
					$("#selectHandle").form("load", {
						serveId : result.serveId,
						serveName : result.serveName,
						serveClientId : result.serveClientId,
						servePhone : result.servePhone,
						serveContent : result.serveContent,
						serveRemark : result.serveRemark,
						dataType : result.dataType
					});
					$('#lookHandle').window({
						width : 600,
						height : 400,
						modal : true,
						title : "查看服务"
					});
				} else {
					alert("查看出错！");
				}
			}

		})
	} else {
		alert("你还未选择你要查看的服务！！")
	}
}
function selectClose() {
	$('#lookHandle').window("close")
}
function likeSelect3() {
	$('#manager3').datagrid('load',{
		likeName: $("input[name='likeName3']").val(),
		likeType: $("input[name='likeType3']").val(),
		likeState: $("input[name='likeState3']").val()
	});
}