package net.kh.member;

public interface MemberDao {

	public MemberModel memberLogin(MemberModel member); // �α���

	public MemberModel getMember(String email); // email �� ���ؼ� ��ü ���� ��������

	public Object insertMember(MemberModel member); // ����

	public MemberModel emailFindByName(MemberModel member); // �̸���ã��
	
	public MemberModel pwFindByEmail(MemberModel member); // ���ã��

	public Object memberModify(MemberModel member); // ����

	public Object memberDelete(String email); // �y��
	
	
}



