<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />

<link rel="stylesheet" href="plugins/layer/theme/default/layer.css" />
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							
						<!-- 检索  -->
						<form action="project/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker"
								 name="lastStart" id="lastStart"  value="${pd.lastStart }" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" 
								 style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastEnd" name="lastEnd"  value="${pd.lastEnd }" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
<!-- 								<td style="vertical-align:top;padding-left:2px;"> -->
<!-- 								 	<select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align:top;width: 120px;"> -->
<!-- 									<option value=""></option> -->
<!-- 									<option value="">全部</option> -->
<!-- 									<option value="">1</option> -->
<!-- 									<option value="">2</option> -->
<!-- 								  	</select> -->
<!-- 								</td> -->
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="STATUS" id="STATUS" data-placeholder="状态" style="vertical-align:top;width: 120px;">
									<option value="">全部</option>
									<option value="0" <c:if test="${pd.STATUS == '0' }">selected</c:if> >待审核</option>
									<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if> >通过</option>
									<option value="2" <c:if test="${pd.STATUS == '2' }">selected</c:if> >拒绝</option>
								  	</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="research();"  title="清空">
								<i id="" class="ace-icon fa  bigger-110  blue">清空</i></a></td>
								</c:if>
								<c:if test="${QX.PURCHASE_ORDER == 1 }">
									<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="fromExcel();" title="设备采购单申请"><i id="nav-search-icon" class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue" > 设备采购单</i></a></td>
								</c:if>
<%-- 								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if> --%>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">项目名称</th>
<!-- 									<th class="center">项目简介</th> -->
<!-- 									<th class="center">省份ID</th> -->
<!-- 									<th class="center">行业ID</th> -->
									<th class="center">行业名称</th>
									<th class="center">项目状态</th>
									<th class="center">数量</th>
									<th class="center">项目预算(万)</th>
									<th class="center" style="width: 120px;">预计使用设备型号</th>
									<th class="center">省份</th>
<!-- 									<th class="center">区域ID</th> -->
									<th class="center">区域名称</th>
									<th class="center">最终客户</th>
									<th class="center">竞争对手</th>
									<th class="center">预计投标时间</th>
									<th class="center">设备采购单</th>
<!-- 									<th class="center">预计使用设备型号ID</th> -->
									<th class="center">项目负责人姓名</th>
									<th class="center">手机</th>
<!-- 									<th class="center">备注</th> -->
									<th class="center">报备时间</th>
									<th class="center">审批状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.PROJECT_ID}" project_name="${var.PROJECT_NAME}" project_type="${var.PROJECT_TYPE}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>
											<a  onclick="siMenu('z41','lm40','项目报备','<%=basePath%>project/goViewProject.do?PROJECT_ID=${var.PROJECT_ID}')" style="cursor:pointer;">${var.PROJECT_NAME}</a></td>
