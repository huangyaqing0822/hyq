$("#manager").datagrid({
	url : "../ServerAction/queryById?flag=0",
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
			var s = '<input name="isShow1" type="radio"/> ';
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
function onClickCell() {
	var id;// 返回该行的id
	$("input[name='isShow1']").each(function(i, e) {
		if (e.checked == true) {
			id = i;
		}
	})
	var arrays = $("#manager").datagrid("getRows");
	console.log(id);
	if (arrays[id] != undefined) {
		if (confirm("是否确认删除？")) {
			$.ajax({
				url : "../ServerAction/delete",
				type : "post",
				data : {
					id : arrays[id].serveId
				},
				success : function(result) {
					console.log(result);
					if (result == "true") {
						alert("删除成功！");
						$('#manager').datagrid('reload');
					} else {
						alert("删除失败！");
					}
				}

			})
		}
	}else{
		alert("你还未选择！！")
	}

}
function update() {
	var id;// 返回该行的id
	$("input[name='isShow1']").each(function(i, e) {
		if (e.checked == true) {
			id = i;
		}
	})
	var arrays = $("#manager").datagrid("getRows");
	if (arrays[id] != undefined) {
		if (confirm("是否确认修改？")) {
			$.ajax({
				url : "../ServerAction/update",
				type : "post",
				data : {
					serveId : arrays[id].serveId
				},
				success : function(result) {
					if (result != null) {
						$("#updatePost").form("load", {
							serveId : result.serveId,
							serveName : result.serveName,
							serveClientId : result.serveClientId,
							servePhone : result.servePhone,
							serveContent : result.serveContent,
							serveRemark : result.serveRemark,
							dataType:result.dataType
						});
						$("input[name='dataType']").val(result.serveType);
						$('#update').window({
							width : 600,
							height : 400,
							modal : true,
							title : "修改服务"
						});
					} else {
						alert("修改出错！");
					}
				}

			})
		}
	} else {
		alert("你还未选择！！")
	}
}
function add() {
	$('#add').window({
		width : 1000,
		height : 600,
		modal : true,
		title : "新建服务"
	});
}
function select() {
	var id;// 返回该行的id
	$("input[name='isShow1']").each(function(i, e) {
		if (e.checked == true) {
			id = i;
		}
	})
	var arrays = $("#manager").datagrid("getRows");
	if (arrays[id] != undefined) {
		
			$.ajax({
				url : "../ServerAction/update",
				type : "post",
				data : {
					serveId : arrays[id].serveId
				},
				success : function(result) {
					if (result != null) {
						$("#selectPost").form("load", {
							serveId : result.serveId,
							serveName : result.serveName,
							serveClientId : result.serveClientId,
							servePhone : result.servePhone,
							serveContent : result.serveContent,
							serveRemark : result.serveRemark,
							dataType:result.dataType
						});
						$("input[name='dataType']").val(result.serveType);
						$('#look').window({
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
function addSubmit() {
	$('#addPost').form('submit', {
		url : "../ServerAction/addPost",
		success : function(data) {
			if (data == "true") {
				$('#add').window("close");
				$('#manager').datagrid('reload');
			}

		}
	});
}
function updatePost() {
	$('#updatePost').form('submit', {
		url : "../ServerAction/updatePost",
		success : function(data) {
			if (data == "true") {
				$('#update').window("close");
				$('#manager').datagrid('reload');
			}
		}
	});
}
function close() {
	$('#add').window("close")
}
function selectClose() {
	$('#look').window("close")
}
function closeUpdate() {
	$('#update').window("close")
}
function submit() {
	var id;// 返回该行的id
	$("input[name='isShow1']").each(function(i, e) {
		if (e.checked == true) {
			id = i;
		}
	})
	var arrays = $("#manager").datagrid("getRows");
	if(arrays[id] != undefined){
		if(arrays[id].dataValue=="新创建"){
			$.ajax({
				url : "../ServerAction/updateState",
				type : "post",
				data : {
					serveId : arrays[id].serveId
				},
				success : function(result) {
					if (result == "true") {
						alert("提交成功！");
						$('#manager').datagrid('reload');
					} else {
						alert("提交失败！");
					}
				}

			})
		}else{
			alert("此服务已提交过了")
		}
	}else{
		alert("你还未选择你要提交的服务")
	}
}
function likeSelect() {
	$('#manager').datagrid('load',{
		likeName: $("input[name='likeName']").val(),
		likeType: $("input[name='likeType']").val(),
		likeState: $("input[name='likeState']").val()
	});
}