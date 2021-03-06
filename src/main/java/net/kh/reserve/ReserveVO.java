package net.kh.reserve;

import java.util.Date;

public class ReserveVO {

	private int no;
	private int count;
	private int host_no;
	private int room_no;
	private int mem_no;
	private Date checkin;
	private Date checkout;
	private Date reg;
	private int memno;
	private int hostno;
	private int roomno;
	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	

	public int getHost_no() {
		return host_no;
	}

	public void setHost_no(int host_no) {
		this.host_no = host_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	public Date getCheckout() {
		return checkout;
	}

	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}

	public Date getReg() {
		return reg;
	}

	public void setReg(Date reg) {
		this.reg = reg;
	}

	
	


	public int getHostno() {
		return hostno;
	}

	public void setHostno(int hostno) {
		this.hostno = hostno;
	}

	public int getRoomno() {
		return roomno;
	}

	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}

	public int getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
	}

	@Override
	public String toString() {
		return "\nReserveVO [no=" + no + ", host_no=" + hostno + ", room_no=" + roomno + ", count=" + count
				+ ", checkin=" + checkin + ", checkout=" + checkout + ", reg=" + reg + ", mem_no=" + memno + "]";
	}

}
