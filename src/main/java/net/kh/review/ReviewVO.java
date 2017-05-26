package net.kh.review;

import java.util.Date;

public class ReviewVO {

	private int no;
	private String writer;
	private String content;
	private Date reg;
	private int star;
	private int host_no;
	private int r_no;
	private int ref;
	private String c_content;
	private Date c_reg;
	
	private String hostname;
	private String roomname;
	private String tab;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg() {
		return reg;
	}

	public void setReg(Date reg) {
		this.reg = reg;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getHost_no() {
		return host_no;
	}

	public void setHost_no(int host_no) {
		this.host_no = host_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Date getC_reg() {
		return c_reg;
	}

	public void setC_reg(Date c_reg) {
		this.c_reg = c_reg;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getTab() {
		return tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	@Override
	public String toString() {
		return "\nReviewVO [no=" + no + ", writer=" + writer + ", content=" + content + ", reg=" + reg + ", star=" + star
				+ ", host_no=" + host_no + ", r_no=" + r_no + ", ref=" + ref + ", c_content=" + c_content + ", c_reg="
				+ c_reg + ", hostname=" + hostname + ", roomname=" + roomname + "]";
	}


}