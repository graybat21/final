package net.kh.dao;

import java.util.List;

import net.kh.member.MemberVO;
import net.kh.notice.NoticeVO;

public interface NoticeDao {
	
	List noticeList() throws Exception;
	
	int noticeWrite(NoticeVO notice) throws Exception;

}
