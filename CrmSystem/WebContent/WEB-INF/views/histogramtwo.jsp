<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户分布表</title>
<body>
<div id="containerx2"></div>
<div id="slidersx2">
    <table>
        <tr>
            <td>α 角（内旋转角）</td>
            <td><input id="alpha" type="range" min="0" max="45" value="15"/> <span id="alpha-valuex2" class="value"></span></td>
        </tr>
        
        <tr>
            <td>β 角（外旋转角）</td>
            <td><input id="beta" type="range" min="-45" max="45" value="15"/> <span id="beta-valuex2" class="value"></span></td>
        </tr>
        
        <tr>
            <td>深度</td>
            <td><input id="depth" type="range" min="20" max="100" value="50"/> <span id="depth-valuex2" class="value"></span></td>
        </tr>
    </table>
</div>
<script type="text/javascript">
	$(function () {
	var ads = [];
	var sum1 = [];
	var sum2 = [];
	$.ajax({
		url:'../selectOne?state=2',
		async:false,
		type:'post',
		success:function(data){
			console.log(data);
			for(var i=0;i<data.length;i++)
			{
				ads.push(data[i].monthString);
				sum1.push(data[i].sum1);
				sum2.push(data[i].sum2);
			}
		}
	})
		
   
	 // Set up the chart
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'containerx2',
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        },
        xAxis: {
            categories: ads   // x 轴分类
        },
        yAxis: {
            title: {
                text: '客户数量'                // y 轴标题
            }
        },
        title: {
            text: '客户流失图'
        },
        subtitle: {
            text: '可通过滑动下方滑块测试'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        series: [{
            name: '已流失客户',
            data: sum1
        }, {
            name: '未流失客户',
            data: sum2
        }]
    });
    function showValues() {
        $('#alpha-valuex2').html(chart.options.chart.options3d.alpha);
        $('#beta-valuex2').html(chart.options.chart.options3d.beta);
        $('#depth-valuex2').html(chart.options.chart.options3d.depth);
    }
    // Activate the sliders
    $('#slidersx2 input').on('input change', function () {
        chart.options.chart.options3d[this.id] = this.value;
        showValues();
        chart.redraw(false);
    });
    showValues();
});
</script>
</body>
</html>