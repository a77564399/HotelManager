package com.jdgl.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.service.JdService;

@WebServlet("/getMoney.do")
public class AjaxGetMoneyServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		response.setContentType("text/html; charset=utf-8");
	    response.setCharacterEncoding("UTF-8");
		JdService js = new JdService();
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day1 = request.getParameter("day");
		String roomNum = request.getParameter("roomNum");
		System.out.println(year);
		
		String day = year+"-"+month+"-"+day1;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDay1 = new Date();
		String date1 = sdf.format(nowDay1);
		try {
			Date nowDay = sdf.parse(date1);
			Date toDay = sdf.parse(day);
			System.out.println(roomNum);
			System.out.println(nowDay);
			System.out.println(toDay);
			long price1 = js.calPrice(roomNum, nowDay,toDay);
			int price = (int)price1;
			System.out.println(price);
			response.getWriter().print(price);
		} catch (ParseException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
