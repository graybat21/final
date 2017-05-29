package net.kh.dao;

import java.util.Map;

import net.kh.member.MemberVO;

public interface MemberDao {

	MemberVO memberLogin(MemberVO member) throws Exception;

	boolean memberInsert(MemberVO member) throws Exception;

	boolean memberAuthOk(MemberVO member) throws Exception;

	int memberGetCurrentNo() throws Exception;

	int emailCheck(String email) throws Exception;
	
	MemberVO modifyMyInfo(MemberVO member) throws Exception;
	
	String deletePwChk(Map<String, Object> map) throws Exception;

}
