package net.kh.qna;

import java.util.Date;

public class QnaVO {
private int no;
private String subject;
private String writer;
private String content;
private Date reg;
private int ref;
private int restep;
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
public int getRef() {
	return ref;
}
public void setRef(int ref) {
	this.ref = ref;
}
public int getRestep() {
	return restep;
}
public void setRestep(int restep) {
	this.restep = restep;
}
@Override
public String toString() {
	return "QnaVO [no=" + no + ", subject=" + subject + ", writer=" + writer + ", content=" + content + ", reg=" + reg
			+ ", ref=" + ref + ", restep=" + restep + "]";
}
}
