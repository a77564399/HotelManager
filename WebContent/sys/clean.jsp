<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.room_num }房间清扫</title>
<script type="text/javascript" src="static/js/jquery.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>


<body>

<h3 align="center">${param.room_num }房间清扫</h3>
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
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="<%=request.getContextPath() %>/yggl?roomNum=0"> 客房管理<span class="sr-only">(current)</span></a></li>
        <li><a href="forehead/vipLog.jsp">会员注册</a></li>
        
      </ul>
      <form class="navbar-form navbar-left" action="show.action">
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


<div align="center" style="position:relative;right:50px;">
		<form action="../clean.do">
		<table>
			<tr>
				<td>清扫员工工号&nbsp;&nbsp;</td>
				<td><input type="text" class="form-control" placeholder="Text input"  id="workerId" name="workerId" style="width:100%"></td>
			</tr>
			
			<td>&nbsp;</td>

			<tr>
				<td>房间号码&nbsp;&nbsp;</td>
				<td><input type="text" class="form-control" placeholder="Text input" value="${param.room_num }" id="room_num" name="roomNum" readonly style="width:100%"></td>
			</tr>
			<td>&nbsp;</td>
			
		</table>
		<br>
		<!--  <input type="submit" value="确认入住">-->
		<input class="btn btn-default" type="submit" value="确认清扫" style="background-color:555555">
		<a href="../yggl.jsp"></a>
		</form>
	</div>
</body>
</body>
</html>