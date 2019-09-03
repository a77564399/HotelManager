<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>入住信息登记</title>
<script type="text/javascript" src="../static/js/jquery.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>

<script type="text/javascript">
$(function(){
	/*$("#year,#month,#day").bind("change",function(){
		//alert("OK");
		//console.log("OK");
		var year = document.getElementById("year").value;
		var month = document.getElementById("month").value;
		var day = document.getElementById("day").value;
		var roomNum = document.getElementById("room_num").value
		//alert(roomNum);
		$.post("${pageContext.request.contextPath}/getMoney.do",
		{
			"year":year,
			"month":month,
			"day":day,
			"roomNum":roomNum
		},function(data){
			alert(data);
			var money = document.getElementById("money");
			money.value=data;
		},"JSON");		
	});*/

	$("#year,#month,#day").bind("change",function(){
		var year = document.getElementById("year").value;
		var month = document.getElementById("month").value;
		var day = document.getElementById("day").value;
		var roomNum = document.getElementById("room_num").value
		var i = 0;
	$.ajax({
	    async:true,
	    cache : false,
	    data:{
	    	"year":year,
			"month":month,
			"day":day,
			"roomNum":roomNum
	    },
	    type:'GET',
	    error: function(){
	        alert('失败 ');
	    },
	    success : function(data) {
	    	var money = document.getElementById("money");
			money.value=data;
	    },
	    url:"${pageContext.request.contextPath}/getMoney.do"
		});
	});
});
</script>

<body>
		<h3 align="center">入住信息登记</h3>
		
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
        <li><a href="<%=request.getContextPath() %>/yggl?roomNum=0"> 客房管理<span class="sr-only">(current)</span></a></li>
        <li><a href="<%=request.getContextPath() %>/forehead/vipLog.jsp">会员注册</a></li>
        
      </ul>
      <form class="navbar-form navbar-left" action="show.action">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="查询房间" name="roomNum">
        </div>
        <button type="submit" class="btn btn-default">查询</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<%=request.getContextPath() %>/login.jsp ">退出登陆</a></li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		
		<div align="center" style="position:relative;right:50px;">
		<form action="../moveIn.do" method="post">
		<ul class="nav nav-pills nav-justified" style="width:20%;position:relative;left:40px;">
			<li id="" role="presentation" class="active"><a href="#">普通用户入住</a></li>
			<li role="presentation"><a href="vipDoIn.jsp?room_num=${param.room_num }">会员用户入住</a></li>
		</ul>
		<br>
		<table>
			
			<tr>
				<td>客户身份证号&nbsp;&nbsp;</td>
				<!-- <td><input class="form-control input-sm" type="text" placeholder=".input-sm" name="sfz"></td> -->
				<td><input type="text" class="form-control" placeholder="Text input" style="width:150%" name="sfz"></td>
			</tr>
			
			
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
				<td>客户姓名&nbsp;&nbsp;<br></td>
				<td><input type="text" class="form-control" placeholder="Text input" name="name" style="width:150%"></td>
				<!--  <td><input class="form-control input-sm" type="text" placeholder=".input-sm" name="vipid"></td>-->
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
				<td>入住日期至:&nbsp;&nbsp;</td>
				<td><select id="year" name="year">
					<option value="2019">2019</option>
					<option value="2020">2020</option>
				</select>年
				<select id="month" name="month">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>月
				<select id="day" name="day">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
				</select>日
				</td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
				<td>入住房间号&nbsp;&nbsp;</td>
				<td><input type="text" class="form-control" placeholder="Text input"  value="${param.room_num }" id="room_num" name="room_num" readonly style="width:50%"></td>
			</tr>
			<td>&nbsp;</td>
			<tr>
				<td>客户类型&nbsp;&nbsp;</td>
				<td><input type="text" class="form-control" placeholder="Text input"  value="普通客户" id="room_num" name="type" readonly style="width:50%"></td>
			</tr>
			<td>&nbsp;</td>
			<tr>
				<td><h4>住宿金额</h4>&nbsp;&nbsp;</td>
				
				<td><h4><input type="text" class="form-control" id="money" name="money" readonly></h4></td>
			<!-- 	<input type="text" class="form-control" placeholder="Text input"  value="..." name="room_num" readonly style="width:50%"> -->
			</tr>
		</table>
		<br>
		<!--  <input type="submit" value="确认入住">-->
		<input class="btn btn-default" type="submit" value="确认入住" style="background-color:555555">
		<a href="../yggl.jsp"></a>
		</form>
	</div>
</body>
</html>