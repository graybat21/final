package net.kh.room;


import java.util.Date;
public class RoomVO {

	private int no;
	private String name;
	private int max;
	private String price;
	private String host_no;
	private Date reg;
	private ImageVO image;
	
	private String hostno;
	
	private String filename;
	

	@Override
	public String toString() {
		return "\nRoomVO [no=" + no + ", name=" + name + ", max=" + max + ", price=" + price + ", host_no=" + host_no
				+ ", reg=" + reg + ", filename=" + filename + "]";
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

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getHost_no() {
		return host_no;
	}

	public void setHost_no(String host_no) {
		this.host_no = host_no;
	}

	public Date getReg() {
		return reg;
	}

	public void setReg(Date reg) {
		this.reg = reg;
	}

	public ImageVO getImage() {
		return image;
	}

	public void setImage(ImageVO image) {
		this.image = image;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getHostno() {
		return hostno;
	}

	public void setHostno(String hostno) {
		this.hostno = hostno;
	}

	


	
}
