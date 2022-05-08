package com.work.dao;

import com.work.bean.RoomType;
import com.work.vo.RoomTypePage;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoomTypeMapper {
    List<RoomType> findRoomType(RoomTypePage roomTypePage);
    int addRoomType(RoomType roomType);
    int updateRoomType(RoomType roomType);

    @Select("select * from room_type where id = #{id}")
    RoomType findById(Integer roomTypeId);
}
