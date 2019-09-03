package com.jdgl.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.jdbc.DButil.DButil;
import com.jdgl.entity.Worker;

public class BackService {
	public List<Worker> serachWorker(String workerId) 
	{
		ResultSet rs = null;
		String sql="select * from worker where worker_type=0";
		List<Worker> workerList = new LinkedList<Worker>();
		if(!"".equals(workerId))
		{
			sql = sql+" and worker_id="+workerId;
		}
		try {
			rs = DButil.select(sql);
			while(rs.next())
			{
				Worker w = new Worker();
				w.setWorkerId(rs.getInt("worker_id"));
				w.setWorkerSex(rs.getInt("worker_sex"));
				w.setWorkerType(rs.getInt("worker_type"));
				w.setWorkerName(rs.getString("worker_name"));
				workerList.add(w);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return workerList;
	}
	public List<Worker> serachCleanWorker(String workerId)
	{
		ResultSet rs = null;
		String sql="select * from worker where worker_type=2";
		List<Worker> workerList = new LinkedList<Worker>();
		if(!"".equals(workerId))
		{
			sql = sql+" and worker_id="+workerId;
		}
		try {
			rs = DButil.select(sql);
			while(rs.next())
			{
				Worker w = new Worker();
				w.setWorkerId(rs.getInt("worker_id"));
				w.setWorkerSex(rs.getInt("worker_sex"));
				w.setWorkerName(rs.getString("worker_name"));
				workerList.add(w);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return workerList;
	}
}
