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
    
    <title>数据处理逻辑</title>
    
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
    int id=Integer.parseInt(request.getParameter("id"));
    String name=request.getParameter("name");
    String phone=request.getParameter("phone");
	String carModel=request.getParameter("carModel");
	String carNumber=request.getParameter("carNumber");
	String carColor=request.getParameter("carColor");
	String unit=request.getParameter("unit");
	String date=request.getParameter("date");
	String position=request.getParameter("position");
	String technician=request.getParameter("technician");
	String productModel=request.getParameter("productModel");
	int n=DBHelper.updateAll(id, name, phone, carModel, carNumber, carColor, unit, date, position, technician, productModel);
		if(n>0){
		%>
		
		<script type="text/javascript">
		window.onload=function (){
		// 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame,刷新页面
                        parent.location.reload();
                        parent.layer.close(index);   
		
		};       
    </script><%
    //  response.sendRedirect("index.jsp");
    //  request.getRequestDispatcher("index.jsp").forward(request, response);这个返回会乱码？？？
    }else{
    response.sendRedirect("showError.jsp");
    }
     %>
  </body>
</html>
