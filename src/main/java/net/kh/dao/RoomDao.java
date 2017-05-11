package net.kh.dao;

import net.kh.room.RoomVO;

public interface RoomDao {

	void roomInsert2(RoomVO room) throws Exception;
	
	int roomGetCurrentNo() throws Exception;
}
