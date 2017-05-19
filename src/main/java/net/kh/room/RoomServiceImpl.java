package net.kh.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import net.kh.dao.RoomDao;
import net.kh.member.MemberVO;
import net.kh.qna.QnaVO;

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
	public RoomVO roomList(int no) throws Exception {
		// TODO Auto-generated method stub
		return roomMapper.roomList(no);
	}



	@Override
	public List<String> allImage(int h_no) throws Exception {
		// TODO Auto-generated method stub
		return roomMapper.allImage(h_no);
	}



	@Override
	public List<RoomVO> getRoomInfoByHostNo(int no) throws Exception {
		return roomMapper.getRoomInfoByHostNo(no);
	}



	








	
	

}
