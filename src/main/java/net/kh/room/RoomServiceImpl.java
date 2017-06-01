package net.kh.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.ImageDao;
import net.kh.dao.RoomDao;

@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDao roomMapper;
	
	@Autowired
	private ImageDao imageMapper;

	@Override
	@Transactional
	public void roomInsert2(RoomVO room) throws Exception {
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
	public List<RoomVO> getRoomInfoByHostNo(int no) throws Exception {
		return roomMapper.getRoomInfoByHostNo(no);
	}

//	@Override
//	public List<HashMap<String, Object>> getRoomAndReserveInfoByHostNo(int host_no) throws Exception {
//		return roomMapper.getRoomAndReserveInfoByHostNo(host_no);
//	}
	@Override
	public List<RoomVO> getRoomBigImage(int no) throws Exception {
		return roomMapper.getRoomBigImage(no);
	}



	@Override
	public List<RoomVO> getRoomBigImage2(Map map) throws Exception {
		// TODO Auto-generated method stub
		return roomMapper.getRoomBigImage2(map);
	}

	@Override
	public List<Integer> getRoomNoInReservation(int host_no) throws Exception {
		return roomMapper.getRoomNoInReservation(host_no);
	}


	@Override
	public HashMap<String, Object> getCountByDate(HashMap<String, Object> map) throws Exception {
		return roomMapper.getCountByDate(map);
	}

	@Override
	public String getRoomImage(Map<String, Object> map) throws Exception {
		String str = "";
		System.out.println(map.get("room_no"));
		List<String> list = imageMapper.getRoomImage(map);
		
		for(int i=0;i<list.size();i++){
			str += list.get(i)+",";
		}
		
		return str;
	}
	
	

//	@Override
//	public int getMaxByRoomNo(int no) throws Exception {
//		return roomMapper.getMaxByRoomNo(no);
//	}

}
