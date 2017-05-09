package net.kh.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.LoginDao;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginMapper;

	@Override
	@Transactional
	public LoginVO login(LoginVO vo) throws Exception {
		return loginMapper.login(vo);
	}

}
