package com.jdgl.entity;

public class Worker {
	int workerId;
	int workerType;
	int workerSex;
	String workerName;
	public Worker() {
		super();
	}

	public Worker(int workerId, int workerType, int worker_sex) {
		super();
		this.workerId = workerId;
		this.workerType = workerType;
		this.workerSex = worker_sex;
	}
	
	public Worker(int workerId, int workerType, int workerSex, String workerName) {
		super();
		this.workerId = workerId;
		this.workerType = workerType;
		this.workerSex = workerSex;
		this.workerName = workerName;
	}

	public String getWorkerName() {
		return workerName;
	}

	public void setWorkerName(String workerName) {
		this.workerName = workerName;
	}

	public int getWorkerId() {
		return workerId;
	}

	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}

	public int getWorkerType() {
		return workerType;
	}

	public void setWorkerType(int workerType) {
		this.workerType = workerType;
	}

	public int getWorkerSex() {
		return workerSex;
	}

	public void setWorkerSex(int worker_sex) {
		this.workerSex = worker_sex;
	}
	
}
