package net.kh.room;

import java.util.List;

public interface ImageService {
	
	public void imageInsert(ImageVO image) throws Exception;

	
	public List<String> selectImageByRoomNumber(int room_no) throws Exception;
	
	public List<String> getRoomNumberByHostNumber(int h_no) throws Exception;
}
