<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>

<!-- 设备类型图 -->
<div id="chart" style="width:100%;height:100%;"></div>
<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('chart'));
	option = {
		title : {
			text : '设备类型分布图',
			subtext : '（单位：台）',
			x : 'center'
		},
		tooltip : {
			trigger : 'axis',
			axisPointer : {
				type : 'shadow'
			}
		},
		grid : {
			left : '3%',
			right : '4%',
			bottom : '3%',
			containLabel : true
		},
		xAxis : [ {
			type : 'category',
			data : [],
			axisTick : {
				alignWithLabel : true
			},
			name : '设备\n类型'
		} ],
		yAxis : [ {
			type : 'value',
			name : '设备台数'
		} ],
		series : [ {
			name : '设备台数',
			type : 'bar',
			barWidth : '40%',
			data : []
		}, ],
		itemStyle : {
			normal : {
				color : function(params) {
					var colorList = [ '#C1232B', '#B5C334', '#E87C25',
							'#27727B', '#9BCA63', '#F3A43B', '#60C0DD',
							'#D7504B', '#C6E579', '#F4E001', '#F0805A',
							 ];
					return colorList[params.dataIndex];
				}

			}
		},
		toolbox: {
	        show : true,
	        feature : {
	            mark : {show: true},
	            dataView : {show: true, readOnly: false},
	            magicType : {
	                show: true,
	                type: ['pie', 'funnel']
	            },
	            restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
		label : {
			normal : {
				show : true,
				position : 'top',
				formatter : '{b}\n共{c}台'
			}
		}
	};
	myChart.setOption(option);

	var names = [];
	var values = [];

	$.ajax({
		type : "get",
		async : true,
		url : "${pageContext.request.contextPath}/charts/queryTypeChart",
		dataType : "json",
		success : function(data) {
			$.each(data.names, function(j, val) {

				names.push(val.typeName);
			});
			$.each(data.values, function(j, val) {

				values.push(val.typeValue);
			});
			//加载数据图表
			myChart.setOption({
				xAxis : {
					data : names
				},
				series : [ {
					data : values
				} ]
			});
		},
		error : function(errorMsg) {
			alert("图表加载失败!");
			myChart.hideLoading();
		}
	});
</script>


