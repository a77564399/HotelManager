<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="static/js/jquery.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
</head>


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
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
  
		<li><a href="../yggl?roomNum=0">客房管理</a></li>       
        <li class="active"><a href="forehead/vipLog.jsp"> 会员注册<span class="sr-only">(current)</span></a></li> 
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<div align="center" style="position:relative;right:50px;">
		<form action="../vipLog">
		<table>
			<tr>
				<td>客户姓名&nbsp;&nbsp;</td>
			
				<td><input type="text" class="form-control" placeholder="Text input" style="width:150%" name="costomName"></td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
				<td>手机号&nbsp;&nbsp;</td>
				<td><input type="text" class="form-control" placeholder="Text input" style="width:150%" name="phone"></td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
				<td>性别:&nbsp;&nbsp;</td>
				<td><input type="radio" value="1" name="sex">男&nbsp;&nbsp;<input type="radio" value="0" name="sex">女</td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
				<td>身份证号&nbsp;&nbsp;</td>
				<td><input type="text" class="form-control" placeholder="Text input" style="width:150%" name="idCard"></td>
			</tr>
			
			<tr>
			<td>&nbsp;</td>
			</tr>
		</table>
		<br>
		<!--  <input type="submit" value="确认入住">-->
		<input class="btn btn-default" type="submit" value="注册" style="background-color:555555">
		<a href="../yggl.jsp"></a>
		</form>
		</div>

</body>
</html>