package net.kh.dao;

import java.util.HashMap;
import java.util.List;

import net.kh.admin.AdminVO;
import net.kh.host.HostVO;
import net.kh.room.RoomVO;

public interface AdminDao {

	// 개인 회원 관리
	List<AdminVO> memberList(HashMap<String, Object> map) throws Exception;

	int memberListCnt() throws Exception;

	int deleteMember(String no) throws Exception;

	// 호스트 관리
	List<HostVO> hostList(HashMap<String, Object> map) throws Exception;

	int hostListCnt() throws Exception;

	int deleteHost(int no) throws Exception;

	// 방관리
	List<RoomVO> adminRoomList(RoomVO room) throws Exception;
}
