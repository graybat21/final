package net.kh.dao;

import java.util.List;

import net.kh.room.RoomVO;

public interface RoomDao {

	void roomInsert2(RoomVO room) throws Exception;
	
	int roomGetCurrentNo() throws Exception;
	
	int wish() throws Exception;
	
	
}
