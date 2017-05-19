package net.kh.notice;

import java.util.Date;

public class NoticeVO {
	
	private int no;

	private String subject;
	private String content;	
	private Date reg;
	
	
	
	@Override
	public String toString() {
		return "NoticeVO [no=" + no +", subject=" + subject + ", content=" + content + ", reg="
				+ reg + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	
}