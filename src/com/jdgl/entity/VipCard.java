package com.jdgl.entity;

public class VipCard {
	private int vipId;
	private int vipType;
	private int integral;
	private String idCard;
	private String name;
	private String phone;
	private int sex;
	public VipCard() {
		super();
	}

	public VipCard(int vipId, int vipType, int integral, String idCard, String name, String phone, int sex) {
		super();
		this.vipId = vipId;
		this.vipType = vipType;
		this.integral = integral;
		this.idCard = idCard;
		this.name = name;
		this.phone = phone;
		this.sex = sex;
	}

	public int getVipId() {
		return vipId;
	}

	public void setVipId(int vipId) {
		this.vipId = vipId;
	}

	public int getVipType() {
		return vipType;
	}

	public void setVipType(int vipType) {
		this.vipType = vipType;
	}

	public int getIntegral() {
		return integral;
	}

	public void setIntegral(int integral) {
		this.integral = integral;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

}
