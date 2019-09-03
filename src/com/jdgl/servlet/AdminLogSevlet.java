package com.jdgl.servlet;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.entity.RoomState;
import com.jdgl.service.AdminService;
@WebServlet("/AdminLog")
public class AdminLogSevlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		AdminService as = new AdminService();
		
		//获取房间状态
		RoomState rs = as.roomState();
		//获取今日与昨日日期，传入对比
		Calendar cal=Calendar.getInstance();   
		Date date = new Date();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_MONTH, -1);
		Date yesterday = cal.getTime();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
		//
		
		
		
		request.setAttribute("todayCostomNum", as.dayCostomNum(dateFormat.format(date)));
		request.setAttribute("yesterdayCostomNum", as.dayCostomNum(dateFormat.format(yesterday)));
		request.setAttribute("daySaleNum", as.daySaleNum(dateFormat.format(date)));
		request.setAttribute("yesterdaySaleNum", as.daySaleNum(dateFormat.format(yesterday)));
		request.setAttribute("roomState", rs);
		request.setAttribute("vipNum", as.vipNum());
		request.setAttribute("customNum", as.customNum());
		
		try {
			request.getRequestDispatcher("backStage/index.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
