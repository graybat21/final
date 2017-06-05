package net.kh.room;

import java.util.Date;

public class RoomVO {

	private int no;
	private String name;
	private int max;
	private String price;
	private String host_no;
	private Date reg;
	private ImageVO image;

	private String hostno;

	private String filename;
	
	//room 정보 추가
	private String roominfo;
	private String service;
	private String rules;
	private String userinfo;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public ImageVO getImage() {
		return image;
	}

	public void setImage(ImageVO image) {
		this.image = image;
	}

	public String getHostno() {
		return hostno;
	}

	public void setHostno(String hostno) {
		this.hostno = hostno;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


	public String getRoominfo() {
		return roominfo;
	}

	public void setRoominfo(String roominfo) {
		this.roominfo = roominfo;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getRules() {
		return rules;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	public String getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(String userinfo) {
		this.userinfo = userinfo;
	}

	@Override
	public String toString() {
		return "\nRoomVO [no=" + no + ", name=" + name + ", max=" + max + ", price=" + price + ", host_no=" + host_no
				+ ", reg=" + reg + ", image=" + image + ", hostno=" + hostno + ", filename=" + filename + ", roominfo = "
				+roominfo+", service = " +service+ ", rules = " +rules + ", userinfo = "+userinfo+"]";
	}

}
