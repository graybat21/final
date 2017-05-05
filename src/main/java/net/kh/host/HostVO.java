package net.kh.host;

import java.util.Date;

public class HostVO {

	private int no;
	private String email;
	private String pw;
	private String name;
	private String tel;
	private Date reg;
	private String biz_no;
	private String addr1;
	private String addr2;
	private String zip;
	private String imagename;
	private String imagesize;
	private int auth;

	@Override
	public String toString() {
		return "HostVO [no=" + no + ", email=" + email + ", pw=" + pw + ", name=" + name + ", tel=" + tel + ", reg="
				+ reg + ", biz_no=" + biz_no + ", addr1=" + addr1 + ", addr2=" + addr2 + ", zip=" + zip + ", imagename="
				+ imagename + ", imagesize=" + imagesize + ", auth=" + auth + "]";
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

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	public String getImagesize() {
		return imagesize;
	}

	public void setImagesize(String imagesize) {
		this.imagesize = imagesize;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

}
