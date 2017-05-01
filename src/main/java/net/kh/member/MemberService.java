package net.kh.member;

public interface MemberService {

	public MemberDao memberLogin(MemberDao member); // �α���

	public MemberDao getMember(String email); // email �� ���ؼ� ��ü ���� ��������

	public Object insertMember(MemberDao member); // ����

	public MemberDao emailFindByName(MemberDao member); // �̸���ã��

	public MemberDao pwFindByEmail(MemberDao member); // ���ã��

	public Object memberModify(MemberDao member); // ����

	public Object memberDelete(String email); // �y��

	public MemberDao idFindByName(MemberDao member);

	public MemberDao pwFindById(MemberDao member);
}
