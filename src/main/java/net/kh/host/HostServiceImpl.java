package net.kh.host;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.HostDao;

@Service("hostService")
public class HostServiceImpl implements HostService {

	@Autowired
	private HostDao hostMapper;

	@Override
	@Transactional
	public HostVO hostLogin(HostVO host) throws Exception {
		return hostMapper.hostLogin(host);
	}

	@Override
	public HostVO getHostInfoByHostNo(int no) throws Exception {
		return hostMapper.getHostInfoByHostNo(no);
	}

	@Override
	@Transactional
	public boolean hostInsert(HostVO host) throws Exception {
		return hostMapper.hostInsert(host);
	}

	@Override
	public boolean hostAuthOk(HostVO host) throws Exception {
		return hostMapper.hostAuthOk(host);
	}

	@Override
	public int hostGetCurrentNo() throws Exception {
		return hostMapper.hostGetCurrentNo();
	}

	@Override
	public String deletePwChk(Map map) throws Exception {
		// TODO Auto-generated method stub
		return hostMapper.deletePwChk(map);
	}

}
