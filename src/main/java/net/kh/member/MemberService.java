package net.kh.member;

public interface MemberService {

	public MemberVO memberLogin(MemberVO member) throws Exception; // 로그인
//
//	public MemberVO getMember(String email); // email 을 통해서 전체 정보 가져오기
//
//	public Object insertMember(MemberVO member); // 가입
//
//	public MemberVO emailFindByName(MemberVO member); // 이메일찾기
//
//	public MemberVO pwFindByEmail(MemberVO member); // 비번찾기
//
//	public Object memberModify(MemberVO member); // 수정
//
//	public Object memberDelete(String email); // 탙뢰
//
//	public MemberVO idFindByName(MemberVO member);
//
//	public MemberVO pwFindById(MemberVO member);
}
