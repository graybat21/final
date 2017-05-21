package net.kh.dao;

import java.util.HashMap;
import java.util.List;

import net.kh.room.ImageVO;

public interface ImageDao {

	void imageInsert(ImageVO image) throws Exception;
	List<String> selectImageByRoomNumber(int room_no) throws Exception; 
	
	List<String> getRoomNumberByHostNumber(int h_no) throws Exception;
}
