package net.kh.room;

import java.util.List;

public interface ImageService {
	
	public void imageInsert(ImageVO image) throws Exception;

	public List<String> getRoomNumber(int no);
	
	
}
