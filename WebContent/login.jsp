<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- Bootstrap -->
    <link href="assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/vendor/bootstrap-checkbox.css">
    <link href="assets/css/minimal.css" rel="stylesheet">
</head>
<body class="bg-1">
 

    <!-- Wrap all page content here -->
    <div id="wrap">
      <!-- Make page fluid -->
      <div class="row">
        <!-- Page content -->
        <div id="content" class="col-md-12 full-page login">


          <div class="inside-block">
            <img src="assets/images/logo-big.png" alt class="logo">
            <h1><strong>欢迎</strong> 登陆</h1>
            <h5>酒店管理系统</h5>

            <form id="form-signin" class="form-signin" action="login" method="post">
              <section>
                <div class="input-group">
                  <input type="text" class="form-control" name="user" placeholder="用户名">
                  <div class="input-group-addon"><i class="fa fa-user"></i></div>
                </div>
                <div class="input-group">
                  <input type="password" class="form-control" name="passwd" placeholder="密码">
                  <div class="input-group-addon"><i class="fa fa-key"></i></div>
                </div>
                <div class="input-group">
                <input type="radio" name="login-type" value="0" checked="checked">员工登陆 &nbsp; &nbsp; &nbsp;<input type="radio" name="login-type" value="1">管理员登陆
                </div>
                <div>
  				  <c:if test="${msg!=null }">
 				   ${msg}
  				  </c:if>
                </div>
                
              </section>
              <section class="controls">
              </section>
              <section class="log-in">
                <button class="btn btn-greensea">登陆</button>
              </section>
            </form>
          </div>


        </div>
        <!-- /Page content -->  
      </div>
    </div>
    <!-- Wrap all page content end -->
  </body>
</html>