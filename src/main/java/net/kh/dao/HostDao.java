package net.kh.dao;

import net.kh.host.HostVO;

public interface HostDao {

//	HostVO hostLogin(HostVO host) throws Exception;
	boolean hostInsert(HostVO host) throws Exception;
}
