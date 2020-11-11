<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'code_add.jsp' starting page</title>
    <link href="lib/layui/css/layui.css" rel="stylesheet" />

<script src="js/jquery.min.js"></script>
<script src="lib/layui/layui.js" type="text/javascript"></script>
<script src="js/upload.js" type="text/javascript"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  request.setCharacterEncoding("UTF-8");
    String id=request.getParameter("id");
   %>
  
    <form action="<%=request.getContextPath()%>/uploadpicture?id=<%=id %>" method="post" enctype="multipart/form-data">
    选择文件1：<input type="file" name="filename1"><br/>
    选择文件2：<input type="file" name="filename2"><br/>
    选择文件3：<input type="file" name="filename3"><br/>
    选择文件4：<input type="file" name="filename4"><br/>
    <input type="submit" name="flie_submit" value="提交">
    </form>
  </body>
</html>
