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

<!--查看图片插件 -->
<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/zoomimage.css" />
<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/custom.css" />
<link rel="stylesheet" href="plugins/layer/theme/default/layer.css" />
<!--查看图片插件 -->

<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
						<form action="company/list.do" method="post" name="Form" id="Form">
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
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
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
									<th class="center">公司名称</th>
									<th class="center">注册资本</th>
									<th class="center">统一社会信用代码</th>
<!-- 									<th class="center">办公地址</th> -->
<!-- 									<th class="center">公司网站</th> -->
<!-- 									<th class="center">省份ID</th> -->
									<th class="center">省份</th>
									<th class="center">营业执照</th>
									<th class="center">经营范围</th>
									<th class="center">盖章的开票信息</th>
									<th class="center">库存</th>
									<th class="center">法人姓名</th>
									<th class="center">法人手机号</th>
									<th class="center">法人身份证</th>
									<th class="center">联系人</th>
									<th class="center">联系人手机</th>
									<th class="center">联系人邮箱</th>
									<th class="center">注册时间</th>
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
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.COMPANY_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'><a onclick="viewCompany('${var.COMPANY_ID}')" style="cursor:pointer;">${var.COMPANY_NAME }</a></td>
											<td class='center'>${var.REGISTERED_CAPITAL}</td>
											<td class='center'>${var.CREDIT_CODE}</td>
<%-- 											<td class='center'>${var.ADDR}</td> --%>
<%-- 											<td class='center'><a href="http://${var.WEB_SITES}" target="_blank">${var.WEB_SITES}</a></td> --%>
											<td class='center'>${var.PROVINCE_NAME}</td>
											<td class="center">
											<a href="<%=basePath%>uploadFiles/uploadImgs/${var.LICENSE}" title="[营业执照]" class="bwGal">
											<img src="<%=basePath%>uploadFiles/uploadImgs/${var.LICENSE}" alt="[营业执照]" width="100"></a>
											</td>
											<td class='center'>${var.BUSINESS_SCOPE}</td>
											<td class="center">
											<a href="<%=basePath%>uploadFiles/uploadImgs/${var.BILLING}" title="[盖章的开票信息]" class="bwGal">
											<img src="<%=basePath%>uploadFiles/uploadImgs/${var.BILLING}" alt="[盖章的开票信息]" width="100"></a>
											</td>
											<td class='center'>${var.STOCK}</td>
											<td class='center'>${var.LEGAL_PERSON}</td>
											<td class='center'>${var.LEGAL_PHONE}</td>
											<td class="center">
											<a href="<%=basePath%>uploadFiles/uploadImgs/${var.LEGAL_NO}" title="[法人身份证]" class="bwGal">
											<img src="<%=basePath%>uploadFiles/uploadImgs/${var.LEGAL_NO}" alt="[法人身份证]" width="100"></a>
											</td>
											<td class='center'>${var.NAME}</td>
											<td class='center'>${var.PHONE}</td>
											<td class='center'>${var.EMAIL}</td>
											<td class='center'>${var.REGTIME}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${var.COMPANY_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${var.COMPANY_ID}');">
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
																<a style="cursor:pointer;" onclick="edit('${var.COMPANY_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${var.COMPANY_ID}');" class="tooltip-error" data-rel="tooltip" title="删除">
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
<%-- 									<c:if test="${QX.add == 1 }"> --%>
<!-- 									<a class="btn btn-mini btn-success" onclick="add();">新增</a> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${QX.del == 1 }"> --%>
<!-- 									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a> -->
<%-- 									</c:if> --%>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" charset="utf-8" src="plugins/layer/layer.js"></script>
	
	<script type="text/javascript" src="plugins/zoomimage/js/jquery.js"></script>
	<script type="text/javascript" src="plugins/zoomimage/js/eye.js"></script>
	<script type="text/javascript" src="plugins/zoomimage/js/utils.js"></script>
	<script type="text/javascript" src="plugins/zoomimage/js/zoomimage.js"></script>
	<script type="text/javascript" src="plugins/zoomimage/js/layout.js"></script>
	
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
		});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>company/goAdd.do';
			 diag.Width = 800;
			 diag.Height = 600;
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
			if(confirm("确定要删除?")){ 
				top.jzts();
				var url = "<%=basePath%>company/delete.do?COMPANY_ID="+Id+"&tm="+new Date().getTime();
				$.get(url,function(data){
					tosearch();
				});
			}
		}
		//查看
		function viewCompany(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>company/goView.do?COMPANY_ID='+Id;
			 diag.Width = 800;
			 diag.Height = 600;
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

		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>company/goEdit.do?COMPANY_ID='+Id;
			 diag.Width = 800;
			 diag.Height = 600;
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
								url: '<%=basePath%>company/deleteAll.do?tm='+new Date().getTime(),
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
			window.location.href='<%=basePath%>company/excel.do';
		}
	</script>


	<style type="text/css">
	li {list-style-type:none;}
	</style>
	<ul class="navigationTabs">
           <li><a></a></li>
           <li></li>
       </ul>
       
       </body>
</html>