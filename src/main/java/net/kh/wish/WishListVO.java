package net.kh.wish;

public class WishListVO {
	private int mem_no;
	private int host_no;

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

	@Override
	public String toString() {
		return "WishListVO [mem_no=" + mem_no + ", host_no=" + host_no + "]";
	}

}
