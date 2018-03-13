<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>${pd.SYSNAME}</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/css/camera.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/matrix-login.css" />
<link href="static/login/font-awesome.css" rel="stylesheet" />
<script type="text/javascript" src="static/login/js/jquery-1.5.1.min.js"></script>
<!-- 软键盘控件start -->
<!-- <link href="static/login/keypad/css/framework/form.css" rel="stylesheet" type="text/css"/> -->
<!-- 软键盘控件end -->
 <style type="text/css">
 
    /*
   body{
    -webkit-transform: rotate(-3deg);
    -moz-transform: rotate(-3deg);
    -o-transform: rotate(-3deg);
	padding-top:20px;
    }
    */
      .cavs{
    	z-index:1;
    	position: fixed;
    	width:95%;
    	margin-left: 20px;
    	margin-right: 20px;
    }
    
    .upload{
	    padding: 4px 10px;
	    height: 20px;
	    line-height: 20px;
	    position: relative;
	    text-decoration: none;
	    color: #666;
	    width: 100%;
	}
	.change{
	    position: absolute;
	    overflow: hidden;
	    right: 0;
	    top: 0;
	    opacity: 0;
	    width: 75%;
	}
	
	.images{
		border: 3px dashed #e6e6e6;
		display: inline-block;
		text-align: center;
		color: #cccccc;
		font-size: 18px;
		position: relative;
		background-size:100%100%; 
	}
	.main_input_box{
/* 		text-align:left !important; */
	}
	
	select {
/* 	    background-color: #fff; */
/* 	    border: 1px solid #ccc; */
	    height: 38px;
	    border: 0px;
	    display: inline-block;
	    width: 54%;
	    line-height: 28px;
	    margin-bottom: 3px;
	    margin-left: -4px;
	}
	#logo, #loginbox {
    width: 50%;
    }
    
    #loginbox .control-group {
    padding: 10px 0;
    margin-bottom: 0px;
    width: 50%;
    float: left;
	}
	#loginbox .main_input_box input {
		width: 50%;
	}
	
	#loginbox .controls {
    padding: 0 0px;
	}
	
  </style>
  <script>
  		//window.setTimeout(showfh,3000); 
  		var timer;
		function showfh(){
			fhi = 1;
			//关闭提示晃动屏幕，注释掉这句话即可
			//timer = setInterval(xzfh2, 10); 
		};
		var current = 0;
		function xzfh(){
			current = (current)%360;
			document.body.style.transform = 'rotate('+current+'deg)';
			current ++;
			if(current>360){current = 0;}
		};
		var fhi = 1;
		var current2 = 1;
		function xzfh2(){
			if(fhi>50){
				document.body.style.transform = 'rotate(0deg)';
				clearInterval(timer);
				return;
			}
			current = (current2)%360;
			document.body.style.transform = 'rotate('+current+'deg)';
			current ++;
			if(current2 == 1){current2 = -1;}else{current2 = 1;}
			fhi++;
		};
	</script>
</head>
<body>

	<c:if test="${pd.isMusic == 'yes' }">
	<div style="display: none">
	    <audio src="static/login/music/fh1.mp3" autoplay=""></audio>
	</div>	
	</c:if>
	<canvas class="cavs"></canvas>
	<div style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
		<!-- 登录 -->
		<div id="windows1">
		<div id="loginbox" >
			<form action="" method="post" name="loginForm1" id="loginForm1" >
				<div class="control-group normal_text" style="width: 100%">
					<h3>
						后台管理系统
<!-- 						<img src="static/login/logo.png" alt="Logo" /> -->
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="loginname" id="loginname" value="" placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="static/login/suo.png" /></i>
							</span><input type="password" name="password2" id="password2" placeholder="请输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
						</div>
					</div>
				</div>
				<div style="float:right;padding-right:10%;">
					<div style="float: left;margin-top:3px;margin-right:2px;">
						<font color="white">记住密码</font>
					</div>
					<div style="float: left;">
						<input name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="savePaw();" style="padding-top:0px;" />
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">

<!-- 						<div style="float: left;padding-top:2px;"> -->
<!-- 							<i><img src="static/login/yan.png" /></i> -->
<!-- 						</div> -->
						<div style="float: left;">
							<i><img style="height:25px;" id="codeImg" alt="点击更换" title="点击更换" src="" /></i>
						</div>
						<div style="float: left;" class="codediv">
							<input type="text" name="code" id="code" class="login_code"
								style="height:16px; padding-top:4px;margin-left: 10px;" />
						</div>
						
