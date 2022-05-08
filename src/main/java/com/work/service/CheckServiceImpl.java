package com.work.service;

import com.work.dao.CheckMapper;
import com.work.dao.OrdersMapper;
import com.work.dao.RoomTypeMapper;
import com.work.bean.Check;
import com.work.bean.Orders;
import com.work.bean.RoomType;
import com.work.service.CheckService;
import com.work.vo.CheckVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Transactional
@Service
public class CheckServiceImpl implements CheckService {

    @Resource
    private CheckMapper checkinMapper;

    @Resource
    private OrdersMapper ordersMapper;

    @Resource
    private RoomTypeMapper roomTypeMapper;

    public List<Check> findCheckinList(CheckVo checkVo) {
        return checkinMapper.findCheckinList(checkVo);
    }


    @Transactional(rollbackFor = RuntimeException.class)
    public int addCheckin(Check check) {
        check.setStatus(1);
        check.setCreateDate(new Date());
        check.setRemark(String.valueOf(check.getPayPrice()));

        int count = checkinMapper.addCheckin(check);
        if(count>0){

            Orders orders = new Orders();
            orders.setId(check.getOrdersId());
            orders.setStatus(3);

            ordersMapper.updateOrders(orders);

            RoomType roomType = roomTypeMapper.findById(check.getRoomTypeId());
            roomType.setLivedNum(roomType.getLivedNum()+1);

            roomTypeMapper.updateRoomType(roomType);
        }

        return count;
    }
}
