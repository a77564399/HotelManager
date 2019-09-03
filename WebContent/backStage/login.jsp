<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String cxtPath = request.getContextPath();

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="<%=cxtPath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=cxtPath %>/static/js/jquery.js"></script>
<script src="<%=cxtPath %>/static/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(<%=cxtPath %>/static/img/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    <form action="doLogin.jsp" method="post">
    <ul>
    <li><input name="userName" type="text" class="loginuser" value="用户名" onclick="JavaScript:this.value=''"/></li>
    <li><input name="passwd" type="password" class="loginpwd" value="密码" onclick="JavaScript:this.value=''"/></li>
    <li><input type="submit" class="loginbtn" value="登录" /></li>
    </ul>
    </form>
    </div>
    </div>
    <div class="loginbm">版权所有  2014  仅供学习交流，勿用于任何商业用途</div>
</body>

</html>