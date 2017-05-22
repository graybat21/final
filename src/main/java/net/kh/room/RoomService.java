package net.kh.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface RoomService {

   public void roomInsert2(RoomVO room) throws Exception;

   public int roomGetCurrentNo() throws Exception;
   
   public RoomVO roomList(int no) throws Exception;
   
   public List<String> allImage(int h_no) throws Exception;
   
   public List<RoomVO> getRoomInfoByHostNo(int no)throws Exception;
   
   //혜리가 추가
   List<RoomVO> roommList(int host_no) throws Exception;
   // 혜
   public String image(int no) throws Exception;
   
   
}