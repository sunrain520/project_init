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
					
					<form action="projectreport/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PROJECTREPORT_ID" id="PROJECTREPORT_ID" value="${pd.PROJECTREPORT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目名称:</td>
								<td><input type="text" name="PROJECT_NAME" id="PROJECT_NAME" value="${pd.PROJECT_NAME}" maxlength="255" placeholder="这里输入项目名称" title="项目名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目简介:</td>
								<td><input type="text" name="PROJECT_MSG" id="PROJECT_MSG" value="${pd.PROJECT_MSG}" maxlength="255" placeholder="这里输入项目简介" title="项目简介" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最终客户:</td>
								<td><input type="text" name="CUSTOMER" id="CUSTOMER" value="${pd.CUSTOMER}" maxlength="255" placeholder="这里输入最终客户" title="最终客户" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所在区域:</td>
								<td><input type="text" name="AREA_ID" id="AREA_ID" value="${pd.AREA_ID}" maxlength="255" placeholder="这里输入所在区域" title="所在区域" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">区域名称:</td>
								<td><input type="text" name="AREA_NAME" id="AREA_NAME" value="${pd.AREA_NAME}" maxlength="255" placeholder="这里输入区域名称" title="区域名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省份id:</td>
								<td><input type="text" name="PROVINCE_ID" id="PROVINCE_ID" value="${pd.PROVINCE_ID}" maxlength="255" placeholder="这里输入省份id" title="省份id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省份名称:</td>
								<td><input type="text" name="PROVINCE_NAME" id="PROVINCE_NAME" value="${pd.PROVINCE_NAME}" maxlength="255" placeholder="这里输入省份名称" title="省份名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目所属行业:</td>
								<td><input type="text" name="INDUSTRY_ID" id="INDUSTRY_ID" value="${pd.INDUSTRY_ID}" maxlength="255" placeholder="这里输入项目所属行业" title="项目所属行业" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目所属行业:</td>
								<td><input type="text" name="INDUSTRY_NAME" id="INDUSTRY_NAME" value="${pd.INDUSTRY_NAME}" maxlength="255" placeholder="这里输入项目所属行业" title="项目所属行业" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">当前项目状态:</td>
								<td><input type="text" name="STATUS_ID" id="STATUS_ID" value="${pd.STATUS_ID}" maxlength="255" placeholder="这里输入当前项目状态" title="当前项目状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">当前项目状态:</td>
								<td><input type="text" name="STATUS_NAME" id="STATUS_NAME" value="${pd.STATUS_NAME}" maxlength="255" placeholder="这里输入当前项目状态" title="当前项目状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目预算:</td>
								<td><input type="text" name="BUDGET" id="BUDGET" value="${pd.BUDGET}" maxlength="255" placeholder="这里输入项目预算" title="项目预算" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">预计竞争对手:</td>
								<td><input type="text" name="CONTEND" id="CONTEND" value="${pd.CONTEND}" maxlength="255" placeholder="这里输入预计竞争对手" title="预计竞争对手" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">预计投标时间:</td>
								<td><input type="text" name="BID_TIME" id="BID_TIME" value="${pd.BID_TIME}" maxlength="255" placeholder="这里输入预计投标时间" title="预计投标时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">预计使用设备型号:</td>
								<td><input type="text" name="MODEL" id="MODEL" value="${pd.MODEL}" maxlength="255" placeholder="这里输入预计使用设备型号" title="预计使用设备型号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">预计设备使用数量:</td>
								<td><input type="text" name="NUM" id="NUM" value="${pd.NUM}" maxlength="255" placeholder="这里输入预计设备使用数量" title="预计设备使用数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目负责人姓名:</td>
								<td><input type="text" name="DUTY_NAME" id="DUTY_NAME" value="${pd.DUTY_NAME}" maxlength="255" placeholder="这里输入项目负责人姓名" title="项目负责人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入手机" title="手机" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建人:</td>
								<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="255" placeholder="这里输入创建人" title="创建人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建人名称:</td>
								<td><input type="text" name="USER_NAME" id="USER_NAME" value="${pd.USER_NAME}" maxlength="255" placeholder="这里输入创建人名称" title="创建人名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
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
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#PROJECT_NAME").val()==""){
				$("#PROJECT_NAME").tips({
					side:3,
		            msg:'请输入项目名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECT_NAME").focus();
			return false;
			}
			if($("#PROJECT_MSG").val()==""){
				$("#PROJECT_MSG").tips({
					side:3,
		            msg:'请输入项目简介',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECT_MSG").focus();
			return false;
			}
			if($("#CUSTOMER").val()==""){
				$("#CUSTOMER").tips({
					side:3,
		            msg:'请输入最终客户',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUSTOMER").focus();
			return false;
			}
			if($("#AREA_ID").val()==""){
				$("#AREA_ID").tips({
					side:3,
		            msg:'请输入所在区域',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AREA_ID").focus();
			return false;
			}
			if($("#AREA_NAME").val()==""){
				$("#AREA_NAME").tips({
					side:3,
		            msg:'请输入区域名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AREA_NAME").focus();
			return false;
			}
			if($("#PROVINCE_ID").val()==""){
				$("#PROVINCE_ID").tips({
					side:3,
		            msg:'请输入省份id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVINCE_ID").focus();
			return false;
			}
			if($("#PROVINCE_NAME").val()==""){
				$("#PROVINCE_NAME").tips({
					side:3,
		            msg:'请输入省份名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVINCE_NAME").focus();
			return false;
			}
			if($("#INDUSTRY_ID").val()==""){
				$("#INDUSTRY_ID").tips({
					side:3,
		            msg:'请输入项目所属行业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INDUSTRY_ID").focus();
			return false;
			}
			if($("#INDUSTRY_NAME").val()==""){
				$("#INDUSTRY_NAME").tips({
					side:3,
		            msg:'请输入项目所属行业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#INDUSTRY_NAME").focus();
			return false;
			}
			if($("#STATUS_ID").val()==""){
				$("#STATUS_ID").tips({
					side:3,
		            msg:'请输入当前项目状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS_ID").focus();
			return false;
			}
			if($("#STATUS_NAME").val()==""){
				$("#STATUS_NAME").tips({
					side:3,
		            msg:'请输入当前项目状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS_NAME").focus();
			return false;
			}
			if($("#BUDGET").val()==""){
				$("#BUDGET").tips({
					side:3,
		            msg:'请输入项目预算',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BUDGET").focus();
			return false;
			}
			if($("#CONTEND").val()==""){
				$("#CONTEND").tips({
					side:3,
		            msg:'请输入预计竞争对手',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONTEND").focus();
			return false;
			}
			if($("#BID_TIME").val()==""){
				$("#BID_TIME").tips({
					side:3,
		            msg:'请输入预计投标时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BID_TIME").focus();
			return false;
			}
			if($("#MODEL").val()==""){
				$("#MODEL").tips({
					side:3,
		            msg:'请输入预计使用设备型号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODEL").focus();
			return false;
			}
			if($("#NUM").val()==""){
				$("#NUM").tips({
					side:3,
		            msg:'请输入预计设备使用数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NUM").focus();
			return false;
			}
			if($("#DUTY_NAME").val()==""){
				$("#DUTY_NAME").tips({
					side:3,
		            msg:'请输入项目负责人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DUTY_NAME").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入手机',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#REMARK").val()==""){
				$("#REMARK").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARK").focus();
			return false;
			}
			if($("#USER_ID").val()==""){
				$("#USER_ID").tips({
					side:3,
		            msg:'请输入创建人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_ID").focus();
			return false;
			}
			if($("#USER_NAME").val()==""){
				$("#USER_NAME").tips({
					side:3,
		            msg:'请输入创建人名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_NAME").focus();
			return false;
			}
		    if($("#PROJECTREPORT_ID").val()==""){
				hasU();
			}else{
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		//判断名称是否存在
		function hasU(){
			var NAME = $.trim($("#NAME").val());
			$.ajax({
				type: "POST",
				url: '<%=basePath%>projectreport/hasU.do',
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
		
</body>
</html>
