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
<script src="plugins/echarts/echarts.js"></script>
<script src="plugins/echarts/macarons.js"></script>
<script type="text/javascript">
setTimeout("top.hangge()",500);
</script>
<style type="text/css">
.btn.btn-app {
	margin-left: 20px;
}
</style>
<link rel="stylesheet" href="plugins/layer/theme/default/layer.css" />
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
							<c:if test="${QX.userCheck == 1 }">
							<a href="javascript:void(0)" onclick="siMenu('z125','lm40','待审核用户','user/listUsers.do?TYPE=2&STATUS=0')" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-user-plus bigger-230"></i>
								待审核用户
								<span class="badge badge-pink">+${pd.checkCount}</span>
							</a>
							</c:if>
							<c:if test="${QX.applyCheck == 1 }">
							<a href="javascript:void(0)" onclick="siMenu('z131','lm129','待审批项目','projectapply/list.do?STATUS=0')" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-tasks bigger-230"></i>
								待审批项目
								<span class="badge badge-danger">+${pd.proAppCheckCount}</span>
							</a>
							</c:if>
							
							<c:if test="${QX.userCheck == 1 }">
							<a href="javascript:void(0)" onclick="siMenu('z125','lm40','注册用户','user/listUsers.do?TYPE=2')" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-users bigger-230"> ${pd.registerCount}</i>
								注册用户
