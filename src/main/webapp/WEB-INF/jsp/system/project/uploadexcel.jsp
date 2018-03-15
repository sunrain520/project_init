<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>

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
							<form action="project/uploadPurchaseOrder.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
								<div id="zhongxin" style="padding-top: 23px;">
								<table id="table_report" class="table table-striped table-bordered table-hover">
								
									<tr>
										<td style="width:95px;text-align: right;padding-top: 13px;">项目名称:</td>
										<td><input type="text" name="PROJECT_NAME" id="PROJECT_NAME" value="${pd.PROJECT_NAME}" maxlength="255" style="width:98%;" readonly="readonly"/></td>
										<input type="hidden" id="PROJECT_ID" name="PROJECT_ID" style="width:50px;" value="${pd.PROJECT_ID }" />
									</tr>
									<tr>
										<td style="width:75px;text-align: right;padding-top: 13px;">设备采购单:</td>
										<td>
											<a href="javascript:;" class="upload">
												<li  class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"  id="nav-search-icon"  style="margin-top: -20px;"></li>
												<input class="change" type="file" accept=".xls" name="pic" id="legal_no" onchange="uploadPic('PURCHASE_ORDER')" style="width: 15%;display:inline-block;opacity: 1;" />
												<input type="text" name="PURCHASE_ORDER" id="PURCHASE_ORDER" value="${pd.PURCHASE_ORDER}" readonly="readonly" title="设备采购单" style="width:77%;display:inline-block;"/> 
											</a>
										</td>
									</tr>
									
									<tr >
										<td style="text-align: center;padding-top: 10px;" colspan="2">
											<a class="btn btn-mini btn-primary" onclick="save();">上传</a>
											<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											<a class="btn btn-mini btn-success" onclick="window.location.href='<%=basePath%>/project/downExcel.do'">下载模版</a>
										</td>
									</tr>
								</table>
								</div>
								<div id="zhongxin2" class="center" style="display:none"><br/><img src="static/images/jzx.gif" /><br/><h4 class="lighter block green"></h4></div>
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

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 上传控件 -->
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script type="text/javascript" src="static/login/js/jquery.form.js"></script>
	
	<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//上传
			$('#excel').ace_file_input({
				no_file:'请选择EXCEL ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'xls|xls',
				blacklist:'gif|png|jpg|jpeg'
				//onchange:''
			});
		});

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
	        
		function uploadPic(ids) {  
			var name = document.all.legal_no.value;
			if(name != ""){
				idx = name.lastIndexOf(".");   
		        if (idx != -1){   
		            ext = name.substr(idx+1).toUpperCase();   
		            ext = ext.toLowerCase( ); 
		            if (ext != 'xls' && ext != 'xlsx'){
		                alert("只能上传xls!"); 
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
		
		
		//保存
		function save(){
			if($("#PURCHASE_ORDER").val() == ""){
				$("#legal_no").tips({
					side:3,
		            msg:'请选择文件',
		            bg:'#AE81FF',
		            time:3
		        });
				return false;
			}
// 			$("#Form").submit();
// 			$("#zhongxin").hide();
// 			$("#zhongxin2").show();
			
			var data = {
					PROJECT_NAME : $("#PROJECT_NAME").val(),
					PROJECT_ID : $("#PROJECT_ID").val(),
					PURCHASE_ORDER : $("#PURCHASE_ORDER").val()
			};
			$.ajax({
				type : "POST",
				url : "project/uploadPurchaseOrder.do",
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
		
		function fileType(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
		    if(fileType != '.xls'){
		    	$("#excel").tips({
					side:3,
		            msg:'请上传xls格式的文件',
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#excel").val('');
		    	document.getElementById("excel").files[0] = '请选择xls格式的文件';
		    }
		}
	</script>


</body>
</html>