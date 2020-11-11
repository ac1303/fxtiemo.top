<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="UserList.*"%>
<%@ page language="java" import="Conn.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
        <meta charset="UTF-8">
        <title>添加</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
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
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" action="order-add-java.jsp" method="post">
                    <div class="layui-form-item">
                        <label for="username" class="layui-form-label">
                            <span class="x-red">*</span>客户姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="name" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>客户电话</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" required="" lay-verify="phone" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>车辆型号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="carModel" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>车牌号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="carNumber" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>车辆颜色</label>
                        <div class="layui-input-inline">
                            <input type="text" name="carColor" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                       <span class="x-red">*</span>  施工单位</label>
                        <div class="layui-input-inline">
                            <input type="text" name="unit" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>施工日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="date" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>施工部位</label>
                        <div class="layui-input-inline">
                            <input type="text" name="position" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>施工技师</label>
                        <div class="layui-input-inline">
                            <input type="text" name="technician" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div><div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>产品型号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="productModel" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label"></label>
            <input class="layui-btn" type="submit" value="增加"></input>
        </form>
        </div>
        </div>
    </body>
</html>
