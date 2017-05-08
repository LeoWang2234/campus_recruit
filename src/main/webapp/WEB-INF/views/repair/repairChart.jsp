<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<div class="btn-group" style="margin-bottom:10px">
	<button type="button" class="btn btn-default active repairChart" value = "1">本周</button>
	<button type="button" class="btn btn-default repairChart" value = "2">本月</button>
	<button type="button" class="btn btn-default repairChart" value = "3">今年</button>
</div>
<div id="chart" style="height:90%;width:100%"> </div>
<script>

	 var myChart = echarts.init(document.getElementById('chart'));
	 option = {
			    title: {
			        text: '维护历史统计',
		        	subtext : '（单位：台）',
					x : 'center'
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['维护台数'],
			        x: 'left'
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    backgroundColor: 'transparent',
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
			    xAxis: {
			        type: 'category',
			        boundaryGap: false,
			        data: []
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [
			        {
			            name:'维护台数',
			            type:'line',
			            stack: '总量',
			            data:[]
			        }
			    ]
			};
	 $(function() {
		 myChart.setOption(option);
		 queryRepairChart(1);
		});
	 $(".repairChart").click(function(event){
		 $(this).addClass("active").siblings().removeClass("active");
		 queryRepairChart($(this).val());
	 });
		 
	 
	 
	 //time 1本周2本月3本年
	 function queryRepairChart(time){
		 
		 $.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/charts/queryRepairChart",
				data: {time: time},
				success : function(data) {
					//加载数据图表
					myChart.setOption({
						xAxis: {
							data : data.name
						},
						series : [ {
							data : data.value
						}]
					});
				},
				error : function(errorMsg) {
					alert("图表加载失败!");
					myChart.hideLoading();
				}
			});
	 }
	 
	 
</script>


