package com.jdgl.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.service.JdService;
@WebServlet("/preMoveOut.do")
public class PreMoveOutServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		System.out.println(request.getParameter( "room_num"));
		String roomNum = request.getParameter( "room_num");
		JdService js = new JdService();
		int costMoney = js.preMoveOut(roomNum);
		String custom = js.getCustom(roomNum);
		request.setAttribute("money", costMoney);
		request.setAttribute("roomNum", roomNum);
		request.setAttribute("custom", custom);
		try {
			request.getRequestDispatcher("sys/MoveOut.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