<!-- 								<span class="badge badge-warning">+11</span> -->
							</a>
							<a href="javascript:void(0)" onclick="siMenu('z125','lm40','系统用户','user/listUsers.do?TYPE=1')" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-user-circle-o bigger-230" aria-hidden="true"> ${pd.userCount}</i>
								系统用户
								<span class="label label-inverse arrowed-in"></span>
							</a>
							<a href="javascript:void(0)" onclick="siMenu('z20','lm1','在线管理','onlinemanager/list.do')" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa fa-comments-o bigger-230" id="onlineCount"> </i>
								在线用户
								<span class="label label-inverse arrowed-in"></span>
							</a>
							</c:if>
							
							<c:if test="${QX.feedBack == 1 }">
							<a href="javascript:void(0)" onclick="siMenu('z41','lm40','新增项目','http://localhost:8080/MVNFHM/project/goAddProject.do')" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-plus bigger-230"> </i>
								新增项目
								<span class="badge badge-warning badge-left"></span>
							</a>
							
							<a href="javascript:void(0)" class="btn btn-app btn-info btn-sm no-radius" onclick="editStock(${pd.stock})" style="width: 180px;" title="点击编辑库存">
								<i class="ace-icon fa fa-pencil-square-o bigger-230" id="stock_js"> ${pd.stock}</i>
								库存
								<span class="badge badge-warning badge-left"></span>
							</a>
							
							<a href="javascript:void(0)" onclick="siMenu('z134','lm129','待添加周报列表','weeklyreport/list.do?STATUS=0')" class="btn btn-app btn-info btn-sm no-radius" style="width: 180px;">
								<i class="ace-icon fa fa-pencil-square-o bigger-230"></i>
								待提交周报
								<span class="badge badge-warning badge-right">+${pd.proReportCount}</span>
							</a>
							</c:if>
							
						</div>
					</div><!-- /row -->
					
					<div class="space-12"></div>
					<div class="row">
						<p></p>
						<div class="col-sm-6 widget-container-span ui-sortable">
							<div class="widget-box transparent">
								<div class="widget-header">
									<h4 class="lighter">项目报备状态分布</h4>
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
	<script type="text/javascript" charset="utf-8" src="plugins/layer/layer.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
		
		function editStock(num){
			layer.prompt({title: '更新库存', value: num,formType: 0}, function(stock, index){
			   if(isNaN(stock)){
				  layer.msg('请输入数字');
				  return;
			   }
			  $("#stock_js").html(stock);
			  layer.close(index);
			  
			var url = "<%=basePath%>company/updateStock.do?STOCK="+stock;
				$.get(url,function(data){
				});
			})
		}
		
		//初始化
		$(function(){
			online();
		});
		
		var websocketonline;//websocke对象
		var userCount = 0;	//在线总数
		function online(){
			if (window.WebSocket) {
				websocketonline = new WebSocket(encodeURI('ws://'+top.oladress)); //oladress在main.jsp页面定义
				websocketonline.onopen = function() {
					websocketonline.send('[QQ313596790]fhadmin');//连接成功
				};
				websocketonline.onerror = function() {
					//连接失败
				};
				websocketonline.onclose = function() {
					//连接断开
				};
				//消息接收
				websocketonline.onmessage = function(message) {
					var message = JSON.parse(message.data);
					if (message.type == 'count') {
						userCount = message.msg;
					}else if(message.type == 'userlist'){
						$("#userlist").html('');
						 $.each(message.list, function(i, user){
							 $("#userlist").append(
								'<tr>'+	 
									 '<td class="center">'+
										'<label><input type="checkbox" name="ids" value="'+user+'" class="ace" /><span class="lbl"></span></label>'+
									'</td>'+
									'<td class="center">'+(i+1)+'</td>'+
									'<td><a onclick="editUser(\''+user+'\')" style="cursor:pointer;">'+user+'</a></td>'+
									'<td class="center">'+
										'<button class="btn btn-mini btn-danger" onclick="goOutTUser(\''+user+'\')">强制下线</button>'+
									'</td>'+
								'</tr>'
							 );
							 userCount = i+1;
						 });
						 $("#onlineCount").html(userCount);
					}else if(message.type == 'addUser'){
						 $("#userlist").append(
							'<tr>'+	 
								 '<td class="center">'+
									'<label><input type="checkbox" name="ids" value="'+message.user+'" class="ace" /><span class="lbl"></span></label>'+
								'</td>'+
								'<td class="center">'+(userCount+1)+'</td>'+
								'<td><a onclick="editUser(\''+message.user+'\')" style="cursor:pointer;">'+message.user+'</a></td>'+
								'<td class="center">'+
									'<button class="btn btn-mini btn-danger" onclick="goOutTUser(\''+message.user+'\')">强制下线</button>'+
								'</td>'+
							'</tr>'
						);
						 userCount = userCount+1;
						 $("#onlineCount").html(userCount);
					}
				};
			}
		}
	</script>
	   <script type="text/javascript">
	   // 项目报备记录
	   var reportHistoryChart = echarts.init(document.getElementById('reportHistory'),"macarons");
	   option = {
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['新报备','审核通过','中标']
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
			        	name:"代理商",
			        	nameLocation:'end',//坐标轴名称显示位置。
			            type : 'category',
			            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
			            axisLabel : {//坐标轴刻度标签的相关设置。
			                interval:0,
			                rotate:"45"
			            }
			        }
			    ],
			    yAxis : [
			        {
			        	name:"单位：个",
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'新报备',
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
			            name:'审核通过',
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
			        },
			        {
			            name:'中标',
			            type:'bar',
			            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 122.3],
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
	   // 项目状态分布
	   option = {
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient : 'vertical',
			        x : 'left',
			        data:['待审批','审批通过','审批不通过','报备失效','其他']
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
			            name:'报备状态',
			            type:'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:335, name:'待审批'},
			                {value:310, name:'审批通过'},
			                {value:234, name:'审批不通过'},
			                {value:135, name:'报备失效'},
			                {value:1548, name:'其他'}
			            ],
			            color:['#2ec0e8','#52be7f','#ff7474','#ffd03e','#b2b2b2']
			        }
			    ]
			};
	   var projectTypeChart = echarts.init(document.getElementById('projectType'),"macarons");                    
	   projectTypeChart.setOption(option);  
	   
	   </script>
	   
	    <script type="text/javascript">
	    // 项目赢率
	   option = {
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient : 'vertical',
			        x : 'left',
			        data:['0%-30%','30%-50%','50%-70%','70%以上']
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
			            name:'赢率分布',
			            type:'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:335, name:'0%-30%'},
			                {value:310, name:'30%-50%'},
			                {value:234, name:'50%-70%'},
			                {value:135, name:'70%以上'},
			            ],
			            color:['#2ec0e8','#ffd03e','#ff7474','#52be7f']
			        }
			    ]
			};
	   var projectRateChart = echarts.init(document.getElementById('projectRate'),"macarons");                    
	   projectRateChart.setOption(option);  
	   
	   </script>
	   <script type="text/javascript">
	   var fmid = "fhindex";	//菜单点中状态
	   var mid = "fhindex";	//菜单点中状态
	   function siMenu(id,fid,MENU_NAME,MENU_URL){
			if(id != mid){
				$("#"+mid).removeClass();
				mid = id;
			}
			if(fid != fmid){
				$("#"+fmid).removeClass();
				fmid = fid;
			}
			$("#"+fid).attr("class","active open");
			$("#"+id).attr("class","active");
			top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
			if(MENU_URL != "druid/index.html"){
				jzts();
			}
		}
	 //清除加载进度
	   function hangge(){
	   	$("#jzts").hide();
	   }

	   //显示加载进度
	   function jzts(){
	   	$("#jzts").show();
	   }
	   </script>
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
</body>
</html>