<%-- 						<c:if test="${pd.isZhuce == 'yes' }"> --%>
						<span class="pull-right" style="padding-right:3%;"><a href="javascript:changepage(1);" class="btn btn-success">注册</a></span>
<%-- 						</c:if> --%>
						<span class="pull-right"><a onclick="severCheck();" class="flip-link btn btn-info" id="to-recover">登录</a></span>
					</div>
				</div>
			</form>
			<div class="controls" style="position:fixed;bottom:0;left:0;right:0;">
				<div class="main_input_box">
					<font color="white"><span id="nameerr">Copyright@2018  版权所有</span></font>
				</div>
			</div>
		</div>
		</div>
		<!-- 注册 -->
		<div id="windows2" style="display: none;">
		<div id="loginbox" style="margin-top: 1%;">
			<form action="" method="post" name="loginForm" id="loginForm" enctype="multipart/form-data">
				<div class="control-group normal_text" style="width: 100%">
					<h3>
						用户注册
<!-- 						<img src="static/login/logo.png" alt="Logo" /> -->
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="company_name" id="company_name" value="" placeholder="请输入公司名称" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="credit_code" id="credit_code" value="" placeholder="请输入统一社会信用代码" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="registered_capital" id="registered_capital" value="" placeholder="请输入公司注册资本（万）" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="addr" id="addr" value="" placeholder="请输入公司办公地址" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="web_sites" id="web_sites" value="" placeholder="请输入公司网站" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span>
<!-- 							<input type="text" name="province" id="province" value="" placeholder="请输入公司所属省份" /> -->
							
								
								<select class="chosen-select form-control" name="province" id="province" onchange="changeProvince(this.value)" >
								<option value="">请选择公司所属省份</option>
								<c:forEach items="${province}" var="temp">
									<option value="${temp.DICTIONARIES_ID}" >${temp.NAME }</option>
								</c:forEach>
								</select>
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="business_scope" id="business_scope" value="" placeholder="请输入公司经营范围" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="legal_person" id="legal_person" value="" placeholder="请输入法人姓名" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="legal_phone" id="legal_phone" value="" placeholder="请输入法人手机号" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="name" id="name" value="" placeholder="请输入联系人姓名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="phone" id="phone" value="" placeholder="请输入联系人手机" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="email" id="email" value="" placeholder="请输入联系人邮箱" />
						</div>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png" /></i>
							</span><input type="text" name="username" id="username" value="" placeholder="请输入登录用户名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="static/login/suo.png" /></i>
							</span><input type="password" name="password" id="PASSWORD" placeholder="请输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
						</div>
					</div>
				</div>
				
			
				<div class="control-group" style="width: 50%">
					<div class="controls" >
						<div class="main_input_box" >
							<span class="add-on bg_lg">
							<i>营业执照</i>
							</span>
							<a href="javascript:;" class="upload">
								<img  class="images" width="20%" height="15%" id="license_pic" src="static/login/image.png" style="margin-top: -20px;"/>
								<input class="change" type="file" multiple="multiple" name="pic" id="license" onchange="uploadPic('license','license_pic')" style="width: 100%;opacity: 0;"/>
							</a>
							<input type="hidden" name = "license" id = "license_v" value="">
							<span class="add-on bg_lg">
							<i>法人身份证</i>
							</span>
							<a href="javascript:;" class="upload">
								<img  class="images" width="20%" height="15%" id="legal_no_pic" src="static/login/image.png" style="margin-top: -20px;"/>
								<input class="change" type="file" multiple="multiple" name="pic" id="legal_no" onchange="uploadPic('legal_no','legal_no_pic')" style="width: 100%;opacity: 0;"/>
							</a>
							<input type="hidden" name = "legal_no"  id = "legal_no_v"  value="">
						</div>
					</div>
				</div>
					<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="static/login/suo.png" /></i>
							</span><input type="password" name="chkpwd" id="chkpwd" placeholder="请重新输入密码" class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
						</div>
					</div>
				</div>
				<div class="control-group" style="width: 50%">
					<div class="controls" >
						<div class="main_input_box" >
							<span class="add-on bg_lg">
							<i>盖章开票信息</i>
							</span>
							<a href="javascript:;" class="upload">
								<img  class="images" width="20%" height="15%" id="billing_pic" src="static/login/image.png" style="margin-top: -60px;"/>
								<input class="change" type="file" multiple="multiple" name="pic" id="billing" 
								onchange="uploadPic('billing','billing_pic')" style="margin-top: -30px;width: 100%;heopacity: 0;"/>
							</a>
							<input type="hidden" name = "billing" id="billing_v" value="">
						</div>
					</div>
				</div>
				
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">

						<div style="float: left;">
							<i><img style="height:26px;" id="zcodeImg" alt="点击更换" title="点击更换" src="" /></i>
						</div>
						
						
						<div style="float: left;" class="codediv">
							<input type="text" name="rcode" id="rcode" class="login_code"
								style="height:16px; padding-top:4px;" />
						</div>
						
						<span class="pull-right" style="padding-right:3%;"><a href="javascript:changepage(2);" class="btn btn-success">取消</a></span>
						<span class="pull-right"><a onclick="register();" class="flip-link btn btn-info" id="to-recover">提交</a></span>
					</div>
				</div>
			</form>
			<div class="controls" style="position:fixed;bottom:0;left:0;right:0;">
				<div class="main_input_box">
					<font color="white"><span id="nameerr">Copyright@2018  版权所有</span></font>
				</div>
			</div>
		</div>
		</div>
		
	</div>
	<div id="templatemo_banner_slide" class="container_wapper">
		<div class="camera_wrap camera_emboss" id="camera_slide">
			<!-- 背景图片 -->
			<c:choose>
				<c:when test="${not empty pd.listImg}">
					<c:forEach items="${pd.listImg}" var="var" varStatus="vs">
						<div data-src="static/login/images/${var.FILEPATH }"></div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div data-src="static/login/images/banner_slide_02.jpg"></div>
					<div data-src="static/login/images/banner_slide_01.jpg"></div>
