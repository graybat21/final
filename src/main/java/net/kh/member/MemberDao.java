package net.kh.member;

public interface MemberDao {

	public MemberModel memberLogin(MemberModel member); // 로그인

	public MemberModel getMember(String email); // email 을 통해서 전체 정보 가져오기

	public Object insertMember(MemberModel member); // 가입

	public MemberModel emailFindByName(MemberModel member); // 이메일찾기
	
	public MemberModel pwFindByEmail(MemberModel member); // 비번찾기

	public Object memberModify(MemberModel member); // 수정

	public Object memberDelete(String email); // 탙뢰
	
	
}



