package net.kh.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.MemberDao;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberMapper;

	@Override
	@Transactional
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return memberMapper.memberLogin(member);
	}

	@Override
	@Transactional
	public boolean memberInsert(MemberVO member) throws Exception {
		return memberMapper.memberInsert(member);
	}

	@Override
	@Transactional
	public boolean memberAuthOk(MemberVO member) throws Exception {
		return memberMapper.memberAuthOk(member);
	}

	@Override
	public int memberGetCurrentNo() throws Exception {
		return memberMapper.memberGetCurrentNo();
	}

	@Override
	public int emailCheck(String email) throws Exception {
		return memberMapper.emailCheck(email);
	}

	@Override
	public Object modify(MemberVO member) throws Exception {
		return memberMapper.modify(member);
	}

	@Override
	public String deletePwChk(Map map) throws Exception {
		return memberMapper.deletePwChk(map);
	}

	@Override
	public MemberVO selectMemberByNo(int no) throws Exception {
		return memberMapper.selectMemberByNo(no);
	}

	
}
