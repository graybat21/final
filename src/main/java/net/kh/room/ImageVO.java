package net.kh.room;

public class ImageVO {

	private int no;
	private int room_no;
	private String filename;
	private String filesize;
	
	@Override
	public String toString() {
		return "ImageVO [no=" + no + ", room_no=" + room_no + ", filename=" + filename + ", filesize=" + filesize + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	
	
}
