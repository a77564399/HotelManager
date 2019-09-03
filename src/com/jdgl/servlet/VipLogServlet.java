package com.jdgl.servlet;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.jdgl.entity.VipCard;
import com.jdgl.service.JdService;
public class VipLogServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		VipCard vc = new VipCard();
		try {
			vc.setName(request.getParameter("costomName"));
			vc.setPhone(request.getParameter("phone"));
			vc.setSex(Integer.parseInt(request.getParameter("sex")));
			vc.setIdCard(request.getParameter("idCard"));//运用一个ajax判断是否已经注册过
			
			JdService js = new JdService();
			js.vipLog(vc);
			System.out.println(js.returnId());
			request.setAttribute("vipId", js.returnId());
			request.getRequestDispatcher("success/successLog.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
