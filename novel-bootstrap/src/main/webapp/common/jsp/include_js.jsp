<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
	<!-- easyui -->
	<script type="text/javascript" src="<%=basePath%>common/js/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>common/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>common/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	
	<!-- 定义公共path属性 -->
	<script>
		var path = "<%=path %>";
		var basePath = "<%=basePath %>";
	</script>
	
	