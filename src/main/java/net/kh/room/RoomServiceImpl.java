package net.kh.room;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import net.kh.dao.RoomDao;
import net.kh.member.MemberVO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDao roomMapper;
	


	
	@Override
	@Transactional
	public void roomInsert2(RoomVO room)throws Exception {
		roomMapper.roomInsert2(room);
	}



	@Override
	public int roomGetCurrentNo() throws Exception {
		
		return roomMapper.roomGetCurrentNo();
	}



	@Override
	@Transactional
	public int wish() throws Exception {
		// TODO Auto-generated method stub
		return roomMapper.wish();
	}



	
	

}
