package net.kh.dao;

import net.kh.member.MemberVO;

public interface MemberDao {

	MemberVO memberLogin(MemberVO member) throws Exception;

	Object memberJoin(MemberVO member); //일반인지 기업인지 확인
	
	Object memberJoin2(MemberVO member); //위에꺼에서 일반회원으로 가는것
	
	Object memberJoin3(MemberVO member); //memberJoin -> 기업회원
}