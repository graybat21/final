package net.kh.dao;

import java.util.HashMap;
import java.util.List;

import net.kh.room.RoomVO;

public interface RoomDao {

	void roomInsert2(RoomVO room) throws Exception;

	int roomGetCurrentNo() throws Exception;

	RoomVO roomList(int no) throws Exception;

	List<RoomVO> getRoomInfoByHostNo(int no) throws Exception;

	List<HashMap<String, Object>> getRoomAndReserveInfoByHostNo(int host_no) throws Exception;
	List<Integer> getRoomNoInReservation(int host_no) throws Exception;
	HashMap<String, Object> getCountByDate(HashMap<String, Object> map) throws Exception;
	
	int getMaxByRoomNo(int no)throws Exception;
	
}
