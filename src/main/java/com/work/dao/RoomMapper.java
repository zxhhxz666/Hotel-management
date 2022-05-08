package com.work.dao;

import com.work.bean.Room;
import com.work.vo.RoomPage;

import java.util.List;

public interface RoomMapper {
    List<Room> findRoomListByPage(RoomPage roomVo);
    int addRoom(Room room);
    int updateRoom(Room room);
    int deleteById(int id);
    Room findById(Integer id);
}
