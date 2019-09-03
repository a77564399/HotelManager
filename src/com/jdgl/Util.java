package com.jdgl;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {
	public static String stateChange(int state)
	{
		if(state==0){
			return "空闲";
		}else if(state==1)
		{
			return "已入住";
		}else if(state==2){
			return "未打扫";
		}
		return "无状态";
	}
//	public static String getNowDate()
//	{
//		Date nowDay1 = new Date();
//		Date nowDay = sdf.parse(date1);
//	}
	public static String doStringArray(String[] Array)
	{
		String ans = "";
		if(Array==null)
		{
			ans = null;
		}else {
			for(String t:Array)
			{
				ans+=t+"#";
			}
			
		}
		return ans;
	}
	
	public static String getNowTime()
	{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date1 = sdf.format(date);
		return date1;
	}
	public static String getNowTime1()
	{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = sdf.format(date);
		return date1;
	}
}
