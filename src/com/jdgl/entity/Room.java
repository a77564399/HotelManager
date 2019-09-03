package com.jdgl.entity;

public class Room {
	private int num;
	private int stat;
	private int price;
	private String custom;
	
	public Room() {
		super();
	}
	public Room(int num, int stat, int price, String custom) {
		super();
		this.num = num;
		this.stat = stat;
		this.price = price;
		this.custom = custom;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getStat() {
		return stat;
	}
	public void setStat(int stat) {
		this.stat = stat;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCustom() {
		return custom;
	}
	public void setCustom(String custom) {
		this.custom = custom;
	}
	
}
