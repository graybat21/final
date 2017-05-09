package net.kh.member;

public interface MemberService {




	public MemberVO memberLogin(MemberVO member) throws Exception; // �α���

	public boolean memberInsert(MemberVO member) throws Exception; // ����

	public boolean memberAuthOk(MemberVO member) throws Exception;

	public int memberGetCurrentNo() throws Exception;
	// public MemberVO emailFindByName(MemberVO member); // �̸���ã��
	//
	// public MemberVO pwFindByEmail(MemberVO member); // ���ã��
	//
	// public Object memberModify(MemberVO member); // ����
	//
	// public Object memberDelete(String email); // �y��
	//
	// public MemberVO idFindByName(MemberVO member);
	//
	// public MemberVO pwFindById(MemberVO member);


}
