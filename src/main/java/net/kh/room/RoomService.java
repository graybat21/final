package net.kh.room;

import java.util.List;
import java.util.Map;


public interface RoomService {

	public void roomInsert2(RoomVO room) throws Exception;

	public int roomGetCurrentNo() throws Exception;
	
	public RoomVO roomList(int no) throws Exception;
	
	
	public List<RoomVO> getRoomInfoByHostNo(int no)throws Exception;
	
	public List<RoomVO> getRoomBigImage(int no)throws Exception;
	
	public List<RoomVO> getRoomBigImage2(Map map)throws Exception;
}
