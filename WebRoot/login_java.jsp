<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="Conn.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login_java.jsp' starting page</title>
    
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
	request.setCharacterEncoding("utf8");
	String username = request.getParameter("username").trim();
	String password = request.getParameter("password").trim();
	int n=DBHelper.Login(username, password);
	System.out.print(n+"shuju");
	if(n>0){
	    session.setMaxInactiveInterval(30*60);			// 设置session失效时间（timeout），单位为秒
		session.setAttribute("userinfo", username);		// 用户名和密码正确，保存登录信息
		response.sendRedirect("./index.jsp");
	}else{
		response.sendRedirect("./login.jsp");		// 用户名和密码错误，跳转到登录界面
	}
   %>
  </body>
</html>
