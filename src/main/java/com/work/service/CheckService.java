package com.work.service;

import com.work.bean.Check;
import com.work.vo.CheckVo;

import java.util.List;

public interface CheckService {
    List<Check> findCheckinList(CheckVo checkinVo);
    int addCheckin(Check checkin);
}
