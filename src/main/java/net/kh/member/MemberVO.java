package net.kh.member;

import java.util.Date;

public class MemberVO {

	private int no;
	private String email;
	private String pw;
	private String name;
	private String phone;
	private Date reg;
	private Date birth;
	private String auth;
	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", email=" + email + ", pw=" + pw + ", name=" + name + ", phone=" + phone
				+ ", reg=" + reg + ", birth=" + birth + ", auth=" + auth + "]";
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getReg() {
		return reg;
	}

	public void setReg(Date reg) {
		this.reg = reg;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

}