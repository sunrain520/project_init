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
					
					<form action="weeklyreport/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="WEEKLYREPORT_ID" id="WEEKLYREPORT_ID" value="${pd.WEEKLYREPORT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">项目名称:</td>
								<td><input type="text" name="PROJECT_NAME" id="PROJECT_NAME" value="${pd.PROJECT_NAME}" maxlength="255"
								 placeholder="这里输入项目名称" title="项目名称" style="width:98%;"/>
								 <input type="hidden" name="PROJECT_ID" id="PROJECT_ID" value="${pd.PROJECT_ID}" />
								 </td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">进度%:</td>
								<td><input type="number" name="PLAN" id="PLAN" value="${pd.PLAN}" maxlength="32" placeholder="这里输入进度%" title="进度%" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">概率%:</td>
								<td><input type="number" name="PROB" id="PROB" value="${pd.PROB}" maxlength="32" placeholder="这里输入概率%" title="概率%" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">问题:</td>
								<td>
								<textarea rows="" cols="" name="PROBLEM" id="PROBLEM" value="${pd.PROBLEM}" style="width:97%; height: 88px;"  <c:if test="${msg  eq 'view' }">readonly</c:if>>${pd.PROBLEM}</textarea>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">需要帮助:</td>
								<td>
								<textarea rows="" cols="" name="HELP" id="HELP" value="${pd.HELP}" style="width:97%; height: 88px;"  <c:if test="${msg  eq 'view' }">readonly</c:if>>${pd.HELP}</textarea>
								</td>
							</tr>
							
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">状态:</td>
								<td>
									<select name="STATUS" title="状态">
									<option value="0" <c:if test="${pd.STATUS == '0' }">selected</c:if> >草稿</option>
									<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if> >发布</option>
									</select>
									<span style="font-size: 11px;color: #b9b1b1;">&nbsp;&nbsp;注：草稿状态下仅自己可见</span>
								</td>
							</tr>
							
							<c:if test="${msg  eq 'view' }">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户名称:</td>
								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="255" placeholder="这里输入用户名称" title="用户名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input type="text" name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" maxlength="255" placeholder="这里输入创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							</c:if>
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
		//输入框高度自适应
		$('textarea').each(function () {
			  this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;width:98%;');
			}).on('input', function () {
			  this.style.height = 'auto';
			  this.style.height = (this.scrollHeight) + 'px';
			});
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
			if($("#PROJECT_ID").val()==""){
				$("#PROJECT_ID").tips({
					side:3,
		            msg:'请输入项目ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROJECT_ID").focus();
			return false;
			}
			if($("#PLAN").val()==""){
				$("#PLAN").tips({
					side:3,
		            msg:'请输入进度%',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PLAN").focus();
			return false;
			}
			if($("#PROB").val()==""){
				$("#PROB").tips({
					side:3,
		            msg:'请输入概率%',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROB").focus();
			return false;
			}
			if($("#PROBLEM").val()==""){
				$("#PROBLEM").tips({
					side:3,
		            msg:'请输入问题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROBLEM").focus();
			return false;
			}
			if($("#HELP").val()==""){
				$("#HELP").tips({
					side:3,
		            msg:'请输入需要帮助',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HELP").focus();
			return false;
			}
			if($("#USER_ID").val()==""){
				$("#USER_ID").tips({
					side:3,
		            msg:'请输入用户id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_ID").focus();
			return false;
			}
			if($("#USERNAME").val()==""){
				$("#USERNAME").tips({
					side:3,
		            msg:'请输入用户名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERNAME").focus();
			return false;
			}
			if($("#CREATE_TIME").val()==""){
				$("#CREATE_TIME").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_TIME").focus();
			return false;
			}
		    if($("#WEEKLYREPORT_ID").val()==""){
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
				url: '<%=basePath%>weeklyreport/hasU.do',
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
