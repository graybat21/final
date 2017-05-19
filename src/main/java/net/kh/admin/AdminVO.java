package net.kh.admin;

import java.util.Date;

public class AdminVO {
	
	private int rno;
	private String name;
	private int max;
	private String price;
	private String host_no;
	private Date reg;
	
	private int ino;
	private int room_no;
	private String filename;
	private String filesize;
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getHost_no() {
		return host_no;
	}
	public void setHost_no(String host_no) {
		this.host_no = host_no;
	}
	public Date getReg() {
		return reg;
	}
	public void setReg(Date reg) {
		this.reg = reg;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
}
