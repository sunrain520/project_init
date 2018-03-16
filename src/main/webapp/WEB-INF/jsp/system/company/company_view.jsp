<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	
	<!--查看图片插件 -->
	<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/zoomimage.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="plugins/zoomimage/css/custom.css" />
	<!--查看图片插件 -->

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
					
					<form action="company/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">名称:</td>
								<td><input type="text" name="COMPANY_NAME" id="COMPANY_NAME" value="${pd.COMPANY_NAME}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">注册资本:</td>
								<td><input type="number" name="REGISTERED_CAPITAL" id="REGISTERED_CAPITAL" value="${pd.REGISTERED_CAPITAL}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">统一社会信用代码:</td>
								<td><input type="text" name="CREDIT_CODE" id="CREDIT_CODE" value="${pd.CREDIT_CODE}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">办公地址:</td>
								<td><input type="text" name="ADDR" id="ADDR" value="${pd.ADDR}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">网站:</td>
								<td><a href="http://${pd.WEB_SITES}" target="_blank">${pd.WEB_SITES}</a>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省份名称:</td>
								<td><input type="text" name="PROVINCE_NAME" id="PROVINCE_NAME" value="${pd.PROVINCE_NAME}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">营业执照:</td>
								<td>
								<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.LICENSE}" title="[营业执照]" class="bwGal">
								<img src="<%=basePath%>uploadFiles/uploadImgs/${pd.LICENSE}" alt="[营业执照]" width="100"></a>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经营范围:</td>
								<td><input type="text" name="BUSINESS_SCOPE" id="BUSINESS_SCOPE" value="${pd.BUSINESS_SCOPE}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">盖章的开票信息:</td>
								<td>
								<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.BILLING}" title="[盖章的开票信息]" class="bwGal">
								<img src="<%=basePath%>uploadFiles/uploadImgs/${pd.BILLING}" alt="[盖章的开票信息]" width="100"></a>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">法人姓名:</td>
								<td><input type="text" name="LEGAL_PERSON" id="LEGAL_PERSON" value="${pd.LEGAL_PERSON}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">法人手机号:</td>
								<td><input type="text" name="LEGAL_PHONE" id="LEGAL_PHONE" value="${pd.LEGAL_PHONE}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">法人身份证:</td>
								<td>
								<a href="<%=basePath%>uploadFiles/uploadImgs/${pd.LEGAL_NO}" title="[法人身份证]" class="bwGal">
								<img src="<%=basePath%>uploadFiles/uploadImgs/${pd.LEGAL_NO}" alt="[法人身份证]" width="100"></a>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}"  readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人手机:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}"  readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人邮箱:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">库存:</td>
								<td><input type="text" name="STOCK" id="STOCK" value="${pd.STOCK}" readonly="readonly" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">注册时间:</td>
								<td><input type="text" name="REGTIME" id="REGTIME" value="${pd.REGTIME}" readonly="readonly" style="width:98%;"/></td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<script type="text/javascript" src="plugins/zoomimage/js/jquery.js"></script>
	<script type="text/javascript" src="plugins/zoomimage/js/eye.js"></script>
	<script type="text/javascript" src="plugins/zoomimage/js/utils.js"></script>
	<script type="text/javascript" src="plugins/zoomimage/js/zoomimage.js"></script>
	<script type="text/javascript" src="plugins/zoomimage/js/layout.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		//判断名称是否存在
		function hasU(){
			var NAME = $.trim($("#NAME").val());
			$.ajax({
				type: "POST",
				url: '<%=basePath%>company/hasU.do',
		    	data:{ NAME:NAME,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					 }else{
						 $("#NAME").tips({
								side:4,
					            msg:'此名称已存在',
					            bg:'#AE81FF',
					            time:2
					        });
							$("#NAME").focus();
							return false;
					 }
				}
			});
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
