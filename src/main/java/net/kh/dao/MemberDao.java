package net.kh.dao;

import net.kh.member.MemberVO;

public interface MemberDao {

	MemberVO memberLogin(MemberVO member) throws Exception;

	Object memberJoin(MemberVO member);
	
	
}