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
					
					<form action="projectapply/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="PROJECTAPPLY_ID" id="PROJECTAPPLY_ID" value="${pd.PROJECTAPPLY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:140px;text-align: right;padding-top: 13px;">项目名称:</td>
								<td>
								<select class="chosen-select form-control" onchange="changeProject(this.value)" 
								name="PROJECT_ID" id="PROJECT_ID" data-placeholder="请选择项目名称" style="vertical-align:top;" style="width:98%;"  <c:if test="${msg  ne 'save' }">disabled</c:if>>
								<option value=""></option>
								<c:forEach items="${projectList}" var="project">
									<option value="${project.PROJECT_ID }" <c:if test="${project.PROJECT_ID == pd.PROJECT_ID }">selected</c:if>>${project.PROJECT_NAME }</option>
								</c:forEach>
								</select>
								<input type="hidden" name="PROJECT_NAME" id="PROJECT_NAME" value="${pd.PROJECT_NAME}" />
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">申请文件类型:</td>
								<td>
<%-- 								<input type="text" name="FILE_TYPE" id="FILE_TYPE" value="${pd.FILE_TYPE}" maxlength="255" placeholder="这里输入申请文件类型" title="申请文件类型" style="width:98%;"/> --%>
								<div>
									<select multiple="" class="chosen-select form-control" id="form-field-select-4" data-placeholder="选择申请文件类型">
										<c:forEach items="${fileList}" var="file">
											<option onclick="setROLE_IDS('${file.DICTIONARIES_ID }')" value="${file.DICTIONARIES_ID }" 
											<c:if test="${file.RIGHTS == '1' }">selected</c:if> id="${file.DICTIONARIES_ID }">${file.NAME }</option>
										</c:forEach>
									</select>
									<textarea style="display: none;" name="FILE_TYPE" id="FILE_TYPE" >${pd.FILE_TYPE }</textarea>
									<textarea style="display: none;" name="FILE_NAME" id="FILE_NAME" >${pd.FILE_NAME }</textarea>
								</div>
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">申请数量:</td>
								<td><input type="number" name="NUM" id="NUM" value="${pd.NUM}" maxlength="32" placeholder="这里输入申请数量" title="申请数量" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮寄联系人姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入邮寄联系人姓名" title="邮寄联系人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮寄联系人电话:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入邮寄联系人电话" title="邮寄联系人电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮寄地址:</td>
								<td><input type="text" name="ADDR" id="ADDR" value="${pd.ADDR}" maxlength="255" placeholder="这里输入邮寄地址" title="邮寄地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">招标文件:</td>
								<td>
									<a href="javascript:;" class="upload">
										<li  class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"  id="nav-search-icon"  style="margin-top: -20px;"></li>
										<input class="change" type="file" accept=".zip" name="pic" id="legal_no" onchange="uploadPic('BID_DOCUMENT')" style="width: 15%;display:inline-block;opacity: 1;" />
										<input type="text" name="BID_DOCUMENT" id="BID_DOCUMENT" value="${pd.BID_DOCUMENT}" readonly="readonly" title="招标文件" style="width:77%;display:inline-block;"/> 
									</a>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">授权状态:</td>
								<td >
<%-- 								<input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="20" placeholder="这里输入授权状态" title="授权状态" style="width:98%;"/> --%>
								<select name="STATUS" id="STATUS" title="状态" style="width:100px;" <c:if test="${ msg eq 'save' }">disabled</c:if>  >
								<option value="" >请选择</option>
								<option value="0" <c:if test="${pd.STATUS == '0' || msg eq 'save' }">selected</c:if> >待审核</option>
								<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if> >通过</option>
								<option value="2" <c:if test="${pd.STATUS == '2' }">selected</c:if> >拒绝</option>
								</select>
								</td>
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
	<script type="text/javascript" src="static/login/js/jquery.form.js"></script>
	
	
		<script type="text/javascript">
		$(top.hangge());
		
		function changeProject(value){
			hasU();
			var text = $("#PROJECT_ID").find("option:selected").text(); //获取Select选择的Text 
			 $("#PROJECT_NAME").attr("value",text);
		}
	
	  function limitFileSize(file, limitSize) {
            var arr = ["KB", "MB", "GB"]
            var limit = limitSize.toUpperCase();
            var limitNum = 0;
            for (var i = 0; i < arr.length; i++) {
                var leval = limit.indexOf(arr[i]);
                if (leval > -1) {
                    limitNum = parseInt(limit.substr(0, leval)) * Math.pow(1024, (i + 1))
                    break
                }
            }
            if (file.size > limitNum) {
                return false
            }
            return true
        };
		
		function uploadPic(ids ) {  
			var name = document.all.legal_no.value;
			if(name != ""){
				idx = name.lastIndexOf(".");   
		        if (idx != -1){   
		            ext = name.substr(idx+1).toUpperCase();   
		            ext = ext.toLowerCase( ); 
		            if (ext != 'tar' && ext != 'zip' && ext != 'rar' ){
		                alert("只能上传压缩文件，支持zip,tar!"); 
		                return;  
		            }   
		        }
			}
			
			var selectedFile = document.getElementById("legal_no").files[0];
			if(limitFileSize(selectedFile,"10MB") == false){
				alert("上传文件不能大于10M!"); 
                return;  
			}
			
	        // 上传设置  
	        var options = {  
	                // 规定把请求发送到那个URL  
	                url: "file/loginUpload.do",  
	                // 请求方式  
	                type: "post",  
	                // 服务器响应的数据类型  
	                dataType: "json",  
	                // 请求成功时执行的回调函数  
	                success: function(data) {  
	                    // 图片显示地址  
	                    $("#"+ids).val(data.real_path);  
	                    console.log(data.real_path);
// 	                    $("#"+ forms+"_v").attr("value",data.real_path)
	                }  
	        };  
	        
	        
	        $("#Form").ajaxSubmit(options);  
	    }  
		
		$(function() {
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
		});
		//移除副职角色
		function removeRoleId(ROLE_ID){
			var OROLE_IDS = $("#FILE_TYPE");
			var ROLE_IDS = OROLE_IDS.val();
			var FILE_NAME = $("#FILE_NAME").val();
			FILE_NAME = FILE_NAME.replace( $("#"+ROLE_ID).text() + "，","");
			ROLE_IDS = ROLE_IDS.replace(ROLE_ID+",fh,","");
			OROLE_IDS.val(ROLE_IDS);
			$("#FILE_NAME").val(FILE_NAME);
			console.log("remove"+ROLE_IDS);
		}
		//添加副职角色
		function addRoleId(ROLE_ID){
			var OROLE_IDS = $("#FILE_TYPE");
			var ROLE_IDS = OROLE_IDS.val();
			var FILE_NAME = $("#FILE_NAME").val();
			
			if(!isContains(ROLE_IDS,ROLE_ID)){
				ROLE_IDS = ROLE_IDS + ROLE_ID + ",fh,";
				FILE_NAME = FILE_NAME + $("#"+ROLE_ID).text()+"，";
				OROLE_IDS.val(ROLE_IDS);
				$("#FILE_NAME").val(FILE_NAME);
			}
		}
		function isContains(str, substr) {
		     return str.indexOf(substr) >= 0;
		}
		
		//保存
		function save(){
			if($("#FILE_TYPE").val()==""){
				$("#FILE_TYPE").tips({
					side:3,
		            msg:'请输入申请文件类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FILE_TYPE").focus();
			return false;
			}
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
			
			if($("#NUM").val()==""){
				$("#NUM").tips({
					side:3,
		            msg:'请输入申请数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NUM").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入邮寄联系人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
				var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入邮寄联系人电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}else  if( $("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
					$("#PHONE").tips({
						side:3,
			            msg:'手机号格式不正确',
			            bg:'#AE81FF',
			            time:3
			        });
					$("#PHONE").focus();
					return false;
				}
			
			if($("#ADDR").val()==""){
				$("#ADDR").tips({
					side:3,
		            msg:'请输入邮寄地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDR").focus();
			return false;
			}
			if($("#BID_DOCUMENT").val()==""){
				$("#BID_DOCUMENT").tips({
					side:3,
		            msg:'请输入招标文件',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BID_DOCUMENT").focus();
			return false;
			}
			if($("#CREATE_TIME").val()==""){
				$("#CREATE_TIME").tips({
					side:3,
		            msg:'请输入申请时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_TIME").focus();
			return false;
			}
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请输入授权状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
			return false;
			}
				submit();
		}
		
			//提交
			function submit() {
				var msg = "${msg}";
				console.log("projectapply/"+msg+".do");
				var data = {
						PROJECTAPPLY_ID : $("#PROJECTAPPLY_ID").val(),
						FILE_TYPE : $("#FILE_TYPE").val(),
						FILE_NAME : $("#FILE_NAME").val(),
						PROJECT_NAME : $("#PROJECT_NAME").val(),
						PROJECT_ID : $("#PROJECT_ID").val(),
						NUM : $("#NUM").val(),
						NAME : $("#NAME").val(),
						PHONE : $("#PHONE").val(),
						ADDR : $("#ADDR").val(),
						BID_DOCUMENT : $("#BID_DOCUMENT").val(),
						STATUS : $("#STATUS").val()
				};
				$.ajax({
					type : "POST",
					url : "projectapply/"+msg+".do",
					data : data,
					dataType : 'json',
					cache : false,
					success : function(data) {
						console.log(111);
					}
				});
				$("#zhongxin").hide();
				$("#zhongxin2").show();
				document.getElementById('zhongxin').style.display = 'none';
				top.Dialog.close();
			}

			$(function() {
				//日期框
				$('.date-picker').datepicker({
					autoclose : true,
					todayHighlight : true
				});
			});

			//判断名称是否存在
			function hasU() {
				var NAME = $.trim($("#PROJECT_ID").val());
				$.ajax({
					type : "POST",
					url : '<%=basePath%>projectapply/hasU.do',
		    	data:{ NAME:NAME,tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					 if("success" != data.result){
						 layer.msg("该项目已提交授权申请，请选择其他项目");
						 return false;
					 }
				}
			});
		}
		
	</script>
		
</body>
</html>
