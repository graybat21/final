package net.kh.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.AdminDao;
import net.kh.discount.DiscountVO;
import net.kh.host.HostVO;
import net.kh.room.RoomVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminMapper;
	
	
	@Override
	@Transactional
	public List<AdminVO> memberList(AdminVO admin) throws Exception {
		
		return adminMapper.memberList(admin);
	}
	
	@Override
	@Transactional
	public int deleteMember(String no) throws Exception {
		
		return adminMapper.deleteMember(no);
	}
	
	@Override
	@Transactional
	public List<HostVO> hostList(HostVO host) throws Exception {
		
		return adminMapper.hostList(host);
	}
	
	@Override
	@Transactional
	public int deleteHost(int no) throws Exception {
		
		return adminMapper.deleteHost(no);
	}
	
	@Override
	@Transactional
	public List<RoomVO> adminRoomList(RoomVO room) throws Exception {
		
		return adminMapper.adminRoomList(room);
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
