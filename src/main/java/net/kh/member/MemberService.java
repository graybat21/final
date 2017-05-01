package net.kh.member;

public interface MemberService {

	public MemberDao memberLogin(MemberDao member); // 로그인

	public MemberDao getMember(String email); // email 을 통해서 전체 정보 가져오기

	public Object insertMember(MemberDao member); // 가입

	public MemberDao emailFindByName(MemberDao member); // 이메일찾기

	public MemberDao pwFindByEmail(MemberDao member); // 비번찾기

	public Object memberModify(MemberDao member); // 수정

	public Object memberDelete(String email); // 탙뢰

	public MemberDao idFindByName(MemberDao member);

	public MemberDao pwFindById(MemberDao member);
}
