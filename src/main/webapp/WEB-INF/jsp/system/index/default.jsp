<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 百度echarts -->
<script src="plugins/echarts/echarts.min.js"></script>
<script src="plugins/echarts/macarons.js"></script>
<script type="text/javascript">
setTimeout("top.hangge()",500);
</script>
<style type="text/css">
.btn.btn-app {
	margin-left: 20px;
}
</style>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					
					<div class="alert alert-block alert-success">
						<button type="button" class="close" data-dismiss="alert">
							<i class="ace-icon fa fa-times"></i>
						</button>
						<i class="ace-icon fa fa-check green"></i>
						欢迎使用项目报备管理系统
					</div>
					
					<div class="row">
						<div class="space-6"></div>

						<div class="col-sm-12 ">
							<a href="#" class="btn btn-app btn-default btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-cog bigger-230"></i>
								待审核用户
								<span class="badge badge-pink">+3</span>
							</a>
							
							<a href="#" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-envelope bigger-200"></i>
								待审核项目
								<span class="label label-inverse arrowed-in">6+</span>
							</a>
							
							<a href="#" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-envelope bigger-200"></i>
								库存
								<span class="label label-inverse arrowed-in">6+</span>
							</a>
							
							<a href="#" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-envelope bigger-200"></i>
								注册用户
								<span class="label label-inverse arrowed-in">6+</span>
							</a>
							
							<a href="#" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-envelope bigger-200"></i>
								库存
								<span class="label label-inverse arrowed-in">6+</span>
							</a>
							
							<a href="#" class="btn btn-app btn-primary btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-pencil-square-o bigger-230">多萨达</i>
								Edit
								<span class="badge badge-warning badge-left">11</span>
							</a>
						</div>
					</div><!-- /row -->
					
					<div class="space-12"></div>
					<div class="row">
						<p></p>
						<div class="col-sm-6 widget-container-span ui-sortable">
							<div class="widget-box transparent">
								<div class="widget-header">
									<h4 class="lighter">当前报备状态分布</h4>
								</div>

								<div class="widget-body">
									<div class="widget-main padding-6 no-padding-left no-padding-right">
										<div id="projectType" style="width: 100%;height:300px;"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 widget-container-span ui-sortable">
							<div class="widget-box transparent">
								<div class="widget-header">
									<h4 class="lighter">项目报备赢率分布</h4>
								</div>

								<div class="widget-body">
									<div class="widget-main padding-6 no-padding-left no-padding-right">
									<div id="projectRate" style="width: 100%;height:300px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="space-12"></div>
					<div class="row">
						<div class="col-sm-12 widget-container-span ui-sortable">
							<div class="widget-box transparent">
								<div class="widget-header">
									<h4 class="lighter">项目报备记录</h4>

								</div>

								<div class="widget-body">
									<div class="widget-main padding-6 no-padding-left no-padding-right">
										<div id="reportHistory" style="width: 100%;height:300px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12">
							<div id="main" style="width: 600px;height:300px;"></div>
						</div>
						<!-- /.col -->
					</div>
					
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
	</script>
	<script type="text/javascript">
       // 基于准备好的dom，初始化echarts实例
       var myChart = echarts.init(document.getElementById('main'),"macarons");
	       // 指定图表的配置项和数据
		var option = {
	           title: {
	               text: '用户统计'
	           },
	           tooltip: {},
	           xAxis: {
	               data: ["系统用户","注册用户"]
	           },
	           yAxis: {},
	           series: [
	              {
	               name: '',
	               type: 'bar',
	               data: [${pd.userCount},${pd.registerCount}],
	               itemStyle: {
	                   normal: {
	                       color: function(params) {
	                           // build a color map as your need.
	                           var colorList = ['#6FB3E0','#87B87F'];
	                           return colorList[params.dataIndex];
	                       }
	                   }
	               }
	              }
	           ]
	       };	        
	
	       // 使用刚指定的配置项和数据显示图表。
	       myChart.setOption(option);
	   </script>
	   
	   <script type="text/javascript">
	   var reportHistoryChart = echarts.init(document.getElementById('reportHistory'),"macarons");
	   option = {
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['蒸发量','降水量']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'蒸发量',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'降水量',
			            type:'bar',
			            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
			            markPoint : {
			                data : [
			                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},
			                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name : '平均值'}
			                ]
			            }
			        }
			    ]
			};
	   reportHistoryChart.setOption(option);                   
	   </script>
	   
	   <script type="text/javascript">
	   option = {
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient : 'vertical',
			        x : 'left',
			        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {
			                show: true, 
			                type: ['pie', 'funnel'],
			                option: {
			                    funnel: {
			                        x: '25%',
			                        width: '50%',
			                        funnelAlign: 'left',
			                        max: 1548
			                    }
			                }
			            },
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    series : [
			        {
			            name:'访问来源',
			            type:'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:335, name:'直接访问'},
			                {value:310, name:'邮件营销'},
			                {value:234, name:'联盟广告'},
			                {value:135, name:'视频广告'},
			                {value:1548, name:'搜索引擎'}
			            ]
			        }
			    ]
			};
	   var projectTypeChart = echarts.init(document.getElementById('projectType'),"macarons");                    
	   projectTypeChart.setOption(option);  
	   
	   </script>
	   
	    <script type="text/javascript">
	   option = {
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient : 'vertical',
			        x : 'left',
			        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {
			                show: true, 
			                type: ['pie', 'funnel'],
			                option: {
			                    funnel: {
			                        x: '25%',
			                        width: '50%',
			                        funnelAlign: 'left',
			                        max: 1548
			                    }
			                }
			            },
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    series : [
			        {
			            name:'访问来源',
			            type:'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:335, name:'直接访问'},
			                {value:310, name:'邮件营销'},
			                {value:234, name:'联盟广告'},
			                {value:135, name:'视频广告'},
			                {value:1548, name:'搜索引擎'}
			            ]
			        }
			    ]
			};
	   var projectRateChart = echarts.init(document.getElementById('projectRate'),"macarons");                    
	   projectRateChart.setOption(option);  
	   
	   </script>
	   
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
</body>
</html>