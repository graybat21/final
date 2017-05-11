package net.kh.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.AdminDao;

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
	public void deleteMember(int no) throws Exception {
		
		adminMapper.deleteMember(no);
	}

}
