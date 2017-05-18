package net.kh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.kh.room.RoomVO;

public interface RoomDao {

	void roomInsert2(RoomVO room) throws Exception;
	
	int roomGetCurrentNo() throws Exception;

	RoomVO roomList(int no) throws Exception;
	List<String> allImage(int h_no) throws Exception;
	
	RoomVO getRoomInfoByHostNo(int no)throws Exception;
}
