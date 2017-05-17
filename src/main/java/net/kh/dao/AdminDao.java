package net.kh.dao;

import java.util.List;

import net.kh.discount.DiscountVO;
import net.kh.host.HostVO;
import net.kh.member.MemberVO;
import net.kh.room.RoomVO;

public interface AdminDao {

	//개인 회원 관리
	List<MemberVO> memberList(MemberVO member) throws Exception;
	
	int deleteMember(int no) throws Exception;
	
	// 호스트 관리
	List<HostVO> hostList(HostVO host) throws Exception;
	
	int deleteHost(int no) throws Exception;
	
	// 방관리
	List<RoomVO> adminRoomList(RoomVO room) throws Exception;
	
	int deleteRoom(int no) throws Exception;
	
	//특가관리
	List<DiscountVO> adminDiscountList(DiscountVO discount) throws Exception;
}
