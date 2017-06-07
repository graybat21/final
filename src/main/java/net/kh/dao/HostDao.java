package net.kh.dao;

import java.util.HashMap;
import java.util.Map;

import net.kh.host.HostVO;

public interface HostDao {

	HostVO hostLogin(HostVO host) throws Exception;
	HostVO getHostInfoByHostNo(int no) throws Exception;

	boolean hostInsert(HostVO host) throws Exception;

	boolean hostAuthOk(HostVO host) throws Exception;
	
	int hostGetCurrentNo()throws Exception;
	
	String deletePwChk(Map<String, Object> map) throws Exception;
	
	boolean modify(HostVO host) throws Exception;
	
	HostVO selectHostByNo(int no);
}