# project_init
java脚手架项目

问题：
1.项目列表  新增 编辑项目  取消不会关闭当前页面 刷新父页面
2.申请授权列表  编辑页面保存不会刷新父页面

mysql in 查询
<if test="pd.AREA != null">
	and AREA_ID in 
	 <foreach collection="pd.AREA" index="index" item="custid" open="(" separator="," close=")"> 
	        #{pd.AREA[${index}]} 
	  </foreach>
</if>

下拉框禁用
<c:if test="${msg  eq 'view' }">disabled</c:if>
