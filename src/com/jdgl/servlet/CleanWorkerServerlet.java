package com.jdgl.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdgl.entity.Worker;
import com.jdgl.service.BackService;

public class CleanWorkerServerlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		String workerId = request.getParameter("workerId");
		if(workerId==null||"".equals(workerId))
		{
			workerId="";
		}
		BackService bs = new BackService();
		List<Worker> workerList = new LinkedList<Worker>();
		workerList = bs.serachWorker(workerId);
		request.setAttribute("workerList", workerList);
		try {
			request.getRequestDispatcher("backStage/sys/WorkerManager.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
