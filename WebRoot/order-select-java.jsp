<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.net.URLDecoder" %>
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
    
    <title>查询</title>
    <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
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
    <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>唯一ID</th>
                                    <th>客户姓名</th>
                                    <th>客户电话</th>
                                    <th>车辆型号</th>
                                    <th>车牌号码</th>
                                    <th>车辆颜色</th>
                                    <th>施工单位</th>
                                    <th>施工日期</th>
                                    <th>施工部位</th>
                                    <th>施工技师</th>
                                    <th>产品型号</th>
                                    <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
     // request.setCharacterEncoding("UTF-8");
    String code=request.getParameter("code");
    String value=request.getParameter("value");
    value=URLDecoder.decode(value,"UTF-8");
      List<UserList> UserList=DBHelper.selsct(code, value);
      for(UserList a:UserList){
      int id=a.getId();
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
                               <tr>
                                 <td><%=id %></td>
                                 <td><%=name %></td>
                                 <td><%=phone %></td>
                                 <td><%=carModel %></td>
                                 <td><%=carNumber %></td>
                                 <td><%=carColor %></td>
                                 <td><%=unit %></td>
                                 <td><%=date %></td>
                                 <td><%=position %></td>
                                 <td><%=technician %></td>
                                 <td><%=productModel %></td>
                                    <td class="td-manage">
                                      <a onclick="xadmin.open('修改','./order-updata.jsp?id=<%=id %>',600,400)" title="修改">
                                        <i class="layui-icon">&#xe631;</i>
                                      </a>
                                      <a title="删除" onclick="xadmin.open('修改','./order-delect-java.jsp?id=<%=id %>',600,400)" style="margin-left:10px;">
                                        <i class="layui-icon">&#xe640;</i>
                                      </a>
                                    </td>
                                  </tr>
                                 <%} %>
                                </tbody>
                            </table>
                        </div>
  </body>
</html>
