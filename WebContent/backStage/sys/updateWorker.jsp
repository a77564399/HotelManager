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
    <li><a href="#">添加员工</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools" >
    

        
        
        <ul class="toolbar1">
        <li><span><img src="<%=cxtPath %>/static/img/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
    <div align="center" style="position:relative;right:50px;">
		<form action="<%=request.getContextPath() %>/updateWorker.do">
		<table>
			<tr>
				<td>员工编号&nbsp;&nbsp;</td>
			
				<td><input type="text" class="form-control" placeholder="Text input" style="width:150%" name="workerNo" value=${param.workerNo } readonly></td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			</tr>
			<tr>
				<td>员工姓名&nbsp;&nbsp;</td>
				<td><input type="text" class="form-control" placeholder="Text input" style="width:150%" name="name"></td>
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
				<td>密码：&nbsp;&nbsp;</td>
				<td><input type="password" class="form-control" placeholder="Text input" style="width:150%" name="workerPaw"></td>
			</tr>
			
			<tr>
			<td>&nbsp;</td>
			</tr>
		</table>
		<br>
		<!--  <input type="submit" value="确认入住">-->
		<input class="btn btn-default" type="submit" value="确认修改" style="background-color:555555">
		<a href="../yggl.jsp"></a>
		</form>
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