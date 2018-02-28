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
					
					<form action="project/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PROJECT_ID" id="PROJECT_ID" value="${pd.PROJECT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目简介:</td>
								<td><input type="text" name="DETAILS" id="DETAILS" value="${pd.DETAILS}" maxlength="500" placeholder="这里输入项目简介" title="项目简介" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最终客户:</td>
								<td><input type="text" name="CLIENT" id="CLIENT" value="${pd.CLIENT}" maxlength="255" placeholder="这里输入最终客户" title="最终客户" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省份ID:</td>
								<td><input type="text" name="PROVINCE_ID" id="PROVINCE_ID" value="${pd.PROVINCE_ID}" maxlength="255" placeholder="这里输入省份ID" title="省份ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省份:</td>
								<td><input type="text" name="PROVINCE_NAME" id="PROVINCE_NAME" value="${pd.PROVINCE_NAME}" maxlength="255" placeholder="这里输入省份" title="省份" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">区域ID:</td>
								<td><input type="text" name="AREA_ID" id="AREA_ID" value="${pd.AREA_ID}" maxlength="255" placeholder="这里输入区域ID" title="区域ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">区域名称:</td>
								<td><input type="text" name="AREA_NAME" id="AREA_NAME" value="${pd.AREA_NAME}" maxlength="255" placeholder="这里输入区域名称" title="区域名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">行业ID:</td>
								<td><input type="text" name="BUSINESS_ID" id="BUSINESS_ID" value="${pd.BUSINESS_ID}" maxlength="255" placeholder="这里输入行业ID" title="行业ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">行业名称:</td>
								<td><input type="text" name="BUSINESS_NAME" id="BUSINESS_NAME" value="${pd.BUSINESS_NAME}" maxlength="255" placeholder="这里输入行业名称" title="行业名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目状态:</td>
								<td><input type="text" name="PROJECT_TYPE" id="PROJECT_TYPE" value="${pd.PROJECT_TYPE}" maxlength="255" placeholder="这里输入项目状态" title="项目状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目预算:</td>
								<td><input type="text" name="BUDGET" id="BUDGET" value="${pd.BUDGET}" maxlength="255" placeholder="这里输入项目预算" title="项目预算" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">竞争对手:</td>
								<td><input type="text" name="OPPONENT" id="OPPONENT" value="${pd.OPPONENT}" maxlength="255" placeholder="这里输入竞争对手" title="竞争对手" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">预计投标时间:</td>
								<td><input class="span10 date-picker" name="BID_TIME" id="BID_TIME" value="${pd.BID_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="预计投标时间" title="预计投标时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">预计使用设备型号ID:</td>
								<td><input type="text" name="MODEL_ID" id="MODEL_ID" value="${pd.MODEL_ID}" maxlength="255" placeholder="这里输入预计使用设备型号ID" title="预计使用设备型号ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">预计使用设备型号:</td>
								<td><input type="text" name="MODEL_NAME" id="MODEL_NAME" value="${pd.MODEL_NAME}" maxlength="255" placeholder="这里输入预计使用设备型号" title="预计使用设备型号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">数量:</td>
								<td><input type="number" name="BID_NUM" id="BID_NUM" value="${pd.BID_NUM}" maxlength="32" placeholder="这里输入数量" title="数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目负责人姓名:</td>
								<td><input type="text" name="LEADER_NAME" id="LEADER_NAME" value="${pd.LEADER_NAME}" maxlength="255" placeholder="这里输入项目负责人姓名" title="项目负责人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机:</td>
								<td><input type="text" name="LEADER_PHONE" id="LEADER_PHONE" value="${pd.LEADER_PHONE}" maxlength="255" placeholder="这里输入手机" title="手机" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="BZ" id="BZ" value="${pd.BZ}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">报备时间:</td>
								<td><input class="span10 date-picker" name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="报备时间" title="报备时间" style="width:98%;"/></td>
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
			if($("#DETAILS").val()==""){
				$("#DETAILS").tips({
					side:3,
		            msg:'请输入项目简介',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DETAILS").focus();
			return false;
			}
			if($("#CLIENT").val()==""){
				$("#CLIENT").tips({
					side:3,
		            msg:'请输入最终客户',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLIENT").focus();
			return false;
			}
			if($("#PROVINCE_ID").val()==""){
				$("#PROVINCE_ID").tips({
					side:3,
		            msg:'请输入省份ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVINCE_ID").focus();
			return false;
			}
			if($("#PROVINCE_NAME").val()==""){
				$("#PROVINCE_NAME").tips({
					side:3,
		            msg:'请输入省份',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVINCE_NAME").focus();
			return false;
			}
			if($("#AREA_ID").val()==""){
				$("#AREA_ID").tips({
					side:3,
		            msg:'请输入区域ID',
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
			if($("#BUSINESS_ID").val()==""){
				$("#BUSINESS_ID").tips({
					side:3,
		            msg:'请输入行业ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BUSINESS_ID").focus();
			return false;
			}
			if($("#BUSINESS_NAME").val()==""){
				$("#BUSINESS_NAME").tips({
					side:3,
		            msg:'请输入行业名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BUSINESS_NAME").focus();
			return false;
			}
			if($("#PROJECT_TYPE").val()==""){
				$("#PROJECT_TYPE").tips({
					side:3,
		            msg:'请输入项目状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECT_TYPE").focus();
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
			if($("#OPPONENT").val()==""){
				$("#OPPONENT").tips({
					side:3,
		            msg:'请输入竞争对手',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPPONENT").focus();
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
			if($("#MODEL_ID").val()==""){
				$("#MODEL_ID").tips({
					side:3,
		            msg:'请输入预计使用设备型号ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODEL_ID").focus();
			return false;
			}
			if($("#MODEL_NAME").val()==""){
				$("#MODEL_NAME").tips({
					side:3,
		            msg:'请输入预计使用设备型号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MODEL_NAME").focus();
			return false;
			}
			if($("#BID_NUM").val()==""){
				$("#BID_NUM").tips({
					side:3,
		            msg:'请输入数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BID_NUM").focus();
			return false;
			}
			if($("#LEADER_NAME").val()==""){
				$("#LEADER_NAME").tips({
					side:3,
		            msg:'请输入项目负责人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEADER_NAME").focus();
			return false;
			}
			if($("#LEADER_PHONE").val()==""){
				$("#LEADER_PHONE").tips({
					side:3,
		            msg:'请输入手机',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEADER_PHONE").focus();
			return false;
			}
			if($("#BZ").val()==""){
				$("#BZ").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BZ").focus();
			return false;
			}
			if($("#CREATE_TIME").val()==""){
				$("#CREATE_TIME").tips({
					side:3,
		            msg:'请输入报备时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_TIME").focus();
			return false;
			}
		    if($("#PROJECT_ID").val()==""){
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
				url: '<%=basePath%>project/hasU.do',
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
