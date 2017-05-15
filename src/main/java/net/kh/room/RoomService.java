package net.kh.room;

import java.util.List;
import net.kh.member.MemberVO;
public interface RoomService {

	public void roomInsert2(RoomVO room) throws Exception;

	public int roomGetCurrentNo() throws Exception;
	
	int wish() throws Exception;
	

}
