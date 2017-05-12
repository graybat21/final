package net.kh.dao;

import java.util.List;

import net.kh.admin.AdminVO;
import net.kh.host.HostVO;

public interface AdminDao {

	List<AdminVO> memberList(AdminVO admin) throws Exception;
	
	int deleteMember(String no) throws Exception;
	
	List<HostVO> hostList(HostVO host) throws Exception;
	
	int deleteHost(int no) throws Exception;
}
