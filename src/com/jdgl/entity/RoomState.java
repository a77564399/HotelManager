package com.jdgl.entity;

public class RoomState {
	private int countAll;
	private int preMoveIn;
	private int Moved;
	private int preClean;
	public void setClean()
	{
		preClean = countAll-preMoveIn-Moved;
	}
	public RoomState() {
		super();
	}
	public RoomState(int countAll, int preMoveIn, int moved, int preClean) {
		super();
		this.countAll = countAll;
		this.preMoveIn = preMoveIn;
		Moved = moved;
		this.preClean = preClean;
	}
	public int getCountAll() {
		return countAll;
	}
	public void setCountAll(int countAll) {
		this.countAll = countAll;
	}
	public int getPreMoveIn() {
		return preMoveIn;
	}
	public void setPreMoveIn(int preMoveIn) {
		this.preMoveIn = preMoveIn;
	}
	public int getMoved() {
		return Moved;
	}
	public void setMoved(int moved) {
		Moved = moved;
	}
	public int getPreClean() {
		return preClean;
	}
	public void setPreClean(int preClean) {
		this.preClean = preClean;
	}
	
}
