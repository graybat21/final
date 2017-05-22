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
	public List<DiscountVO> adminDiscountList(DiscountVO discount) throws Exception {
		return adminMapper.adminDiscountList(discount);
	}

}
