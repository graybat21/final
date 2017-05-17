package net.kh.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface RoomService {

	public void roomInsert2(RoomVO room) throws Exception;

	public int roomGetCurrentNo() throws Exception;
	
	public RoomVO roomList(int no) throws Exception;
	
	public List<String> allImage(int h_no) throws Exception;
	
	public RoomVO getRoomInfoByHostNo(int no)throws Exception;
	
}
