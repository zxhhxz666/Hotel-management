package com.work.dao;

import com.work.bean.Orders;
import com.work.vo.OrdersVo;

import java.util.List;

public interface OrdersMapper {
    int addOrders(Orders orders);
    List<Orders> findOrdersList(OrdersVo ordersVo);
    int updateOrders(Orders orders);
}
