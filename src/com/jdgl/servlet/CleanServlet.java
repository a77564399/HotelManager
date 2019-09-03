package com.jdgl.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.service.JdService;
@WebServlet("/clean.do")
public class CleanServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		String workerId = request.getParameter("workerId");
		String roomNum = request.getParameter("roomNum");
		JdService js = new JdService();
		js.clean(roomNum, workerId);
		try {
			response.sendRedirect("yggl?roomNum=0");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
