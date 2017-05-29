package net.kh.member;

import java.util.Map;

public interface MemberService {

	public MemberVO memberLogin(MemberVO member) throws Exception; // 占싸깍옙占쏙옙

	public boolean memberInsert(MemberVO member) throws Exception; // 占쏙옙占쏙옙

	public boolean memberAuthOk(MemberVO member) throws Exception;

	public int memberGetCurrentNo() throws Exception;

	public int emailCheck(String email) throws Exception;
	
	public Object modifyMyInfo(MemberVO member) throws Exception; //회원정보수정
	
	public String deletePwChk(Map map) throws Exception;
	
	// public MemberVO emailFindByName(MemberVO member); // 占싱몌옙占쏙옙찾占쏙옙
	//
	// public MemberVO pwFindByEmail(MemberVO member); // 占쏙옙占시ｏ옙占�
	//
	//
	// public Object memberDelete(String email); // 占�y占쏙옙
	//
	// public MemberVO idFindByName(MemberVO member);
	//
	// public MemberVO pwFindById(MemberVO member);

}
