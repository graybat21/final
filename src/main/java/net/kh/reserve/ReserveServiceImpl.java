package net.kh.reserve;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.kh.dao.ReserveDao;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {

	@Inject
	ReserveDao reserveDao;

	@Override
	public List<Map<String, Object>> selectSearchHappy() throws Exception {
		return reserveDao.selectSearchHappy();
	}

	@Override
	public List<HashMap<String, Object>> getReserveInfoByMemNo(int mem_no) throws Exception {
		return reserveDao.getReserveInfoByMemNo(mem_no);
	}

	@Override
	public List<HashMap<String, Object>> getReserveInfoByHostNo(int host_no) throws Exception {
		return reserveDao.getReserveInfoByHostNo(host_no);
	}

}
