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
					
					<form action="principal/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PRINCIPAL_ID" id="PRINCIPAL_ID" value="${pd.PRINCIPAL_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地区:</td>
								<td >
									<select name="PROVINCE_ID" id="level1" onchange="change1(this.value)" style="width: 120px;">
		                                <option>请选择</option>     					 
		                          	</select>
		                          	<input type="hidden" name="PROVINCE_NAME" id="PROVINCE_NAME">
		                          	
								 	<select id="level2" name="AREA_ID" onchange="change2(this.value)" style="width: 120px;">
								 		<option>请选择</option>                       
                      				</select>
                      				<input type="hidden" name="AREA_NAME" id="AREA_NAME">
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">对接人:</td>
								<td >
								 	<select id="user" name="USER_ID" onchange="changeUser(this.value)" style="width: 120px;">
								 		<option>请选择</option>                       
                      				</select>
                      				<input type="hidden" name="USER_NAME" id="USER_NAME">
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系方式:</td>
								<td><input type="text" name="PHONE" id="PHONE" readonly="readonly" value="${pd.PHONE}" maxlength="50"  title="联系方式" style="width:98%;"/></td>
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
	
			//初始第一级
			$(function() {
				$.ajax({
					type: "POST",
					url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
			    	data: {DICTIONARIES_ID:1},
					dataType:'json',
					cache: false,
					success: function(data){
						$("#level1").html('<option>请选择</option>');
						 $.each(data.list, function(i, dvar){
								$("#level1").append("<option value="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 });
					}
				});
			});
			
			//初始第一级
			$(function() {
				$.ajax({
					type: "POST",
					url: '<%=basePath%>user/getlistUsers.do?TYPE=1&tm='+new Date().getTime(),
			    	data: {TYPE:1},
					dataType:'json',
					cache: false,
					success: function(data){
						$("#user").html('<option>请选择</option>');
						 $.each(data.list, function(i, dvar){
								$("#user").append("<option value="+dvar.USER_ID+">"+dvar.USERNAME+"</option>");
								$("#user").append("<input type='hidden' id="+dvar.USER_ID+" value = "+dvar.PHONE +" >");
						 });
					}
				});
			});
			
			//第一级值改变事件(初始第二级)
			function change1(value){
				var text = $("#level1").find("option:selected").text(); //获取Select选择的Text 
				$.ajax({
					type: "POST",
					url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
			    	data: {DICTIONARIES_ID:value},
					dataType:'json',
					cache: false,
					success: function(data){
						$("#level2").html('<option>请选择</option>');
						 $.each(data.list, function(i, dvar){
								$("#level2").append("<option value="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 });
						 
						 $("#PROVINCE_NAME").attr("value",text);
					}
				});
			}
			
			//第一级值改变事件(初始第二级)
			function change2(value){
				var text = $("#level2").find("option:selected").text(); //获取Select选择的Text 
				 $("#AREA_NAME").attr("value",text);
			}
	
			//选择用户切换
			function changeUser(value){
				var text = $("#user").find("option:selected").text(); //获取Select选择的Text 
				$("#USER_NAME").attr("value",text);
				$("#PHONE").attr("value",$("#"+value+"").val());
			}
			
		//保存
		function save(){
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
			if($("#AREA_NAME").val()==""){
				$("#AREA_NAME").tips({
					side:3,
		            msg:'请输入地市',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AREA_NAME").focus();
			return false;
			}
			if($("#USER_NAME").val()==""){
				$("#USER_NAME").tips({
					side:3,
		            msg:'请输入对接人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USER_NAME").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入联系方式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
		    if($("#PRINCIPAL_ID").val()==""){
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
				url: '<%=basePath%>principal/hasU.do',
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
