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
		                          	<input type="hidden" name="PROVINCE_NAME" id="PROVINCE_NAME" value="${pd.PROVINCE_NAME }">
								 	<select id="level2" name="AREA_ID" onchange="change2(this.value)" style="width: 120px;">
								 		<option>请选择</option>                       
                      				</select>
                      				<input type="hidden" name="AREA_NAME" id="AREA_NAME" value="${pd.AREA_NAME }">
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">对接人:</td>
								<td id="juese">
								<select class="chosen-select form-control" name="USER_ID" id="user" onchange="changeUser(this.value)"  style="vertical-align:top;" style="width: 98%;" >
								<option value="请选择"></option>
								<c:forEach items="${userList}" var="user">
									<option value="${user.USER_ID}"  phone="${user.PHONE}"
									<c:if test="${user.USER_ID == pd.USER_ID}">selected</c:if> >${user.USERNAME }</option>
								</c:forEach>
								</select>
								<input type="hidden" name="USER_NAME" id="USER_NAME" value="${pd.USER_NAME }">
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
	
	<script type="text/javascript" charset="utf-8" src="plugins/layer/layer.js"></script>
		
	<script type="text/javascript">
	$(top.hangge());
	
			//初始第一级
			$(function() {
				var name = $("#PROVINCE_NAME").val();
				$.ajax({
					type: "POST",
					url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
			    	data: {DICTIONARIES_ID:1},
					dataType:'json',
					cache: false,
					success: function(data){
						$("#level1").html('<option>请选择</option>');
						 $.each(data.list, function(i, dvar){
							 if(dvar.NAME == name){
									$("#level1").append("<option value="+dvar.DICTIONARIES_ID+" selected>"+dvar.NAME+"</option>");
									change1(dvar.DICTIONARIES_ID);
								 }else{
									$("#level1").append("<option value="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
								 }
						 });
					}
				});
			});
			
			//第一级值改变事件(初始第二级)
			function change1(value){
				var name = $("#AREA_NAME").val();
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
							 if(dvar.NAME == name){
									$("#level2").append("<option value="+dvar.DICTIONARIES_ID+" selected>"+dvar.NAME+"</option>");
								 }else{
									$("#level2").append("<option value="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
								 }
// 								$("#level2").append("<option value="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 });
						 
						 $("#PROVINCE_NAME").attr("value",text);
					}
				});
			};
			
			function change2(value){
				var text = $("#level2").find("option:selected").text(); //获取Select选择的Text 
				 $("#AREA_NAME").attr("value",text);
			}
	
			//选择用户切换
			function changeUser(value){
				var text = $("#user").find("option:selected").text(); //获取Select选择的Text 
				$("#USER_NAME").attr("value",text);
				var phone = $("#user").find("option:selected").attr("phone")
				$("#PHONE").attr("value",phone);
			}
			
		//保存
		function save(){
			if($("#PROVINCE_NAME").val()==""){
				layer.msg('请选择省份');
				return false;
			}
			if($("#AREA_NAME").val()==""){
				layer.msg('请选择地市');
				return false;
			}
			if($("#USER_NAME").val()==""){
				layer.msg('请输入对接人');
				return false;
			}
			if($("#PHONE").val()==""){
				layer.msg('请输入联系方式');
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
			var NAME = $.trim($("#AREA_NAME").val());
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
						 layer.msg('【'+NAME+'】已存在区域负责人，请重新选择');
						return false;
					 }
				}
			});
		}
		
	</script>
		
</body>
</html>
