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
        <title>欢迎页面</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
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
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a>首页</a>
            <a>质保管理</a>
            <a>
              <cite>质保列表</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                              <form class="layui-form layui-col-space5">
                               <div class="layui-inline layui-show-xs-block">
                                    <select name="code" id="code">
                                        <option value="phone">根据手机号查询:</option>
                                        <option value="carNumber">根据车牌号查询:</option>
                                        <option value="name">根据客户姓名查询:</option>
                                        <option value="technician">根据施工技师查询:</option>
                                        <option value="date">根据施工日期查询:</option>
                                        <option value="productModel">根据产品型号查询:</option>
                                     </select>
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" id="value" name="value"  placeholder="请输入查询内容" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                 <input onclick="get()" type="button" lay-filter="sreach" class="layui-btn" value="提交查询"></input>
                                </div>
                            </form>
                        </div>
                        <script type="text/javascript">
                        function get(){
                        var select_code=document.getElementById("code").value;
                        var select_value=document.getElementById("value").value;
                        select_value=encodeURI(encodeURI(select_value));
                        xadmin.open('质保查询','./order-select-java.jsp?code='+select_code+'&value='+select_value,400,400);
                        }
                        </script>
                        <div class="layui-card-header">
                            <button class="layui-btn" onclick="xadmin.open('质保录入','./order-add.jsp',400,400)"><i class="layui-icon"></i>添加</button>
                        </div>
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
      List<UserList> UserList=new  ArrayList<UserList>();
      UserList=DBHelper.selectAll();
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
                                      <a onclick="xadmin.open('修改','./order-updata.jsp?id=<%=id %>',400,400)" title="修改">
                                        <i class="layui-icon">&#xe631;</i>
                                      </a>
                                      <a title="删除" onclick="xadmin.open('修改','./order-delect-java.jsp?id=<%=id %>',400,400)" style="margin-left:10px;">
                                        <i class="layui-icon">&#xe640;</i>
                                      </a>
                                    </td>
                                  </tr>
                                  
                                 <%} %> 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
      layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });
        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });
    </script>
</html>
