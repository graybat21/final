package net.kh.dao;

import java.util.List;

import net.kh.host.HostVO;

public interface HostDao {

	HostVO hostLogin(HostVO host) throws Exception;

	boolean hostInsert(HostVO host) throws Exception;

	boolean hostAuthOk(HostVO host) throws Exception;
	
	int hostGetCurrentNo()throws Exception;
	
}
