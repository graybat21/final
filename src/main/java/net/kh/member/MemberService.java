package net.kh.member;

public interface MemberService {

	public MemberVO memberLogin(MemberVO member) throws Exception; // 로그인

	public boolean memberInsert(MemberVO member) throws Exception; // 가입

	public boolean memberAuthOk(MemberVO member) throws Exception;

	public int memberGetCurrentNo() throws Exception;
	// public MemberVO emailFindByName(MemberVO member); // 이메일찾기
	//
	// public MemberVO pwFindByEmail(MemberVO member); // 비번찾기
	//
	// public Object memberModify(MemberVO member); // 수정
	//
	// public Object memberDelete(String email); // 탙뢰
	//
	// public MemberVO idFindByName(MemberVO member);
	//
	// public MemberVO pwFindById(MemberVO member);

}
