package net.kh.main;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.kh.dao.MainDAO;

@Service
@Resource(name="main")
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO mainMapper;
	
	@Override
	public List<HashMap<String, Object>> mainList() throws Exception {
		return mainMapper.mainList();
	}

	
}
