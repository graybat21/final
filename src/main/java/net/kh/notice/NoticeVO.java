package net.kh.notice;

import java.util.Date;

public class NoticeVO {
	
	private int no;
	private String name;	
	private String subject;
	private String content;	
	private Date reg;
	private int readcount;
	
	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", name=" + name + ", subject=" + subject + ", content=" + content + ", reg="
				+ reg + ", readcount=" + readcount + "]";
	}
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public int getReadcount() {
		return readcount;
	}
	public void setReadhit(int readcount) {
		this.readcount = readcount;
	}
}