<!-- 					<div data-src="static/login/images/banner_slide_03.jpg"></div> -->
<!-- 					<div data-src="static/login/images/banner_slide_04.jpg"></div> -->
					<div data-src="static/login/images/banner_slide_05.jpg"></div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- #camera_wrap_3 -->
	</div>

	<script type="text/javascript">
		//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var password = $("#password2").val();
				var code = "qq313596790fh"+loginname+",fh,"+password+"QQ978336446fh"+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="main/index";
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}else if("userstatuserror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "请等待后台管理员审核通过",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}
						else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#code").focus();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							showfh();
							$("#loginname").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode1();
			$("#codeImg").bind("click", changeCode1);
			$("#zcodeImg").bind("click", changeCode2);
		});
	
		//键盘回车事件，执行登录
		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode1() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}
		function changeCode2() {
			$("#zcodeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}
			if ($("#password").val() == "") {
				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {
				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				showfh();
				$("#code").focus();
				return false;
			}
			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 5
			});

			return true;
		}

		function savePaw() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
					expires : 7
				});
			}
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
		
		//登录注册页面切换
		function changepage(value) {
			if(value == 1){
				$("#windows1").hide();
				$("#windows2").show();
				changeCode2();
			}else{
				$("#windows2").hide();
				$("#windows1").show();
				changeCode1();
			}
		}
		
	//注册
	function rcheck(){
		
		if($("#company_name").val()==""){
			$("#company_name").tips({
				side:3,
	            msg:'请输入公司名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#company_name").focus();
			$("#company_name").val('');
			return false;
		}else{
			$("#company_name").val(jQuery.trim($('#company_name').val()));
		}
		
		if($("#credit_code").val()==""){
			$("#credit_code").tips({
				side:3,
	            msg:'请输入统一社会信用代码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#credit_code").focus();
			$("#credit_code").val('');
			return false;
		}else{
			$("#credit_code").val(jQuery.trim($('#credit_code').val()));
		}
		
		if($("#registered_capital").val()==""){
			$("#registered_capital").tips({
				side:3,
				msg:'请输入公司注册资本',
				bg:'#AE81FF',
				time:2
			});
			$("#registered_capital").focus();
			$("#registered_capital").val('');
			return false;
		}else{
			$("#registered_capital").val(jQuery.trim($('#registered_capital').val()));
		}
				
		if($("#addr").val()==""){
			$("#addr").tips({
				side:3,
				msg:'请输入公司办公地址',
				bg:'#AE81FF',
				time:2
			});
			$("#addr").focus();
			$("#addr").val('');
			return false;
		}else{
			$("#addr").val(jQuery.trim($('#addr').val()));
		}
		
		if($("#web_sites").val()==""){
			$("#web_sites").tips({
				side:3,
				msg:'请输入公司网站',
				bg:'#AE81FF',
				time:2
			});
			$("#web_sites").focus();
			$("#web_sites").val('');
			return false;
		}else{
			$("#web_sites").val(jQuery.trim($('#web_sites').val()));
		}
		
		if($("#province").val()=="" || $("#province").val()==0){
			$("#province").tips({
				side:3,
				msg:'请输入公司所属省份',
				bg:'#AE81FF',
				time:2
			});
			$("#province").focus();
			$("#province").val('');
			return false;
		}else{
			$("#province").val(jQuery.trim($('#province').val()));
		}
				
		if($("#business_scope").val()==""){
			$("#business_scope").tips({
				side:3,
				msg:'请输入公司经营范围',
				bg:'#AE81FF',
				time:2
			});
			$("#business_scope").focus();
			$("#business_scope").val('');
			return false;
		}else{
			$("#business_scope").val(jQuery.trim($('#business_scope').val()));
		}
				
		if($("#legal_person").val()==""){
			$("#legal_person").tips({
				side:3,
				msg:'请输入法人姓名',
				bg:'#AE81FF',
				time:2
			});
			$("#legal_person").focus();
			$("#legal_person").val('');
			return false;
		}else{
			$("#legal_person").val(jQuery.trim($('#legal_person').val()));
		}
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		 if($("#legal_phone").val() !="" && $("#legal_phone").val().length != 11 && !myreg.test($("#legal_phone").val())){
			$("#legal_phone").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#legal_phone").focus();
			return false;
		}
				
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
				msg:'请输入联系人姓名',
				bg:'#AE81FF',
				time:2
			});
			$("#name").focus();
			$("#name").val('');
			return false;
		}else{
			$("#name").val(jQuery.trim($('#name').val()));
		}
				
		if($("#phone").val()==""){
			$("#phone").tips({
				side:3,
				msg:'请输入联系人手机',
				bg:'#AE81FF',
				time:2
			});
			$("#phone").focus();
			$("#phone").val('');
			return false;
		}else if($("#phone").val().length != 11 && !myreg.test($("#phone").val())){
			$("#phone").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#phone").focus();
			return false;
		}
				
		if($("#email").val()==""){
			$("#email").tips({
				side:3,
				msg:'请输入联系人邮箱',
				bg:'#AE81FF',
				time:2
			});
			$("#email").focus();
			$("#email").val('');
			return false;
		}else if(!ismail($("#email").val())){
			$("#email").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#email").focus();
			return false;
		}else{
			$("#email").val(jQuery.trim($('#email').val()));
		}
		
		if($("#username").val()==""){
			$("#username").tips({
				side:3,
				msg:'请输入用户名',
				bg:'#AE81FF',
				time:2
			});
			$("#username").focus();
			$("#username").val('');
			return false;
		}else{
			$("#username").val(jQuery.trim($('#username').val()));
		}
		
		if($("#PASSWORD").val()==""){
			$("#PASSWORD").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PASSWORD").focus();
			return false;
		}
		if( !CheckPassWord($("#PASSWORD").val())){
			$("#PASSWORD").tips({
				side:3,
	            msg:'必须包含数字字母且不少于6位',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PASSWORD").focus();
			return false;
		}
		
		if($("#PASSWORD").val()!=$("#chkpwd").val()){
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#chkpwd").focus();
			return false;
		}
		
		if($("#license_v").val()==""){
			$("#license_pic").tips({
				side:3,
				msg:'请上传营业执照',
				bg:'#AE81FF',
				time:2
			});
			$("#license_pic").focus();
			$("#license_v").val('');
			return false;
		}
		
		if($("#legal_no_v").val()==""){
			$("#legal_no_pic").tips({
				side:3,
				msg:'请上传法人身份证',
				bg:'#AE81FF',
				time:2
			});
			$("#legal_no_pic").focus();
			$("#legal_no_v").val('');
			return false;
		}
		
		if($("#billing_v").val()==""){
			$("#billing_pic").tips({
				side:3,
				msg:'请上传盖章开票信息',
				bg:'#AE81FF',
				time:2
			});
			$("#billing_pic").focus();
			$("#billing_v").val('');
			return false;
		}
		
		
		if ($("#rcode").val() == "") {
			$("#rcode").tips({
				side : 1,
				msg : '验证码不得为空',
				bg : '#AE81FF',
				time : 3
			});
			$("#rcode").focus();
			return false;
		}
		return true;
	}
	
	//提交注册
	function register(){
		if(rcheck()){
			var nowtime = date2str(new Date(),"yyyyMMdd");
			var data = {
					type:2,
					COMPANY_NAME:$("#company_name").val(),
					CREDIT_CODE:$("#credit_code").val(),
					REGISTERED_CAPITAL:$("#registered_capital").val(),
					ADDR:$("#addr").val(),
					WEB_SITES:$("#web_sites").val(),
					PROVINCE_ID:$("#province").val(),
					PROVINCE_NAME:$("#province").find("option:selected").text(),
					BUSINESS_SCOPE:$("#business_scope").val(),
					LEGAL_PERSON:$("#legal_person").val(),
					LEGAL_PHONE:$("#legal_phone").val(),
					LICENSE:$("#license_v").val(),
					LEGAL_NO:$("#legal_no_v").val(),
					NAME:$("#name").val(),
					PHONE:$("#phone").val(),
					EMAIL:$("#email").val(),
					USERNAME:$("#username").val(),
					PASSWORD:$("#PASSWORD").val(),
					BILLING:$("#billing_v").val(),
					rcode:$("#rcode").val(),
					FKEY:$.md5('username'+nowtime+',fh,'),
					tm:new Date().getTime()
					};
			$.ajax({
				type: "POST",
				url: 'appSysUser/registerSysUser.do',
		    	data: data,
				dataType:'json',
				cache: false,
				success: function(data){
					if("00" == data.result){
						$("#windows2").hide();
						$("#windows1").show();
						$("#loginbox").tips({
							side : 1,
							msg : '注册成功,请等待后台管理员审核通过',
							bg : '#68B500',
							time : 10
						});
						changeCode1();
					}else if("04" == data.result){
						$("#username").tips({
							side : 1,
							msg : "用户名已存在",
							bg : '#FF5080',
							time : 15
						});
						showfh();
						$("#username").focus();
					}else if("06" == data.result){
						$("#rcode").tips({
							side : 1,
							msg : "验证码输入有误",
							bg : '#FF5080',
							time : 15
						});
						showfh();
						$("#rcode").focus();
					}
				}
			});
		}
	}
	
	function CheckPassWord(password) {//必须为字母加数字且长度不小于6位
		   var str = password;
		    if (str == null || str.length <6) {
		        return false;
		    }
		    var reg1 = new RegExp(/^[0-9A-Za-z]+$/);
		    if (!reg1.test(str)) {
		        return false;
		    }
		    var reg = new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
		    if (reg.test(str)) {
		        return true;
		    } else {
		        return false;
		    }
		}
	
	//邮箱格式校验
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}
	//js  日期格式
	function date2str(x,y) {
	     var z ={y:x.getFullYear(),M:x.getMonth()+1,d:x.getDate(),h:x.getHours(),m:x.getMinutes(),s:x.getSeconds()};
	     return y.replace(/(y+|M+|d+|h+|m+|s+)/g,function(v) {return ((v.length>1?"0":"")+eval('z.'+v.slice(-1))).slice(-(v.length>2?v.length:2))});
	 	};
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>
	<c:if test="${'1' == pd.msg}">
		<script type="text/javascript">
		$(tsMsg());
		function tsMsg(){
			alert('此用户在其它终端已经早于您登录,您暂时无法登录');
		}
		</script>
	</c:if>
	<c:if test="${'2' == pd.msg}">
		<script type="text/javascript">
			$(tsMsg());
			function tsMsg(){
				alert('您被系统管理员强制下线或您的帐号在别处登录');
			}
		</script>
	</c:if>
	
	<script src="static/login/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script src="static/login/js/jquery.easing.1.3.js"></script>
	<script src="static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="static/login/js/camera.min.js"></script>
	<script src="static/login/js/templatemo_script.js"></script>
	<script src="static/login/js/ban.js"></script>
	<script type="text/javascript" src="static/js/jQuery.md5.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="static/login/js/jquery.form.js"></script>
	
	<script type="text/javascript">  
	    function uploadPic(forms, ids ) {  
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
	                    console.log("#"+ forms+"_v");
	                    $("#"+ids).attr("src", data.path);  
	                    $("#"+ forms).val("");
	                    $("#"+ forms+"_v").attr("value",data.real_path)
	                }  
	        };  
	          
	        $("#loginForm").ajaxSubmit(options);  
	    }  
	</script> 
	
	<!-- 软键盘控件start -->
<!-- 	<script type="text/javascript" src="static/login/keypad/js/form/keypad.js"></script> -->
<!-- 	<script type="text/javascript" src="static/login/keypad/js/framework.js"></script> -->
	<!-- 软键盘控件end -->
</body>

</html>