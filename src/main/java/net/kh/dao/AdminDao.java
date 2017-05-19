package net.kh.dao;

import java.util.List;

import net.kh.admin.AdminVO;
import net.kh.discount.DiscountVO;
import net.kh.host.HostVO;
import net.kh.member.MemberVO;

public interface AdminDao {

	//개인 회원 관리
	List<MemberVO> memberList(MemberVO member) throws Exception;
	
	int deleteMember(int no) throws Exception;
	
	// 호스트 관리
	List<HostVO> hostList(HostVO host) throws Exception;
	
	int deleteHost(int no) throws Exception;
	
	// 방관리
	List<AdminVO> adminRoomList(AdminVO admin) throws Exception;
	
	int deleteRoom(int no) throws Exception;
	
	//특가관리
	List<DiscountVO> adminDiscountList(DiscountVO discount) throws Exception;
}
