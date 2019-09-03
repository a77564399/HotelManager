<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String cxtPath = request.getContextPath();
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="<%=cxtPath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=cxtPath %>/static/js/jquery.js"></script>
<script type="text/javascript" src="static/js/jquery.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<script type="text/javascript">

</script>



<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});

</script>





</head>
<body>
	<div class="place" >
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools" >
    
    	<ul class="toolbar">
        <li class="click"><span><img src="<%=cxtPath %>/static/img/t01.png" /></span>添加</li>
        <li class="click"><span><img src="<%=cxtPath %>/static/img/t02.png" /></span>修改</li>
        <li><span><img src="<%=cxtPath %>/static/img/t03.png" /></span>删除</li>
        <li><span><img src="<%=cxtPath %>/static/img/t04.png" /></span>统计</li>
        </ul>
        
        
        <ul class="toolbar1">
        <li><span><img src="<%=cxtPath %>/static/img/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead >
    	<tr align="center">
        <th>员工ID<i class="sort"><img src="<%=cxtPath %>/static/img/px.gif" /></i></th>
        <th>员工姓名</th>
        <th>员工类型</th>
        <th>员工性别</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var = "worker" items="${workerList }">
        
		<td >${worker.workerId}</td>
			
		<td >${worker.workerName}</td>
			
		<c:choose>
			<c:when test="${worker.workerType==0}">
			<td >员工</td>
			</c:when>
			<c:when test="${worker.workerType==1}">
			<td>管理员</td>
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${worker.workerSex==0}">
			<td >女</td>
			</c:when>
			<c:when test="${worker.workerSex==1}">
			<td >男</td>
			</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${worker.workerType==0}">
			<td width="30%"><a href="<%=request.getContextPath() %>/backStage/sys/updateWorker.jsp?workerNo=${worker.workerId}" class="tablelink">修改信息</a>&nbsp;&nbsp; <a href="delRoom.do?roomNum=${room.num}" class="tablelink"> 删除员工</a></td>
			</c:when>
			<c:when test="${worker.workerType==1}">
			<td>无权限</td>
			</c:when>
		</c:choose>
		</tr>
  		</c:forEach>
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>添加员工</span><a></a></div>
      <form action="addworker.do">
      <div class="tipinfo">
        
        <div class="tipright">
        <table>
        <tr>
        	<td>员工编号&nbsp;&nbsp;</td>
        	<td><input type="text" class="form-control" placeholder="Text input" style="width:150%" name="workerNo"></td>
        </tr>
    
        
        <tr>
        	<td>员工姓名&nbsp;&nbsp;</td>
        	<td><input type="text" class="form-control" placeholder="Text input" style="width:150%" name="workerName"></td>
        </tr>
        
        <tr>
        	<td>性别&nbsp;&nbsp;</td>
        	<td><input type="radio" name="sex" value="1"/>男<input type="radio" name="sex" value="0"/>女</td>
        </tr>
        
        <tr>
        	<td>密码&nbsp;&nbsp;</td>
        	<td><input type="text" class="form-control" placeholder="Text input" style="width:150%" name="workerPaw"></td>
        </tr>
       
        
        <tr align="center">
        	<td ><input type="submit"  class="sure" value="确定" /></td>
        </tr>
        
        </table>
        </div>
        </div>
        <br></br>
        <div style="position: absolute;left:200px;">
        <br></br>
        
        </div>
    </form>
    </div>
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>