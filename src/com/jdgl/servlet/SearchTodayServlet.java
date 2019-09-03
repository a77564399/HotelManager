package com.jdgl.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.Util;
import com.jdgl.entity.Room;
import com.jdgl.service.JdService;
@WebServlet("/todaySearch.do")
public class SearchTodayServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		String toDay = Util.getNowTime1();
		JdService js = new JdService();
		List<Room> roomList = js.searchRoom(toDay);
		request.setAttribute("roomList", roomList);
		try {
			request.getRequestDispatcher("forehead/yggl.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
