<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="Conn.*"%>
<%@ page language="java" import="UserList.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改数据</title>
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
    <%
  int id=Integer.parseInt(request.getParameter("id"));
  UserList a=DBHelper.selsct(id);
  String name=a.getName();
	  String phone=a.getPhone();
	  String carModel=a.getCarModel();
	  String carNumber=a.getCarNumber();
	  String carColor=a.getCarColor();
	  String unit=a.getUnit();
	  String date=a.getDate();
	  String position=a.getPosition();
	  String technician=a.getTechnician();
	  String productModel=a.getProductModel();
    %> 
    <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form" action="order-updata_java.jsp" method="post">
                <div class="layui-form-item">
                        <label for="username" class="layui-form-label">
                            <span class="x-red">*</span>ID(不可修改)</label>
                        <div class="layui-input-inline">
                            <input type="text" name="id" value ="<%= id%>" readonly="readonly" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="username" class="layui-form-label">
                            <span class="x-red">*</span>客户姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="name" value ="<%= name%>" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>客户电话</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" value="<%= phone%>" required="" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>车辆型号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="carModel" value ="<%= carModel%>" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>车牌号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="carNumber" value ="<%= carNumber%>" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>车辆颜色</label>
                        <div class="layui-input-inline">
                            <input type="text" name="carColor" value ="<%= carColor%>" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                       <span class="x-red">*</span>  施工单位</label>
                        <div class="layui-input-inline">
                            <input type="text" name="unit" value ="<%= unit%>" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>施工日期</label>
                        <div class="layui-input-inline">
                            <input type="text" name="date" value ="<%= date%>" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>施工部位</label>
                        <div class="layui-input-inline">
                            <input type="text" name="position" value ="<%= position%>" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>施工技师</label>
                        <div class="layui-input-inline">
                            <input type="text" name="technician" value ="<%= technician%>" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div><div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>产品型号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="productModel" value ="<%= productModel%>" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label"></label>
            <input class="layui-btn" type="submit" value="增加"></input>
        </form>
        </div>
        </div>
  </body>
</html>
