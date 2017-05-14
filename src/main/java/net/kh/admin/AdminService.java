package net.kh.admin;

import java.util.List;

import net.kh.host.HostVO;

public interface AdminService {
	
	List<AdminVO> memberList(AdminVO admin) throws Exception;
	
	public int deleteMember(String no) throws Exception;
	
	List<HostVO> hostList(HostVO host) throws Exception;
	
	public int deleteHost(int no) throws Exception;
}
