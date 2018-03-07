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
					
					<form action="projectfeedback/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PROJECTFEEDBACK_ID" id="PROJECTFEEDBACK_ID" value="${pd.PROJECTFEEDBACK_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:110px;text-align: right;padding-top: 13px;">项目名称:</td>
								<td><input type="text" name="PROJECT_NAME" id="PROJECT_NAME" value="${pd.PROJECT_NAME}" maxlength="255" readonly="readonly" title="项目名称" style="width:98%;"/></td>
								<input type="hidden" name="PROJECT_ID" id="PROJECT_ID" value="${pd.PROJECT_ID}"/>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">中标厂家:</td>
								<td><input type="text" name="COMPANY_NAME" id="COMPANY_NAME" value="${pd.COMPANY_NAME}" maxlength="255" placeholder="这里输入中标厂家" title="中标厂家" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">中标金额:</td>
								<td><input type="number" name="MONEY" id="MONEY" value="${pd.MONEY}" maxlength="32" placeholder="这里输入中标金额" title="中标金额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">中标设备型号:</td>
								<td><input type="text" name="MODEL" id="MODEL" value="${pd.MODEL}" maxlength="255" placeholder="这里输入中标设备型号" title="中标设备型号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">中标设备数量:</td>
								<td><input type="number" name="NUM" id="NUM" value="${pd.NUM}" maxlength="32" placeholder="这里输入中标设备数量" title="中标设备数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目丢标原因:</td>
								<td><input type="text" name="REASON" id="REASON" value="${pd.REASON}" maxlength="255" placeholder="这里输入项目丢标原因" title="项目丢标原因" style="width:98%;"/></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<td style="width:75px;text-align: right;padding-top: 13px;">反馈人ID:</td> -->
<%-- 								<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="255" placeholder="这里输入反馈人ID" title="反馈人ID" style="width:98%;"/></td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td style="width:75px;text-align: right;padding-top: 13px;">反馈人名称:</td> -->
<%-- 								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="255" placeholder="这里输入反馈人名称" title="反馈人名称" style="width:98%;"/></td> --%>
<!-- 							</tr> -->
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input  name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间" style="width:98%;"/></td>
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
			
			if($("#COMPANY_NAME").val()==""){
				$("#COMPANY_NAME").tips({
					side:3,
		            msg:'请输入中标厂家',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANY_NAME").focus();
			return false;
			}
			if($("#MONEY").val()==""){
				$("#MONEY").tips({
					side:3,
		            msg:'请输入中标金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MONEY").focus();
			return false;
			}
			if($("#MODEL").val()==""){
				$("#MODEL").tips({
					side:3,
		            msg:'请输入中标设备型号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODEL").focus();
			return false;
			}
			if($("#NUM").val()==""){
				$("#NUM").tips({
					side:3,
		            msg:'请输入中标设备数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NUM").focus();
			return false;
			}
			if($("#REASON").val()==""){
				$("#REASON").tips({
					side:3,
		            msg:'请输入项目丢标原因',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REASON").focus();
			return false;
			}
			
		    if($("#PROJECTFEEDBACK_ID").val()==""){
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
			var NAME = $.trim($("#PROJECT_NAME").val());
			$.ajax({
				type: "POST",
				url: '<%=basePath%>projectfeedback/hasU.do',
		    	data:{ NAME:NAME,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" == data.result){
						$("#Form").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
					 }else{
						 $("#PROJECT_NAME").tips({
								side:4,
					            msg:'此名称已存在',
					            bg:'#AE81FF',
					            time:2
					        });
							$("#PROJECT_NAME").focus();
							return false;
					 }
				}
			});
		}
		
	</script>
		
</body>
</html>
