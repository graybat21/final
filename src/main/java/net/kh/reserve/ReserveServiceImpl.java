package net.kh.reserve;

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

}
