package net.kh.dao;

import java.util.List;

import net.kh.room.ImageVO;

public interface ImageDao {

	void imageInsert(ImageVO image) throws Exception;

	List<ImageVO> getImageByHostNo(int host_no) throws Exception;
}
