function queryseO() {
	var v1 = $("#ccppxc").val();
	var v2 = $("[name='usernamse']").val();
	var v4 = $("#timepar").val();
	var v5 = $("#typ").val();
	$("#notitle").datagrid("load", {
		input : v1 + (v2 == '' ? '' : '-') + v2,
		date : v4,
		type : v5
	})
}
$(function() {
	$('#notitle').datagrid({
		url : "http://localhost:8080/CrmSystem/indent/IdentInfos",
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
			field : 'Code',
			width : 35,
			checkbox : true
		}, {
			field : 'types',
			title : '订单类型',
			width : 190,
			align : 'center',
		}, {
			field : 'id',
			title : '订单号',
			width : 190,
			align : 'center',
		}, {
			field : 'namec',
			width : 190,
			title : '商品..',
			align : 'center',
		}, {
			field : 'clientName',
			title : '收货人',
			width : 190,
			align : 'center',
		}, {
			field : 'price',
			title : '订单金额(单位:元)',
			width : 190,
			align : 'center',
		}, {
			field : 'datetime',
			title : '下单时间',
			width : 190,
			align : 'center',
		}, {
			field : 'type',
			title : '状态',
			width : 190,
			align : 'center',
		}, ] ],
	});
	$(document).keyup(function(i) {
		if (i.keyCode == 13) {
			slenderIndent();
		}
	})
	$(document).keyup(function(i) {
		if (i.keyCode == 27) {
			$("#slender").window("close");
		}
	})
})
function slenderIndent() {
	var rows = $('#notitle').datagrid("getSelected");
	$.ajax({
		url : "http://localhost:8080/CrmSystem/indent/slenderInfo",
		type : "POST",
		data : {
			id : rows.id
		},
		dataType : "json",
		success : function(result) {
			$("#slender").window({
				width : 1000,
				height : 700,
				modal : true,
				title : "订单详细情况",
			});
			$(".infossss").each(function(i, e) {
				if (i == 0) {
					e.innerHTML = result.clientName;
				} else if (i == 1) {
					e.innerHTML = result.datetime;
				} else if (i == 2) {
					e.innerHTML = result.model;
				} else if (i == 3) {
					e.innerHTML = result.type;
				} else if (i == 4) {
					e.innerHTML = result.types;
				} else if (i == 5) {
					e.innerHTML = result.yunfei;
				} else if (i == 6) {
					e.innerHTML = result.countprice + "(￥)";
				}
			});
			var sp = result.invoice.split(";");
			var data = "";
			for (var i = 0; i < sp.length; i++) {
				if (i != sp.length - 1) {
					data += sp[i] + "(￥);"
				}
			}
			$("#invoice").html(data);
		},
		error : function() {
			$.messager.alert('错误!', '加载失败..');
		}
	})
}
function therefresh() {
	$('#notitle').datagrid("reload");
}
