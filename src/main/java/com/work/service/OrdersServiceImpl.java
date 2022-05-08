package com.work.service;

import com.work.dao.OrdersMapper;
import com.work.dao.RoomMapper;
import com.work.dao.RoomTypeMapper;
import com.work.bean.Orders;
import com.work.bean.Room;
import com.work.bean.RoomType;
import com.work.service.OrdersService;
import com.work.utils.UUIDUtils;
import com.work.vo.OrdersVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {

    @Resource
    private OrdersMapper ordersMapper;

    @Resource
    private RoomMapper roomMapper;

    @Resource
    private RoomTypeMapper roomTypeMapper;

    @Transactional(rollbackFor = RuntimeException.class)
    public int addOrders(Orders orders) {
        orders.setStatus(1);
        orders.setOrdersNo(UUIDUtils.randomUUID());
        orders.setReserveDate(new Date());
        int count = ordersMapper.addOrders(orders);

        if(count>0){

            RoomType roomType = roomTypeMapper.findById(orders.getRoomTypeId());
            roomType.setAvailableNum(roomType.getAvailableNum()-1);
            roomType.setReservedNum(roomType.getReservedNum()+1);
            roomTypeMapper.updateRoomType(roomType);
            Room room = roomMapper.findById(orders.getRoomId());
            room.setStatus(1);
            roomMapper.updateRoom(room);
        }

        return count;
    }

    public List<Orders> findOrdersList(OrdersVo ordersVo) {
        return ordersMapper.findOrdersList(ordersVo);
    }

    public int updateOrders(Orders orders) {
        return ordersMapper.updateOrders(orders);
    }
}
