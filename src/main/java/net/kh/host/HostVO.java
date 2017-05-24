package net.kh.host;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class HostVO {

	private int no;
	private String email;
	private String pw;
	private String name;
	private String tel;
	private Date reg;
	private String biz_no;
	private String bizno;
	private String addr1;
	private String addr2;
	private String zip;
	private MultipartFile imageFile;
	private String imagename;
	private String auth;
	

	public String getBizno() {
		return bizno;
	}

	public void setBizno(String bizno) {
		this.bizno = bizno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getReg() {
		return reg;
	}

	public void setReg(Date reg) {
		this.reg = reg;
	}

	public String getBiz_no() {
		return biz_no;
	}

	public void setBiz_no(String biz_no) {
		this.biz_no = biz_no;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	@Override
	public String toString() {
		return "\nHostVO [no=" + no + ", email=" + email + ", pw=" + pw + ", name=" + name + ", tel=" + tel + ", reg="
				+ reg + ", biz_no=" + biz_no + ", addr1=" + addr1 + ", addr2=" + addr2 + ", zip=" + zip + ", imageFile="
				+ imageFile + ", imagename=" + imagename + ", auth=" + auth + "]";
	}

}
