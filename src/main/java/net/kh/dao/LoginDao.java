package net.kh.dao;

import net.kh.common.LoginVO;

public interface LoginDao {

	LoginVO login(LoginVO vo) throws Exception;
}
