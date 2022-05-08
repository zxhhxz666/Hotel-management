package com.work.service;

import com.work.bean.RoomType;
import com.work.dao.RoomTypeMapper;
import com.work.vo.RoomTypePage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class RoomTypeServiceImpl implements RoomTypeService {
    @Resource
    private RoomTypeMapper roomTypeMapper;

    @Override
    public List<RoomType> findRoomType(RoomTypePage roomTypePage) {
        return roomTypeMapper.findRoomType(roomTypePage);
    }

    @Override
    public int addRoomType(RoomType roomType) {
        roomType.setAvailableNum(roomType.getRoomNum());
        roomType.setLivedNum(0);
        roomType.setReservedNum(0);
        return roomTypeMapper.addRoomType(roomType);
    }

    @Override
    public int updateRoomType(RoomType roomType) {
        roomType.setAvailableNum(roomType.getRoomNum());
        roomType.setLivedNum(0);
        roomType.setReservedNum(0);
        return roomTypeMapper.updateRoomType(roomType);
    }
}
