package net.kh.room;

import java.util.List;

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


	@Override
	public List<String> selectImageByRoomNumber(int room_no) throws Exception {
		return imageMapper.selectImageByRoomNumber(room_no);
	}


	@Override
	public List<String> getRoomNumberByHostNumber(int h_no) throws Exception {
		return imageMapper.getRoomNumberByHostNumber(h_no);
	}
	

}
