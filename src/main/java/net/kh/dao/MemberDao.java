package net.kh.dao;

import net.kh.member.MemberVO;

public interface MemberDao {

	MemberVO memberLogin(MemberVO member) throws Exception;
	boolean memberInsert(MemberVO member) throws Exception;
	
}
