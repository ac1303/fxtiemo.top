<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="UserList.filelist"%>
<%@ page language="java" import="delectfile.readfile"%>
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
            <a>会员管理</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <button class="layui-btn" onclick="xadmin.open('添加案例','./code_add.jsp',600,400)"><i class="layui-icon"></i>添加</button>
                            <p class="layui-btn">提示：暂时无法提供修改服务，如果需要修改，请删除后重新添加</p>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>ID</th>
                                    <th>案例名称</th>
                                    <th>案例主图</th>
                                    <th>介绍文案</th>
                                    <th>介绍图片</th>
                                    <th>操作</th></tr>
                                </thead>
                                <tbody>
                                <%
       List<filelist> FileList=readfile.read();
		for(filelist a:FileList) {
			int id=a.getId();
			String title=a.getTitle();
			String txt=a.getTxt();
			String picture=a.getPicture();
			ArrayList<String> pictures=a.getPictures();
                                 %>
                                  <tr>
                                    <td><%=id %></td>
                                    <td><%=title %></td>
                                    <td><%=picture %></td>
                                    <td><%=txt %></td>
                                    <td><%
            for(String msg:pictures) {
				%>
				<%=msg %>
				<%
			}
                                     %></td>
                                    <td class="td-manage">
                                      <a title="删除" onclick="xadmin.open('修改','./code_delect_java.jsp?id=<%=String.valueOf(id)%>',400,400)" href="javascript:;">
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
