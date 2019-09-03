package com.jdgl.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdgl.service.JdService;

@WebServlet("/MoveOut.do")
public class MoveOutServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		String roomNum = request.getParameter("roomNum");
		String[] ulCosts = request.getParameterValues("ulCost");
		HttpSession session =request.getSession();
		String doPerson = (String) session.getAttribute("ses");
		JdService js = new JdService();
		js.MoveOut(roomNum, doPerson, ulCosts);
		try {
			response.sendRedirect("success/moveOut.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
