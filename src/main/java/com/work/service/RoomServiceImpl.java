package com.work.service;

import com.work.bean.Room;
import com.work.dao.RoomMapper;
import com.work.vo.RoomPage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class RoomServiceImpl implements RoomService{
    @Resource
    private RoomMapper roomMapper;

    @Override
    public List<Room> findRoomListByPage(RoomPage roomVo) {
        return roomMapper.findRoomListByPage(roomVo);
    }

    @Override
    public int addRoom(Room room) {
        return roomMapper.addRoom(room);
    }

    @Override
    public int updateRoom(Room room) {
        return roomMapper.updateRoom(room);
    }

    @Override
    public int deleteById(int id) {
        return roomMapper.deleteById(id);
    }

    @Override
    public Room findById(Integer id) {
        return roomMapper.findById(id);
    }
}
