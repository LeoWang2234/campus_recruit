<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>

<div id="chart" style="height:100%;width:100%"> </div>
<script>

	 var myChart = echarts.init(document.getElementById('chart'));
	 option = {
			 
				title : {
					text : '当前设备使用状态',
					subtext : '（单位：台）',
					x : 'center'
				},
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:['正常','维护','等待维修','正在维修','设备报废']
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
			    itemStyle : {
					normal : {
						color : function(params) {
							var colorList = [ '#00CC00','#E87C25','#C1232B','#00BBDD', '#B5C334', 
									'#27727B',  '#F3A43B', '#60C0DD',
									'#D7504B', '#C6E579', '#F4E001', '#F0805A',
									'#26C0C0' ];
							return colorList[params.dataIndex];
						}

					}
				},
			    series: [
			        {
			            name:'设备状态',
			            type:'pie',
			            selectedMode: 'single',
			            radius: [0, '30%'],
			            label: {
			                normal: {
			                    position: 'inner'
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			            data:[]
			        },
			        {
			            name:'设备状态',
			            type:'pie',
			            radius: ['40%', '55%'],

			            data:[]
			        }
			    ]
	 };
	 myChart.setOption(option);
	 $.ajax({
			type : "get",
			async : true,
			url : "${pageContext.request.contextPath}/charts/queryStateChart",
			dataType : "json",
			success : function(data) {
				//加载数据图表
				myChart.setOption({
					series : [ {
						data : data.inside
					},
					{
						data : data.outside
					}]
				});
			},
			error : function(errorMsg) {
				alert("图表加载失败!");
				myChart.hideLoading();
			}
		});
	 
</script>


