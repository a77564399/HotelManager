 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String cxtPath = request.getContextPath();

%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=cxtPath %>/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=cxtPath %>/static/js/jquery.js"></script>

<script type="text/javascript">
$(function(){
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>功能列表</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="<%=cxtPath %>/static/img/leftico01.png" /></span>酒店系统
    </div>
    	<ul class="menuson">
        
        <li>
            <div class="header">
            <cite></cite>
            <a href="#" target="rightFrame">酒店信息管理</a>
            <i></i>
            </div>
            <ul class="sub-menus">
            <li><a href="<%=cxtPath %>/show.action" target="rightFrame">客房管理</a></li>
          <li><a href="<%=cxtPath %>/searchWorker.do" target="rightFrame">员工管理</a></li>
          <li><a href="<%=cxtPath %>/cleanWorker.do" target="rightFrame">清洁工管理</a></li>
            </ul>
        </li>     
        </ul>    
    </dd>
    
    </dl>
    
</body>
</html>