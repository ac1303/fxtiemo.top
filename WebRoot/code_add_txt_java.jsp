<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="java.net.URLDecoder" %>
<%@ page language="java" import="configure.Configure" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'code_add_title.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache" charset="utf-8">
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
    String str=request.getParameter("title");
    System.out.print(str);
        try {
            File f = new File(Configure.getPath()+id+"\\txt.txt");
            if (!f.exists()) {
                f.createNewFile();
            }
            OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(f), "UTF-8");
            BufferedWriter writer = new BufferedWriter(write);
            writer.write(str);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
     %>
     <script type="text/javascript">
		window.onload=function (){
		// 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame,刷新页面
                        parent.location.reload();
                        parent.layer.close(index);   
		
		};       
    </script>
  </body>
</html>

