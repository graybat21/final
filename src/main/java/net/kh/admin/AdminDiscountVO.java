package net.kh.admin;

import java.util.Date;

public class AdminDiscountVO {

	// room 테이블
	private String name;
	private int price;
	
	// image 테이블
	private String filename;
	
	// discount 테이블
	private int no;
	private int roomno;
	private Date starttime;
	private Date endtime;
	private String newprice;
	private Date reg;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public String getNewprice() {
		return newprice;
	}
	public void setNewprice(String newprice) {
		this.newprice = newprice;
	}
	public Date getReg() {
		return reg;
	}
	public void setReg(Date reg) {
		this.reg = reg;
	}
	
	
}
