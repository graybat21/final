package net.kh.dao;

import java.util.List;
import java.util.Map;

import net.kh.room.ImageVO;

public interface ImageDao {

	void imageInsert(ImageVO image) throws Exception;

	List<ImageVO> getImageByHostNo(int host_no) throws Exception;
	
	//팝업시 방사진 가져오기
	List<String> getRoomImage(Map<String, Object> map) throws Exception;
}