<%-- 											<td class='center'>${var.DETAILS}</td> --%>
<%-- 											<td class='center'>${var.PROVINCE_ID}</td> --%>
<%-- 											<td class='center'>${var.BUSINESS_ID}</td> --%>
											<td class='center' >${var.BUSINESS_NAME}</td>
											<td class='center'>${var.PROJECT_TYPE}</td>
											<td class='center'>${var.BID_NUM}</td>
											<td class='center'>${var.BUDGET}</td>
											<td class='center'>${var.MODEL_NAME}</td>
											<td class='center'>${var.PROVINCE_NAME}</td>
											<td class='center'>${var.AREA_NAME}</td>
											<td class='center'>${var.CLIENT}</td>
											<td class='center'>${var.OPPONENT}</td>
											<td class='center'>${var.BID_TIME}</td>
											<td class='center'>
											<c:if test="${empty  var.PURCHASE_ORDER}">
												--
											</c:if>
											<c:if test="${not empty var.PURCHASE_ORDER}">
												<a style="cursor:pointer;" onclick="window.location.href='<%=basePath%>/fhfile/downloadAll.do?FHFILE_ID=${var.PURCHASE_ORDER}&key=${var.PROJECT_NAME}_采购单'" class="tooltip-success" data-rel="tooltip" title="下载">
													<span class="green">
														<i class="ace-icon fa fa-cloud-download bigger-120"></i>
													</span>
												</a>
											</c:if>
											</td>
											<td class='center'>${var.LEADER_NAME}</td>
											<td class='center'>${var.LEADER_PHONE}</td>
											<td class='center'>${var.CREATE_TIME}</td>
											<td class='center'>
												<c:if test="${var.STATUS == '0' }"><span class="label label-info arrowed">待审核</span></c:if>
												<c:if test="${var.STATUS == '1' }"><span class="label label-success arrowed">通过</span></c:if>
												<c:if test="${var.STATUS == '2' }"><span class="label label-warning arrowed-in">拒绝</span></c:if>
												<c:if test="${ empty var.STATUS }"><span class="label label-warning arrowed-in">未申请</span></c:if>
											</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.applyCheck == 1 }">
													<a class="btn btn-xs btn-info" title='申请授权审核' onclick="checkProjectApply('${var.PROJECT_ID}');">
														<i class="ace-icon fa fa-flag bigger-120" title="申请授权审核">审核</i>
													</a>
													</c:if>
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑"  onclick="siMenu('z41','lm40','项目报备','<%=basePath%>project/goEditProject.do?PROJECT_ID=${var.PROJECT_ID}')" >
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.PROJECT_ID}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;"
																 onclick="siMenu('z41','lm40','项目报备','<%=basePath%>project/goAddProject.do?PROJECT_ID=${var.PROJECT_ID}')" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.PROJECT_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-mini btn-success" target="mainFrame" style="cursor:pointer;"  onclick="siMenu('z41','lm40','项目报备','<%=basePath%>project/goAddProject.do')">新增项目</a>
									</c:if>
									<c:if test="${QX.feedBack == 1 }">
									<a class="btn btn-mini btn-success" target="mainFrame" style="cursor:pointer;"  onclick="addProjectfeedback()">新增项目反馈</a>
									</c:if>
<%-- 									<c:if test="${QX.feedBack == 1 }"> --%>
<!-- 									<a class="btn btn-mini btn-success" target="mainFrame" style="cursor:pointer;"  onclick="addProjectReport()">新增项目周报</a> -->
<%-- 									</c:if> --%>
									<c:if test="${QX.del == 1 }">
									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
									</c:if>
								</td>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						</form>
					
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
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--引入属于此页面的js -->
<!-- 	<script type="text/javascript" src="static/js/myjs/head.js"></script> -->
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/layer/layer.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		function research(){
			$("#nav-search-input").val("");
			$("#lastStart").val("");
			$("#lastEnd").val("");
			$("#STATUS").val("");
			tosearch();
		}
		
		function siMenu(id,fid,MENU_NAME,MENU_URL){
			$("#"+fid).attr("class","active open");
			$("#"+id).attr("class","active");
			top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
		}
		
		//打开上传excel页面
		function fromExcel(){
			var str = '';
			var num = 0;
			var name = "";
			var type= '';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
			  if(document.getElementsByName('ids')[i].checked){
				  if(num == 1){
					  layer.msg("只能选择一个项目");
					  return;
				  }
			  	str = document.getElementsByName('ids')[i].value;
			  	name = document.getElementsByName('ids')[i].getAttribute("project_name");
			  	type = document.getElementsByName('ids')[i].getAttribute("project_type");
			  	num += 1;
			  }
			}
			if(str==''){
				layer.msg("请选择项目");
				return;
			}
