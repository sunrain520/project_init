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
					
					<form action="company/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="COMPANY_ID" id="COMPANY_ID" value="${pd.COMPANY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:130px;text-align: right;padding-top: 13px;">名称:</td>
								<td><input type="text" name="COMPANY_NAME" id="COMPANY_NAME" value="${pd.COMPANY_NAME}" maxlength="255" placeholder="这里输入名称" title="名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">注册资本:</td>
								<td><input type="number" name="REGISTERED_CAPITAL" id="REGISTERED_CAPITAL" value="${pd.REGISTERED_CAPITAL}" maxlength="32" placeholder="这里输入注册资本" title="注册资本" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">统一社会信用代码:</td>
								<td><input type="text" name="CREDIT_CODE" id="CREDIT_CODE" value="${pd.CREDIT_CODE}" maxlength="255" placeholder="这里输入统一社会信用代码" title="统一社会信用代码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">办公地址:</td>
								<td><input type="text" name="ADDR" id="ADDR" value="${pd.ADDR}" maxlength="255" placeholder="这里输入办公地址" title="办公地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">网站:</td>
								<td><input type="text" name="WEB_SITES" id="WEB_SITES" value="${pd.WEB_SITES}" maxlength="255" placeholder="这里输入网站" title="网站" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省份ID:</td>
								<td><input type="text" name="PROVINCE_ID" id="PROVINCE_ID" value="${pd.PROVINCE_ID}" maxlength="255" placeholder="这里输入省份ID" title="省份ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">省份名称:</td>
								<td><input type="text" name="PROVINCE_NAME" id="PROVINCE_NAME" value="${pd.PROVINCE_NAME}" maxlength="255" placeholder="这里输入省份名称" title="省份名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">营业执照:</td>
								<td><input type="text" name="LICENSE" id="LICENSE" value="${pd.LICENSE}" maxlength="255" placeholder="这里输入营业执照" title="营业执照" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经营范围:</td>
								<td><input type="text" name="BUSINESS_SCOPE" id="BUSINESS_SCOPE" value="${pd.BUSINESS_SCOPE}" maxlength="255" placeholder="这里输入经营范围" title="经营范围" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">盖章的开票信息:</td>
								<td><input type="text" name="BILLING" id="BILLING" value="${pd.BILLING}" maxlength="255" placeholder="这里输入盖章的开票信息" title="盖章的开票信息" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">法人姓名:</td>
								<td><input type="text" name="LEGAL_PERSON" id="LEGAL_PERSON" value="${pd.LEGAL_PERSON}" maxlength="255" placeholder="这里输入法人姓名" title="法人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">法人手机号:</td>
								<td><input type="text" name="LEGAL_PHONE" id="LEGAL_PHONE" value="${pd.LEGAL_PHONE}" maxlength="255" placeholder="这里输入法人手机号" title="法人手机号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">法人身份证:</td>
								<td><input type="text" name="LEGAL_NO" id="LEGAL_NO" value="${pd.LEGAL_NO}" maxlength="255" placeholder="这里输入法人身份证" title="法人身份证" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入联系人" title="联系人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人手机:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入联系人手机" title="联系人手机" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人邮箱:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="255" placeholder="这里输入联系人邮箱" title="联系人邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">库存:</td>
								<td><input type="number" name="STOCK" id="STOCK" value="${pd.STOCK}" maxlength="255" placeholder="这里输入库存" title="库存" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">注册时间:</td>
								<td><input type="text" name="REGTIME" id="REGTIME" value="${pd.REGTIME}" maxlength="255" placeholder="这里输入注册时间" title="注册时间" style="width:98%;"/></td>
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
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COMPANY_NAME").focus();
			return false;
			}
			if($("#REGISTERED_CAPITAL").val()==""){
				$("#REGISTERED_CAPITAL").tips({
					side:3,
		            msg:'请输入注册资本',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REGISTERED_CAPITAL").focus();
			return false;
			}
			if($("#CREDIT_CODE").val()==""){
				$("#CREDIT_CODE").tips({
					side:3,
		            msg:'请输入统一社会信用代码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREDIT_CODE").focus();
			return false;
			}
			if($("#ADDR").val()==""){
				$("#ADDR").tips({
					side:3,
		            msg:'请输入办公地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDR").focus();
			return false;
			}
			if($("#WEB_SITES").val()==""){
				$("#WEB_SITES").tips({
					side:3,
		            msg:'请输入网站',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WEB_SITES").focus();
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
		            msg:'请输入省份名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVINCE_NAME").focus();
			return false;
			}
			if($("#LICENSE").val()==""){
				$("#LICENSE").tips({
					side:3,
		            msg:'请输入营业执照',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LICENSE").focus();
			return false;
			}
			if($("#BUSINESS_SCOPE").val()==""){
				$("#BUSINESS_SCOPE").tips({
					side:3,
		            msg:'请输入经营范围',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BUSINESS_SCOPE").focus();
			return false;
			}
			if($("#BILLING").val()==""){
				$("#BILLING").tips({
					side:3,
		            msg:'请输入盖章的开票信息',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BILLING").focus();
			return false;
			}
			if($("#LEGAL_PERSON").val()==""){
				$("#LEGAL_PERSON").tips({
					side:3,
		            msg:'请输入法人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEGAL_PERSON").focus();
			return false;
			}
			if($("#LEGAL_PHONE").val()==""){
				$("#LEGAL_PHONE").tips({
					side:3,
		            msg:'请输入法人手机号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEGAL_PHONE").focus();
			return false;
			}
			if($("#LEGAL_NO").val()==""){
				$("#LEGAL_NO").tips({
					side:3,
		            msg:'请输入法人身份证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEGAL_NO").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入联系人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入联系人手机',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#EMAIL").val()==""){
				$("#EMAIL").tips({
					side:3,
		            msg:'请输入联系人邮箱',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL").focus();
			return false;
			}
			if($("#REGTIME").val()==""){
				$("#REGTIME").tips({
					side:3,
		            msg:'请输入注册时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REGTIME").focus();
			return false;
			}
		    if($("#COMPANY_ID").val()==""){
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
		
</body>
</html>
