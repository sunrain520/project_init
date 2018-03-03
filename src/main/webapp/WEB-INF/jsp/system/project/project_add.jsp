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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" href="plugins/layer/theme/default/layer.css" />
<link rel="stylesheet" href="plugins/validform_v5.3.2/validform.css" />
<style type="text/css">
.col-sm-3 {
    width: 10%;
}
.chosen-container-multi .chosen-choices {
	width: 41.666%;
	border-radius: 0 !important;
    color: #858585;
    background-color: #ffffff;
    border: 1px solid #d5d5d5;
    padding: 4px 4px 5px;
    font-size: 14px;
    font-family: inherit;
}
.chosen-container .chosen-drop {
	width: 41.666%;
}
#Form .need {
    width: 10px;
    color: #b20202;
}
</style>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">

<!-- 存放生成的hmlt开头  -->
<form class="form-horizontal" action="project/${msg }.do" name="Form" id="Form"  method="post">
<input type="hidden" name="PROJECT_ID" id="PROJECT_ID" value="${pd.PROJECT_ID}"/>
<div class="col-md-12">
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span> 项目名称：</label>
        <div class="col-sm-9">
            <input type="text" id="PROJECT_NAME" name="PROJECT_NAME" placeholder="" value="${pd.PROJECT_NAME}"
            nullmsg="请填写项目名称！"  datatype="s" <c:if test="${msg  eq 'view' }">readonly</c:if> >
        </div>
        <div class="checked-tip"></div>
    </div>
    
      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>所属行业：</label>
        <div class="col-sm-9">
            <select name="BUSINESS_ID" id="BUSINESS_ID" onchange="changeBussness(this.value)" style="width: 120px;" nullmsg="请选择所属行业！" datatype="*"  <c:if test="${msg  eq 'view' }">disabled</c:if>>
                <option  value="">请选择</option>     					 
          	</select>
          	
			<input type="hidden" name="BUSINESS_NAME" id="BUSINESS_NAME" value="${pd.BUSINESS_NAME}">
        </div>
    </div>
    
     <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>所在区域：</label>
        <div class="col-sm-9">
            <select name="PROVINCE_ID" id="level1" onchange="change1(this.value)" style="width: 120px;" nullmsg="请选择所在区域！" datatype="*" <c:if test="${msg  eq 'view' }">disabled</c:if>>
                <option  value="">请选择</option>     					 
          	</select>
             <input type="hidden" name="PROVINCE_NAME" id="PROVINCE_NAME" value="${pd.PROVINCE_NAME}">
 		<select id="level2" name="AREA_ID" onchange="change2(this.value)" style="width: 120px;" nullmsg="请选择所在区域！" datatype="*" <c:if test="${msg  eq 'view' }">disabled</c:if>>
 			<option  value="">请选择</option>                       
		</select>
		<input type="hidden" name="AREA_NAME" id="AREA_NAME" value="${pd.AREA_NAME}">
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>项目状态：</label>
        <div class="col-sm-9">
         	<select name="PROJECT_TYPE" id="PROJECT_TYPE_ID"  style="width: 120px;" nullmsg="请选择项目状态！" datatype="*" <c:if test="${msg  eq 'view' }">disabled</c:if>>
                <option>请选择</option>     					 
          	</select>
          	<input type="hidden" name="PROJECT_TYPE_TEMP" id="PROJECT_TYPE_TEMP" value="${pd.PROJECT_TYPE}">
        </div>
    </div>
    
     <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>项目预算：</label>
        <div class="col-sm-9">
            <input type="text" id="BUDGET" name="BUDGET" placeholder="单位：万元" class="col-xs-10 col-sm-5" nullmsg="请填写项目预算！" datatype="n" value="${pd.BUDGET}" <c:if test="${msg  eq 'view' }">readonly</c:if>>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>最终客户：</label>
        <div class="col-sm-9">
            <input type="text" id="CLIENT" name="CLIENT" placeholder="" class="col-xs-10 col-sm-5" nullmsg="请填写最终客户！" datatype="s" value="${pd.CLIENT}" <c:if test="${msg  eq 'view' }">readonly</c:if>>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>竞争对手：</label>
        <div class="col-sm-9">
            <input type="text" id="OPPONENT" name="OPPONENT" placeholder="" class="col-xs-10 col-sm-5" nullmsg="请填写竞争对手！" datatype="s" value="${pd.OPPONENT}" <c:if test="${msg  eq 'view' }">readonly</c:if>>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>预计投标时间：</label>
        <div class="col-sm-9">
            <input class="span10 date-picker" name="BID_TIME" id="BID_TIME"  type="text" data-date-format="yyyy-mm-dd" 
            readonly="readonly" style="width:150px;" placeholder="YYYY-MM-DD" title="日期" nullmsg="请选择投标时间！" datatype="*" value="${pd.BID_TIME}" >
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>预计使用设备型号：</label>
        <div class="col-sm-9">
        <select multiple="" class="chosen-select form-control" id="form-field-select-4" data-placeholder="选择预计使用设备型号" nullmsg="请选择预计使用设备型号！" datatype="*" <c:if test="${msg  eq 'view' }">disabled</c:if>>
			<c:forEach items="${modelList}" var="model">
				<option onclick="setROLE_IDS('${model.DICTIONARIES_ID}')" value="${model.DICTIONARIES_ID}" id="${model.DICTIONARIES_ID}" <c:if test="${model.RIGHTS == '1' }">selected</c:if>>
				${model.NAME }</option>
			</c:forEach>
		</select>
		<textarea style="display: none;" name="MODEL_ID" id="MODEL_ID" >${pd.MODEL_ID }</textarea>
		<textarea style="display: none;" name="MODEL_NAME" id="MODEL_NAME" >${pd.MODEL_NAME }</textarea>
        </div>
    </div>
    
     <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>预计使用设备数量：</label>
        <div class="col-sm-9">
            <input type="text" id="BID_NUM" name="BID_NUM" placeholder="" class="col-xs-10 col-sm-5" nullmsg="请填写！" datatype="n" value="${pd.BID_NUM}" <c:if test="${msg  eq 'view' }">readonly</c:if>>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>项目负责人姓名：</label>
        <div class="col-sm-9">
            <input type="text" id="LEADER_NAME" name="LEADER_NAME" placeholder="" class="col-xs-10 col-sm-5" nullmsg="请填写项目负责人姓名！" datatype="s" value="${pd.LEADER_NAME}" <c:if test="${msg  eq 'view' }">readonly</c:if>>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"><span class="need">*</span>项目负责人手机：</label>
        <div class="col-sm-9">
            <input type="text" id="LEADER_PHONE" name="LEADER_PHONE" placeholder="" class="col-xs-10 col-sm-5" nullmsg="请填写项目负责人手机！" datatype="m" value="${pd.LEADER_PHONE}" <c:if test="${msg  eq 'view' }">readonly</c:if>>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">项目简介：</label>
        <div class="col-sm-9" style="">
            <script id="editor" type="text/plain" style="width:96%;height:200px;" name="DETAILS" >${pd.DETAILS}</script>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">备注：</label>
        <div class="col-sm-9">
            <input type="text" id="BZ" name="BZ" placeholder="" class="col-xs-10 col-sm-5" value="${pd.BZ}" <c:if test="${msg  eq 'view' }">readonly</c:if>>
        </div>
    </div>
    <c:if test="${msg  ne 'view' }">
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="form-field-1"></label>
        <div class="col-sm-9"> <input class="btn btn-mini btn-primary" type="submit" value="保存"></input>
 		<a class="btn btn-mini btn-danger js-cancel" onclick="">取消</a>
        </div>
    </div>
    </c:if>
    
