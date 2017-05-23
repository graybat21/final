package net.kh.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.AdminDao;
import net.kh.discount.DiscountVO;
import net.kh.host.HostVO;
import net.kh.member.MemberVO;
import net.kh.reserve.ReserveVO;
import net.kh.room.RoomVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminMapper;

	@Override
	@Transactional
	public List<MemberVO> memberList(HashMap<String, Object> map) throws Exception {
		return adminMapper.memberList(map);
	}

	@Override
	public int memberListCnt(HashMap<String, Object> map) throws Exception {
		return adminMapper.memberListCnt(map);
	}

	@Override
	@Transactional
	public int deleteMember(int no) throws Exception {
		return adminMapper.deleteMember(no);
	}

	@Override
	@Transactional
	public List<HostVO> hostList(HashMap<String, Object> map) throws Exception {
		return adminMapper.hostList(map);
	}

	@Override
	public int hostListCnt(HashMap<String, Object> map) throws Exception {
		return adminMapper.hostListCnt(map);
	}

	@Override
	@Transactional
	public int deleteHost(int no) throws Exception {
		return adminMapper.deleteHost(no);
	}

	@Override
	@Transactional
	public List<RoomVO> adminRoomList(HashMap<String, Object> map) throws Exception {
		return adminMapper.adminRoomList(map);
	}

	@Override
	public int roomListCnt(HashMap<String, Object> map) throws Exception {
		return adminMapper.roomListCnt(map);
	}

	@Override
	@Transactional
	public int deleteRoom(int no) throws Exception {
		return adminMapper.deleteRoom(no);
	}

	@Override
	@Transactional
	public int deleteImage(int no) throws Exception {
		return adminMapper.deleteImage(no);
	}

	@Override
	@Transactional
	public List<DiscountVO> adminDiscountList(HashMap<String, Object> map) throws Exception {
		return adminMapper.adminDiscountList(map);
	}
	
	@Override
	public int discountListCnt(HashMap<String, Object> map) throws Exception {
		return adminMapper.discountListCnt(map);
	}
	
	@Override
	@Transactional
	public int deleteDiscount(int no) throws Exception {
		return adminMapper.deleteDiscount(no);
	}
	
	
	@Override
	@Transactional
	public List<ReserveVO> adminReserveList(HashMap<String, Object> map) throws Exception {
		return adminMapper.adminReserveList(map);
	}
	
	@Override
	public int reserveListCnt(HashMap<String, Object> map) throws Exception {
		return adminMapper.reserveListCnt(map);
	}
	
	@Override
	@Transactional
	public int deleteReserve(int no) throws Exception {
		return adminMapper.deleteReserve(no);
	}

}
