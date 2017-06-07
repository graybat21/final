package net.kh.reserve;

import java.util.Arrays;
import java.util.Date;

public class PaymentVO {

	private int no;
	private int mem_no;
	private int host_no;
	private int[] room_no;
	private int[] count;
	private Date reg;
	
	private String[] price;
	private String[] tprice;
	private String finalPrice;
	private String memaccount;
	private String membank;
	private String memphone;
	private String memname;
	
	private String checkin;
	private String checkout;
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getCheckin() {
		return checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	
	public Date transCheckin;
	public Date transCheckout;
	
//	private Date checkin;
//	private Date checkout;
//	public Date getCheckin() {
//		return checkin;
//	}
//	public Date getCheckout() {
//		return checkout;
//	}
//	public void setCheckin(Date checkin) {
//		this.checkin = checkin;
//	}
//	public void setCheckout(Date checkout) {
//		this.checkout = checkout;
//	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getHost_no() {
		return host_no;
	}
	public void setHost_no(int host_no) {
		this.host_no = host_no;
	}
	public int[] getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int[] room_no) {
		this.room_no = room_no;
	}
	public int[] getCount() {
		return count;
	}
	public void setCount(int[] count) {
		this.count = count;
	}
	public Date getReg() {
		return reg;
	}
	public void setReg(Date reg) {
		this.reg = reg;
	}
	public String[] getPrice() {
		return price;
	}
	public void setPrice(String[] price) {
		this.price = price;
	}
	public String[] getTprice() {
		return tprice;
	}
	public void setTprice(String[] tprice) {
		this.tprice = tprice;
	}
	public String getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(String finalPrice) {
		this.finalPrice = finalPrice;
	}
	
	public String getMemaccount() {
		return memaccount;
	}
	public void setMemaccount(String memaccount) {
		this.memaccount = memaccount;
	}
	public String getMembank() {
		return membank;
	}
	public void setMembank(String membank) {
		this.membank = membank;
	}
	public String getMemphone() {
		return memphone;
	}
	public void setMemphone(String memphone) {
		this.memphone = memphone;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public Date getTransCheckin() {
		return transCheckin;
	}
	public void setTransCheckin(Date transCheckin) {
		this.transCheckin = transCheckin;
	}
	public Date getTransCheckout() {
		return transCheckout;
	}
	public void setTransCheckout(Date transCheckout) {
		this.transCheckout = transCheckout;
	}
	@Override
	public String toString() {
		return "\nPaymentVO [no=" + no + ", mem_no=" + mem_no + ", host_no=" + host_no + ", room_no="
				+ Arrays.toString(room_no) + ", count=" + Arrays.toString(count) + ", reg=" + reg + ", price="
				+ Arrays.toString(price) + ", tprice=" + Arrays.toString(tprice) + ", finalPrice=" + finalPrice
				+ ", mem_account=" + memaccount + ", mem_bank=" + membank + ", mem_phone=" + memphone + ", mem_name="
				+ memname + ", checkin=" + checkin + ", checkout=" + checkout + "]";
	}
	
	
}