</div>
</form>
<!-- 存放生成的hmlt结尾 -->
							
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 百度富文本编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js?1"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js?1"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/layer/layer.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/validform_v5.3.2/Validform_v5.3.2_min.js"></script>
	<!-- 百度富文本编辑框-->
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 上传控件 -->
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
	<script type="text/javascript">

	$(function(){
		var msg = "${msg}";
		if( msg != "view"){
			$("#Form").Validform({ tiptype: 3, });  
		}
	})
	
	   // 取消
    $('.js-cancel').on('click',function(){
        layer.confirm('页面内容还未保存，确定要关闭该页吗？',
                {btn:['确定','取消'],title:'提示'},
                function(index){
                	layer.close(index);
//                 	document.getElementById('zhongxin').style.display = 'none';
                },
                function(){}
        );
    });
	
	function siMenu(id,fid,MENU_NAME,MENU_URL){
		$("#"+fid).attr("class","active open");
		$("#"+id).attr("class","active");
		top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
	}
		
		//初始所属行业
		$(function() {
			var BUSINESS_NAME = $("#BUSINESS_NAME").val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
		    	data: {DICTIONARIES_ID:"d2f08d14ad834cbea299c36a5f76fc48"},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#BUSINESS_ID").html('<option  value="">请选择</option>');
					 $.each(data.list, function(i, dvar){
						 	if(BUSINESS_NAME == dvar.NAME){
								$("#BUSINESS_ID").append("<option value="+dvar.DICTIONARIES_ID+" selected>"+dvar.NAME+"</option>");
						 	}else{
								$("#BUSINESS_ID").append("<option value="+dvar.DICTIONARIES_ID+" >"+dvar.NAME+"</option>");
						 	}
					 });
				}
			});
		});
		
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
					$("#level1").html('<option  value="">请选择</option>');
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
			var text = $("#level1").find("option:selected").text(); //获取Select选择的Text 
			var name = $("#AREA_NAME").val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
		    	data: {DICTIONARIES_ID:value},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#level2").html("<option value=''></option>");
					 $.each(data.list, function(i, dvar){
						 	if(name == dvar.NAME){
								$("#level2").append("<option value="+dvar.DICTIONARIES_ID+" selected>"+dvar.NAME+"</option>");
						 	}else{
								$("#level2").append("<option value="+dvar.DICTIONARIES_ID+">"+dvar.NAME+"</option>");
						 	}
						 
					 });
					 
					 $("#PROVINCE_NAME").attr("value",text);
				}
			});
		};
		function change2(value){
			var text = $("#level2").find("option:selected").text(); //获取Select选择的Text 
			 $("#AREA_NAME").attr("value",text);
		}
		
		//初始项目状态
		$(function() {
			var name = $("#PROJECT_TYPE_TEMP").val();
			$.ajax({
				type: "POST",
				url: '<%=basePath%>linkage/getLevels.do?tm='+new Date().getTime(),
		    	data: {DICTIONARIES_ID:"a2bb04838a5743e0b2d9d70eb55e7952"},
				dataType:'json',
				cache: false,
				success: function(data){
					$("#PROJECT_TYPE_ID").html('<option value="">请选择</option>');
					 $.each(data.list, function(i, dvar){
						 if(name == dvar.NAME) {
							$("#PROJECT_TYPE_ID").append("<option value="+dvar.NAME+" selected>"+dvar.NAME+"</option>");
						 }else{
							$("#PROJECT_TYPE_ID").append("<option value="+dvar.NAME+">"+dvar.NAME+"</option>");
						 }
					 });
				}
			});
		});
		
		function changeBussness(value){
			var text = $("#BUSINESS_ID").find("option:selected").text(); //获取Select选择的Text 
			 $("#BUSINESS_NAME").attr("value",text);
		};
		
		
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
			var OROLE_IDS = $("#MODEL_ID");
			var ROLE_IDS = OROLE_IDS.val();
			var MODEL_NAME = $("#MODEL_NAME").val();
			ROLE_IDS = ROLE_IDS.replace(ROLE_ID+",fh,","");
			MODEL_NAME = MODEL_NAME.replace($("#"+ROLE_ID).text()+"，","");
			OROLE_IDS.val(ROLE_IDS);
			$("#MODEL_NAME").val(MODEL_NAME);
			console.log("remove"+ROLE_IDS);
		}
		//添加副职角色
		function addRoleId(ROLE_ID){
			var OROLE_IDS = $("#MODEL_ID");
			var ROLE_IDS = OROLE_IDS.val();
			var MODEL_NAME = $("#MODEL_NAME").val();
			if(!isContains(ROLE_IDS,ROLE_ID)){
				ROLE_IDS = ROLE_IDS + ROLE_ID + ",fh,";
				OROLE_IDS.val(ROLE_IDS);
				MODEL_NAME = MODEL_NAME + $("#"+ROLE_ID).text() +"，";
				$("#MODEL_NAME").val(MODEL_NAME);
			}
		}
		function isContains(str, substr) {
		     return str.indexOf(substr) >= 0;
		}
		
		
		
		$(top.hangge());
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
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
			//上传
			$('#tp').ace_file_input({
				no_file:'请选择文件 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'*',
				//whitelist:'gif|png|jpg|jpeg',
				//blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
		});
		
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			UE.getEditor('editor');
		}
		
		
		
		
		
		
		
	</script>


</body>
</html>