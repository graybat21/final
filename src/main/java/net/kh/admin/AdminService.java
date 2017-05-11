package net.kh.admin;

import java.util.List;

public interface AdminService {
	
	List<AdminVO> memberList(AdminVO admin) throws Exception;
	
	void deleteMember(int no) throws Exception;
}
