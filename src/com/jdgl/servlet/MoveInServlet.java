package com.jdgl.servlet;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.service.JdService;

@WebServlet("/moveIn.do")
public class MoveInServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		
		String roomNum = request.getParameter("room_num");
		
		String type = request.getParameter("type");
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day1 = request.getParameter("day");
		String day = year+"-"+month+"-"+day1;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDay1 = new Date();
		String date1 = sdf.format(nowDay1);
		JdService js = new JdService();
	
		try {
			Date nowDay = sdf.parse(date1);
			Date toDay = sdf.parse(day);
			double money = js.calPrice(roomNum, nowDay, toDay);
			if(type.equals("普通客户")) {
				String idCard = request.getParameter("sfz");
				String phone = request.getParameter("phone");
				String sex = request.getParameter("sex");
				String name = request.getParameter("name");
				js.moveIn(idCard, name,money, phone, sex, roomNum, type,nowDay,toDay);
			}else {
				String vipCard = request.getParameter("vipCard");
				double money1=money*0.8;
				js.vipMoveIn(vipCard, money1, roomNum, type, nowDay, toDay,request,response);
			}
			request.setAttribute("roomNum", roomNum);
			request.getRequestDispatcher("success/MoveIn.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
