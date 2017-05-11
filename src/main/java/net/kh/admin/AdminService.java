package net.kh.admin;

import java.util.List;

public interface AdminService {
	
	List<AdminVO> memberList(AdminVO admin) throws Exception;
	
	public int deleteMember(String no) throws Exception;
}
