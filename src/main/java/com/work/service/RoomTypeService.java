package com.work.service;

import com.work.bean.RoomType;
import com.work.vo.RoomTypePage;

import java.util.List;

public interface RoomTypeService {
    List<RoomType> findRoomType(RoomTypePage roomTypePage);
    int addRoomType(RoomType roomType);
    int updateRoomType(RoomType roomType);
}
