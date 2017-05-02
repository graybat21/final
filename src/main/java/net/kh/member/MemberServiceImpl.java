package net.kh.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.MemberDao;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

//	@Resource(name = "sqlSessionTemplate")
//	private SqlSessionTemplate sqlSessionTemplate;
//
//	@Override
//	public MemberVO memberLogin(MemberVO mem) {
//		return sqlSessionTemplate.selectOne("member.login", mem);
//	}

	@Autowired
    private MemberDao memberMapper;

    @Override
    @Transactional
    public MemberVO memberLogin(MemberVO member) throws Exception{
        return memberMapper.memberLogin(member);
    }

	@Override
	public Object insertMember(MemberVO member){
		// TODO Auto-generated method stub
		return memberMapper.memberJoin(member);
	}


	
	
	// @Override
	// public MemberVO getMember(String id) {
	// return sqlSessionTemplate.selectOne("member.getMember", id);
	// }
	//
	// @Override
	// public Object insertMember(MemberVO mem) {
	// return sqlSessionTemplate.insert("member.insertMember", mem);
	// }
	//
	// @Override
	// public MemberVO idFindByName(MemberVO member) {
	// return sqlSessionTemplate.selectOne("member.idfind", member);
	// }
	//
	// @Override
	// public MemberVO pwFindById(MemberVO member) {
	// return sqlSessionTemplate.selectOne("member.pwfind", member);
	// }
	//
	// @Override
	// public Object memberModify(MemberVO member) {
	// return sqlSessionTemplate.update("member.updateMember", member);
	// }
	//
	// @Override
	// public Object memberDelete(String id) {
	// return sqlSessionTemplate.delete("member.deleteMember", id);
	// }

}
