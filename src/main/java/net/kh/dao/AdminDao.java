package net.kh.dao;

import java.util.List;

import net.kh.admin.AdminVO;

public interface AdminDao {

	List<AdminVO> memberList(AdminVO admin) throws Exception;
	
	void deleteMember(AdminVO admin) throws Exception;
}
