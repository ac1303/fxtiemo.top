<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="configure.Configure" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'code_add.jsp' starting page</title>
    
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
     String wx_list=Configure.getPath();         
     for(int i=0;i<=99;i++){
     File folder=new File(wx_list+i+"\\");
     if(!folder.exists()&&!folder.isDirectory()){
       if (folder.mkdirs()) {
       File pic=new File(wx_list+i+"\\pic\\");
       pic.mkdirs();
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
              <%
        break;  
        } else {  
            out.println("创建目录" +wx_list+i+ "失败！");  
        break;  
        } 
      }
      }
      %>
  </body>
</html>
