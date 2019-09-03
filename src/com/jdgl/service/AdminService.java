package com.jdgl.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jdbc.DButil.DButil;
import com.jdgl.entity.RoomState;
import com.mysql.fabric.xmlrpc.base.Data;

public class AdminService {
	//获取房间状态
	public RoomState roomState()
	{
		String countAllSql="select count(*) from room where 1=1";
		String preMoveInSql = countAllSql + " and room_stat = 0";
		String MovedSql = countAllSql + " and room_stat = 1";
		RoomState ros = new RoomState();
		try {
			Connection conn = DButil.getConn();
			ResultSet rs = null;
			rs=DButil.select(countAllSql);
			rs.next();
			ros.setCountAll(rs.getInt("count(*)"));
			
			rs=DButil.select(preMoveInSql);
			rs.next();
			ros.setPreMoveIn(rs.getInt("count(*)"));
			
			rs=DButil.select(MovedSql);
			rs.next();
			ros.setMoved(rs.getInt("count(*)"));
			
			ros.setClean();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				DButil.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ros;
	}
	
	//vip总人数
	public int vipNum()
	{
		String countAllSql="select count(*) from vip where 1=1";
		int num=0;
		try {
			Connection conn = DButil.getConn();
			ResultSet rs = null;
			rs=DButil.select(countAllSql);
			rs.next();
			num = rs.getInt("count(*)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
	//客户总人数
	public int customNum()
	{
		String countAllSql="select count(*) from custom where 1=1";
		int num=0;
		try {
			Connection conn = DButil.getConn();
			ResultSet rs = null;
			rs=DButil.select(countAllSql);
			rs.next();
			num = rs.getInt("count(*)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
	//date天客户数量
	public int dayCostomNum(String data)
	{
		
		String countAllSql="SELECT count(*) FROM `order` WHERE ( datediff ( order_data , '" + data + "' ) = 0 );";
		int num=0;
		try {
			Connection conn = DButil.getConn();
			ResultSet rs = null;
			rs=DButil.select(countAllSql);
			rs.next();
			num = rs.getInt("count(*)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
	//date天销售额
	public int daySaleNum(String data)
	{
		
		String countAllSql="SELECT sum(money) FROM `order` where ( datediff ( order_data , '" + data + "' ) = 0 )";
		int num=0;
		try {
			Connection conn = DButil.getConn();
			ResultSet rs = null;
			rs=DButil.select(countAllSql);
			rs.next();
			num = rs.getInt("sum(money)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
}
