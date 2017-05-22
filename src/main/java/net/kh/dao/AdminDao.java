package net.kh.dao;

import java.util.HashMap;
import java.util.List;

import net.kh.discount.DiscountVO;
import net.kh.host.HostVO;
import net.kh.member.MemberVO;
import net.kh.room.RoomVO;

public interface AdminDao {

	// 개인 회원 관리
	List<MemberVO> memberList(HashMap<String, Object> map) throws Exception;

	int memberListCnt(HashMap<String, Object> map) throws Exception;

	int deleteMember(int no) throws Exception;

	// 호스트 관리
	List<HostVO> hostList(HashMap<String, Object> map) throws Exception;

	int hostListCnt(HashMap<String, Object> map) throws Exception;

	int deleteHost(int no) throws Exception;

	// 방관리
	List<RoomVO> adminRoomList(HashMap<String, Object> map) throws Exception;

	int roomListCnt(HashMap<String, Object> map) throws Exception;
	int deleteRoom(int no) throws Exception;

	// 특가관리
	List<DiscountVO> adminDiscountList(DiscountVO discount) throws Exception;
}
