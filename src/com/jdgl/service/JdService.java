package com.jdgl.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

import com.jdbc.DButil.DButil;
import com.jdgl.Util;
import com.jdgl.entity.Room;
import com.jdgl.entity.VipCard;
public class JdService {
	public List<Room> showList(int roomNum)
	{
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Room r=null;
		List<Room> roomList=new LinkedList<Room>();
		String sql="select * from room where 1=1";
		try {
			conn=DButil.getConn();
			if(roomNum!=0)
			{
				sql+=" and room_num="+roomNum;
			}
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				r=new Room(rs.getInt("room_num"),rs.getInt("room_stat"),rs.getInt("room_price"),rs.getString("custom"));
				roomList.add(r);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DButil.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return roomList;
	}
//	public void moveIn(String room_num)
//	{
//		int price=0;
//		String room_num=request.getParameter("room_num");
//		System.out.println(room_num);
//		String id=request.getParameter("sfz");
//		System.out.println(id);
//		String vipId=request.getParameter("vipid");
//		String sql="Update room set room_stat=1 where room_num=?";
//		String sql5="Update room set custom=? where room_num=?";
//		String sql1="select * from room where room_num="+room_num;
//		Connection conn=null;
//		PreparedStatement ps=null;
//		ResultSet rs=null;
//		try{
//			conn=DButil.getConn();
//			ps=conn.prepareStatement(sql);
//			ps.setString(1, room_num);
//			ps.executeUpdate();
//			ps=conn.prepareStatement(sql1);
//			rs=ps.executeQuery();
//			ps=conn.prepareStatement(sql5);
//			ps.setString(1, id);
//			ps.setString(2, room_num);
//			ps.executeUpdate();
//			if(rs.next()){
//				System.out.print(rs.getString("room_price"));
//				price=rs.getInt("room_price");
//			}
//	}
	@Test
	public void vipLog(VipCard vc)
	{
		String sql = "insert into vip (idCard,name,phone,sex) values (?,?,?,?)";
		Object[] obj = {vc.getIdCard(),vc.getName(),vc.getPhone(),vc.getSex()};
		try {
			DButil.update(sql, obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int returnId()
	{
		int id = 0;
		String sql = "select * from  vip  order by id desc limit 0,1";
		try {
			ResultSet rs = DButil.select(sql);
			rs.next();
			id = rs.getInt("id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	public long calPrice(String roomNum,long divDay)
	{
		int roomPrice = 0;
		long price = 0;
		String sql = "select room_price from  room where room_num = "+roomNum;
		try {
			ResultSet rs = DButil.select(sql);
			rs.next();
			roomPrice = rs.getInt("room_price");
			System.out.println(roomPrice);
			System.out.println(divDay);
			price = roomPrice * divDay;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}
	
	public long calPrice(String roomNum,Date nowDay,Date toDay)
	{
		int roomPrice = 0;
		long price = 0;
		
		long nd = 1000*24*60*60;
		long diff = toDay.getTime()-nowDay.getTime();
		long divDay = diff/nd;
		
		String sql = "select room_price from  room where room_num = "+roomNum;
		try {
			ResultSet rs = DButil.select(sql);
			rs.next();
			roomPrice = rs.getInt("room_price");
//			System.out.println(roomPrice);
//			System.out.println(divDay);
			price = roomPrice * divDay;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}
	
	
	public void moveIn(String idCard,String name,double money,String phone,String sex,String roomNum,String type,Date nowDay,Date toDay)
	{
		String searchSql = "select * from custom where id = "+idCard;
		String customSql = "insert into custom values (?,?,?,?,?,?)";
		String roomSql = "update room set room_stat=?, custom=?, movein_date=? , moveout_date=? where room_num=?";
		Object[] obj1 = {idCard,money,type,phone,sex,name};
		Object[] obj2 = {1,idCard,nowDay,toDay,roomNum};
		ResultSet rs = null;
		try {
			rs = DButil.select(searchSql);
			if(rs.next())
			{
				DButil.update(roomSql, obj2);
			}else {
				DButil.update(customSql, obj1);
				DButil.update(roomSql, obj2);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void vipMoveIn(String vipCard,double money,String roomNum,String type,Date nowDay,Date toDay,HttpServletRequest request,HttpServletResponse response)
	{
		String sql = "select * from  vip where id = "+vipCard;
		String customSql = "insert into custom values (?,?,?,?,?,?)";
		String roomSql = "update room set room_stat=?, custom=?, movein_date=? , moveout_date=? where room_num=?";
		
		
		ResultSet rs = null;
		try {
			rs = DButil.select(sql);
			if(rs.next())
			{
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			int sex = rs.getInt("sex");
			String idCard = rs.getString("idCard");
			Object[] obj1 = {idCard,money,type,phone,sex,name};
			Object[] obj2 = {1,idCard,nowDay,toDay,roomNum};
			DButil.update(customSql, obj1);
			DButil.update(roomSql, obj2);
			}else {
				request.setAttribute("errorMsg", "会员卡号不存在");
				request.getRequestDispatcher("success/ErrorVip.jsp").forward(request, response);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public int preMoveOut(String roomNum) 
	{
		String sql = "select * from  room,custom where custom.id = room.custom and room_num = "+roomNum;
		ResultSet rs = null;
		int money = 0;
		try {
			rs = DButil.select(sql);
			rs.next();
			money = rs.getInt("costMoney");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return money;
	}
	
	public String getCustom(String roomNum) 
	{
		String sql = "select * from  room where room_num = "+roomNum;
		ResultSet rs = null;
		String custom = null;
		try {
			rs = DButil.select(sql);
			rs.next();
			custom = rs.getString("custom");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return custom;
	}
	
	public void MoveOut(String roomNum,String doPerson,String[] ulCosts)
	{
		Date date1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(date1);
//		System.out.println(date);
		
		String updateSql = "update room set room_stat =2,custom = null,movein_date=null,moveout_date=null where room_num = "+roomNum;
		String insertSql = "insert into jdorder (customer_id,room,money,order_data,costThing,do_person) values (?,?,?,?,?,?)";
		
		
		
//		System.out.println("-----"+roomNum);
		String selectSql = "select * from room,custom where room.custom = custom.id and room_num = "+roomNum;
		String deleteSql = "delete from custom where id =?";
		String ulCost = Util.doStringArray(ulCosts);
		ResultSet rs = null;
		try {
			rs = DButil.select(selectSql);
			rs.next();
			String idCard = rs.getString("id");
			int money = rs.getInt("costMoney");
			Object[] obj1 = {idCard};
			Object[] obj = {idCard,roomNum,money,date,ulCost,doPerson};
			
			
			DButil.update0(updateSql);
			DButil.update(deleteSql, obj1);
			DButil.update(insertSql, obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void clean(String roomNum,String workerId)
	{
		String updateSql = "update room set room_stat =0 where room_num = "+roomNum;
		String updateSql2 = "update clean_worker set clean_num=clean_num+1 where worker_id = "+workerId;
		String insertSql = "insert into clean_distory values(?,?,?)";
		Object[] obj = {workerId,roomNum,Util.getNowTime()};
		try {
			DButil.update0(updateSql);
			DButil.update0(updateSql2);
			DButil.update(insertSql, obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void addRoom(String roomNum,String price)
	{
		String insertSql = "insert into room values(?,?,?,?,?,?)";
		Object[] obj= {roomNum,0,price,null,null,null};
		try {
			DButil.update(insertSql, obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void delRoom(String roomNum)
	{
		String deleteSql = "delete from room where room_num ="+roomNum;
		try {
			DButil.update0(deleteSql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<Room> searchRoom(String toDay)
	{
		System.out.println(toDay);
		String sql="select * from room where date_format(moveout_date,'%Y-%m-%d') = '"+toDay+"'";
		List<Room> roomList=new LinkedList<Room>();
		ResultSet rs=null;
		try {
			rs=DButil.select(sql);
			while(rs.next())
			{
				Room r = new Room();
				r.setCustom(rs.getString("custom"));
				r.setNum(rs.getInt("room_num"));
				r.setPrice(rs.getInt("room_price"));
				r.setStat(rs.getInt("room_stat"));
				roomList.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return roomList;
	}
	public void addWorker(String workerName,String workerNo,String sex,String workerPaw)
	{
		String sql = "insert into worker values(?,?,?,?,?)";
		Object[] obj = {workerNo,0,workerPaw,sex,workerName};
		try {
			DButil.update(sql, obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void updateWorker(String workerName, String workerNo, String sex, String workerPaw) {
		System.out.println(workerName);
		String sql = "update worker set worker_name=?,worker_sex=?,passwd=PASSWORD(?) where worker_id=? and worker_type=0";
		Object[] obj = {workerName,sex,workerPaw,workerNo};
		try {
			DButil.update(sql, obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}
}