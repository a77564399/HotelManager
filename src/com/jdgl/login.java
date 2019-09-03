package com.jdgl;

import java.io.UnsupportedEncodingException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.DButil.DButil;;
//@WebServlet("/login")
public class login extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("UTF-8");
		String user=request.getParameter("user");
		String type=request.getParameter("login-type");
		String passwd=request.getParameter("passwd");
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		String sql="select * from worker where worker_id =? and worker_type=? and passwd=PASSWORD(?)";
		HttpSession session=request.getSession();
		try {
			conn=DButil.getConn();
			ps=conn.prepareStatement(sql);
			ps.setString(1, user);
			ps.setString(2, type);
			ps.setString(3, passwd);
			rs=ps.executeQuery();
			
			if(rs.next())
			{

					if("0".equals(type))
					{
						session.setAttribute("ses",user);
						response.sendRedirect("yggl?roomNum=0");
					}else if("1".equals(type))
					{
						session.setAttribute("ses",user);
						response.sendRedirect("backStage/main.jsp");
					}
				}else {
					request.setAttribute("msg", "用户名密码错误或登陆类型不匹配");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