// 			layer.msg(name);return;
			if(type != "中标"){
				layer.msg("请选择中标的项目");
				return;
			}
			
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="上传设备采购清单";
			 diag.URL = '<%=basePath%>project/goUploadExcel.do?PROJECT_ID='+str+'&PROJECT_NAME='+name;
			 diag.Width = 600;
			 diag.Height = 200;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}	
		
		//新增项目反馈
	 function addProjectfeedback(){
			var str = '';
			var num = 0;
			var name = "";
			var type= '';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
			  if(document.getElementsByName('ids')[i].checked){
				  if(num == 1){
					  layer.msg("只能选择一个项目");
					  return;
				  }
			  	str = document.getElementsByName('ids')[i].value;
			  	name = document.getElementsByName('ids')[i].getAttribute("project_name");
			  	type = document.getElementsByName('ids')[i].getAttribute("project_type");
			  	num += 1;
			  }
			}
			if(str==''){
				layer.msg("请选择项目");
				return;
			}
// 			layer.msg(name);return;
			if(type != "未中标"){
				layer.msg("请选择未中标的项目");
				return;
			}
			
			var flag = checkName(name);
			if(! flag){
				 layer.msg("项目【"+name+"】未中标反馈已存在");
				 return;
			}
			
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>projectfeedback/goAdd.do?PROJECT_ID='+str+'&PROJECT_NAME='+name;
			 diag.Width = 600;
			 diag.Height = 455;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 tosearch();
					 }else{
						 tosearch();
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//新增项目周报
		function addProjectReport(){
			var str = '';
			var num = 0;
			var name = "";
			var type= '';
			for(var i=0;i < document.getElementsByName('ids').length;i++){
			  if(document.getElementsByName('ids')[i].checked){
				  if(num == 1){
					  layer.msg("只能选择一个项目");
					  return;
				  }
			  	str = document.getElementsByName('ids')[i].value;
			  	name = document.getElementsByName('ids')[i].getAttribute("project_name");
			  	type = document.getElementsByName('ids')[i].getAttribute("project_type");
			  	num += 1;
			  }
			}
			if(str==''){
				layer.msg("请选择项目");
				return;
			}
// 			layer.msg(name);return;
// 			if(type != "未中标"){
// 				layer.msg("请选择未中标的项目");
// 				return;
// 			}
			
// 			if(!checkName(name)){
// 				 layer.msg("项目【"+name+"】未中标反馈已存在");
// 				 return;
// 			}
			
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>weeklyreport/goAdd.do?PROJECT_ID='+str+'&PROJECT_NAME='+name;
			 diag.Width = 600;
			 diag.Height = 455;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 tosearch();
					 }else{
						 tosearch();
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//判断名称是否存在
		function checkName(NAME){
			var flag = true;
			$.ajax({
				type: "POST",
				url: '<%=basePath%>projectfeedback/hasU.do',
		    	data:{ NAME:NAME,tm:new Date().getTime()},
				dataType:'json',
				async: false, //改为同步方式
				cache: false,
				success: function(data){
					 if("success" != data.result){
						 flag =  false;
					 }
				}
			});
			return flag;
		}
		
		function checkProjectApply(Id){
			layer.confirm('项目申请授权审核', {
				  title:"",
				  icon: 3,
				  btn: ['通过','拒绝'], //按钮
		          shadeClose: true, //点击遮罩关闭层 
				  btnAlign: 'c'
				}, function(){
					top.jzts();
					var url = "<%=basePath%>projectapply/checkProjectApply.do?PROJECT_ID="+Id+"&STATUS=1&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}, function(){
					top.jzts();
					var url =  "<%=basePath%>projectapply/checkProjectApply.do?PROJECT_ID="+Id+"&STATUS=2&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				});
			
		}
		
		$(function() {
		
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>project/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 tosearch();
					 }else{
						 tosearch();
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>project/delete.do?PROJECT_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						tosearch();
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>project/goEditProject.do?PROJECT_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 tosearch();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>project/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											tosearch();
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>project/excel.do';
		}
	</script>


</body>
</html>