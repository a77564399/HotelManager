package com.jdgl.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.entity.Room;
import com.jdgl.service.JdService;

public class RoomListServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		System.out.println(request.getParameter("roomNum"));
		request.setCharacterEncoding("UTF-8");
		int roomNum=Integer.parseInt(request.getParameter("roomNum"));
		List<Room> roomList = new LinkedList<Room>();
		JdService service = new JdService();
		roomList=service.showList(roomNum);
		request.setAttribute("roomList", roomList);
		try {
			request.getRequestDispatcher("forehead/yggl.jsp").forward(request, response);
		} catch (ServletException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
