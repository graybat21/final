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
	private String mem_account;
	private String mem_bank;
	private String mem_phone;
	private String mem_name;
	
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
	public String getMem_account() {
		return mem_account;
	}
	public void setMem_account(String mem_account) {
		this.mem_account = mem_account;
	}
	public String getMem_bank() {
		return mem_bank;
	}
	public void setMem_bank(String mem_bank) {
		this.mem_bank = mem_bank;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	@Override
	public String toString() {
		return "\nPaymentVO [no=" + no + ", mem_no=" + mem_no + ", host_no=" + host_no + ", room_no="
				+ Arrays.toString(room_no) + ", count=" + Arrays.toString(count) + ", reg=" + reg + ", price="
				+ Arrays.toString(price) + ", tprice=" + Arrays.toString(tprice) + ", finalPrice=" + finalPrice
				+ ", mem_account=" + mem_account + ", mem_bank=" + mem_bank + ", mem_phone=" + mem_phone + ", mem_name="
				+ mem_name + ", checkin=" + checkin + ", checkout=" + checkout + "]";
	}
	
	
}
