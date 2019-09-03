package com.jdgl.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.service.JdService;

@WebServlet("/updateWorker.do")
public class UpdateWorkerServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		String workerNo = request.getParameter("workerNo");
		String workerName = request.getParameter("name");
		String workerPaw = request.getParameter("workerPaw");
		String sex = request.getParameter("sex");
		System.out.println(sex);
		JdService js = new JdService();
		js.updateWorker(workerName, workerNo, sex, workerPaw);
		try {
			response.sendRedirect("searchWorker.do");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
