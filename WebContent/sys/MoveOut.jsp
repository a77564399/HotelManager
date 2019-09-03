<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.room_num }退房结算</title>
<script type="text/javascript" src="../static/js/jquery.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>


<body>
		<h3 align="center">${param.room_num }退房结算</h3>
		
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
		<form action="MoveOut.do">
		<table>
			<tr>
				<td>入住客户&nbsp;&nbsp;</td>
				<td><input type="text" class="form-control" placeholder="Text input"  value="${custom }" id="room_num" name="room_num" readonly style="width:100%"></td>
			</tr>
			
			<td>&nbsp;</td>

			<tr>
				<td>额外消费&nbsp;&nbsp;</td>
				<td><input type="checkbox" value="1" name="ulCost" id="ulCost">用餐&nbsp;&nbsp;<input type="checkbox" value="2" name="ulCost" id="ulCost">酒水&nbsp;&nbsp;<input type="checkbox" value="3" name="ulCost" id="ulCost">服装</td>
			</tr>
			<td>&nbsp;</td>
			<tr>
				<td>入住房间号&nbsp;&nbsp;</td>
				<td><input type="text" class="form-control" placeholder="Text input"  value="${roomNum }" id="room_num" name="roomNum" readonly style="width:50%"></td>
			</tr>
			
			<td>&nbsp;</td>
			
			<tr>
				<td>住宿金额&nbsp;&nbsp;</td>
				
				<td><h4><input type="text" class="form-control" id="money" name="money" readonly value="${money }"></h4></td>
			<!-- 	<input type="text" class="form-control" placeholder="Text input"  value="..." name="room_num" readonly style="width:50%"> -->
			</tr>
		</table>
		<br>
		<!--  <input type="submit" value="确认入住">-->
		<input class="btn btn-default" type="submit" value="确认退房" style="background-color:555555">
		<a href="../yggl.jsp"></a>
		</form>
	</div>
</body>
<script type="text/javascript">
(function(){
	/*$("#year,#month,#day").bind("change",function(){
		alert("OK");
		console.log("OK");
		var year = document.getElementById("year").value;
		var month = document.getElementById("month").value;
		var day = document.getElementById("day").value;
		var roomNum = document.getElementById("room_num").value
		alert(roomNum);
		$.post("${pageContext.request.contextPath}/getMoney.do",
		{
			"year":year,
			"month":month,
			"day":day,
			"roomNum":roomNum
		},function(data){
			var money = document.getElementById("money");
			money.value=data;
		},"JSON");		
	});
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;
	var day = document.getElementById("day").value;
	var roomNum = document.getElementById("room_num").value
	var i = 0;
	$("#sure").bind("click",function(){
	$.ajax({
	    async:false,
	    cache : false,
	    data:{
	    	"year":year,
			"month":month,
			"day":day,
	    },
	    type:'GET',
	    error: function(){
	        alert('失败 ');
	    },
	    success : function(data) {
	    	var money = document.getElementById("money");
	    	alert(data);
			money.value=data;
	    },
	    url:"${pageContext.request.contextPath}/getMoney.do?tm="+new Date()
		});
	});*/
	("#ulCost").bind("change",function(){
	var ulCost = document.getElementById("ulCost").value;
	alert(ulCost);
	});
	
	var ulCosts = document.getElementsByName("ulCost");
	var ulCost = "";
	if(ulCosts[0].checked)
	{
		alter("id");
		var nowMoney = document.getElementById("money").value;
		console.log(nowMoney);
		var toMoney = nowMoney+80;
		
		document.getElementById("money").value = toMoney;
	}
});
</script>

</html>