package net.kh.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.kh.dao.ImageDao;

@Service("imageService")
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageDao imageMapper;
	
	@Override
	@Transactional
	public void imageInsert(ImageVO image) throws Exception {
		imageMapper.imageInsert(image);

	}

}
