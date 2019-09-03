<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jdgl.entity.*" %>
<%@ page import="com.jdgl.Util" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>酒店管理系统</title>
<script type="text/javascript" src="static/js/jquery.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<script type="text/javascript">

</script>
<body>
	<h3 align="center">欢迎管理员${sessionScope.ses}登陆系统</h3>
<nav class="navbar navbar-default">
  <div class="container-fluid" style="width:70%">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/forehead/yggl.jsp"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="yggl?roomNum=0">客房管理<span class="sr-only">(current)</span></a></li>
        <li><a href="forehead/vipLog.jsp">会员注册</a></li>
        <li><a href="<%=request.getContextPath() %>/todaySearch.do">当日应结算房间</a></li>
      </ul>
      <form class="navbar-form navbar-left" action="<%=request.getContextPath() %>/yggl">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="查询房间" name="roomNum">
        </div>
        <button type="submit" class="btn btn-default">查询</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login.jsp ">退出登陆</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	
	<div align="center">
	<table class="table table-striped table-bordered table-hover" style="height:100%; width:70%">
		<tr class="success">
			<td align="center">房间号</td>
			<td align="center">房间状态</td>
			<td align="center">房间价格</td>
			<td colspan="2" align="center">操作</td>
		</tr>
		<c:forEach var = "room" items="${roomList }">
		<c:choose>
			<c:when test="${room.stat==1}">
				<tr id="row" class="danger">
			</c:when>
			<c:when test="${room.stat==2}">
				<tr id="row" class="warning">
			</c:when>
		</c:choose>
			<td align="center">${room.num}</td>
		<c:choose>
			<c:when test="${room.stat==1}">
			<td align="center">已入住</td>
			</c:when>
			<c:when test="${room.stat==2}">
			<td align="center">未打扫</td>
			</c:when>
			<c:when test="${room.stat==0}">
			<td align="center">未入住</td>
			</c:when>
		</c:choose>
			<td align="center">${room.price}</td>
		<c:choose>
			<c:when test="${room.stat==0}">
			<td align="center"><a href="sys/generDoIn.jsp?room_num=${room.num}">入住</a></td>
			</c:when>
			<c:when test="${room.stat==1}">
			<td align="center" ><a href="preMoveOut.do?room_num=${room.num}">退房</a></td>
			</c:when>
			<c:when test="${room.stat==2}">
			<td align="center"><a href="sys/clean.jsp?room_num=${room.num}">打扫</a></td>
			</c:when>
		</c:choose>
		</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>



