package com.work.dao;

import com.work.bean.Check;
import com.work.vo.CheckVo;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CheckMapper {
    List<Check> findCheckinList(CheckVo checkinVo);
    int addCheckin(Check checkin);
    @Select("select * from t_checkin where id = #{id}")
    Check findById(Long checkInId);
    int updateCheckin(Check checkin);

}
