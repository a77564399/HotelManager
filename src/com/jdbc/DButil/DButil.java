package com.jdbc.DButil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DButil {
	private static String driver="com.mysql.jdbc.Driver";
	private static String url="jdbc:mysql://localhost:3306/jdgl?useUnicode=true&characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Shanghai";
	private static String user="root";
	private static String password="123456";
	private static Connection conn = null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
	//加载驱动
	public static Connection getConn() throws SQLException {
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	//释放资源
	public static void close() throws SQLException
	{
		if(rs!=null)
		{
			rs.close();
		}
		if(ps!=null)
		{
			ps.close();
		}
		if(conn!=null)
		{
			conn.close();
		}
	}
	//查询
	public static ResultSet select(String sql,Object[] obj) throws SQLException
	{
		DButil.getConn();
		try {
			ps=conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i=0;i<obj.length;i++)
		{
			ps.setObject(i+1,obj[i]);
		}
		rs=ps.executeQuery();
		return rs;
	}
	
	//无条件查询
	public static ResultSet select(String sql) throws SQLException
	{
		DButil.getConn();
		try {
			ps=conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		rs=ps.executeQuery();
		return rs;
	}
	
	//修改
	 public static int update0(String sql) throws SQLException{
		 DButil.getConn();
	        try {
	            ps=conn.prepareStatement(sql);
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            System.out.println("发送失败");
	        }
	        int a=0;
	        try {
	            a = ps.executeUpdate();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            System.out.println("执行sql语句失败");
	        }finally {
	        	DButil.close();
	        }
	        return a;
	    } 
	
	
	
	
	
	
	public static int update(String sql,Object[]obj) throws SQLException{
		 DButil.getConn();
	        try {
	            ps=conn.prepareStatement(sql);
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            System.out.println("发送失败");
	        }
	        for(int i=0;i<obj.length;i++){
	            try {
	                ps.setObject(i+1, obj[i]);
	            } catch (SQLException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	                System.out.println("参数设置失败");
	            }
	        }
	        int a=0;
	        try {
	            a = ps.executeUpdate();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            System.out.println("执行sql语句失败");
	        }finally {
	        	DButil.close();
	        }
	        return a;
	    }
}
