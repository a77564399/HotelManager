package com.jdgl.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.entity.Room;
import com.jdgl.service.JdService;
@WebServlet("/show.action")
public class ShowServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		int roomNum = 0;
		String roomNum1=request.getParameter("roomNum");
		if("".equals(roomNum1)||roomNum1==null)
		{
			roomNum = 0;
		}else {
			roomNum = Integer.parseInt(roomNum1);
		}
		
		List<Room> roomList = new LinkedList<Room>();
		JdService service = new JdService();
		
		roomList=service.showList(roomNum);
		request.setAttribute("roomList", roomList);
		try {
			
			request.getRequestDispatcher("backStage/sys/roomManager.jsp").forward(request, response);
		} catch (ServletException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
