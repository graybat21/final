package net.kh.dao;

import net.kh.member.MemberVO;

public interface MemberDao {

	MemberVO memberLogin(MemberVO member) throws Exception;

	boolean memberInsert(MemberVO member) throws Exception;

	boolean memberAuthOk(MemberVO member) throws Exception;

	int memberGetCurrentNo() throws Exception;

	boolean emailCheck(String email) throws Exception;

}
