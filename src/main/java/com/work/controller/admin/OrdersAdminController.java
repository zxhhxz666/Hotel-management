package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.work.bean.Orders;
import com.work.service.OrdersService;
import com.work.utils.DataGridViewResult;
import com.work.utils.SystemConstant;
import com.work.vo.OrdersVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.work.service.OrdersService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/orders")
public class OrdersAdminController {

    @Resource
    private OrdersService ordersService;

    @RequestMapping("/list")
    public DataGridViewResult list(OrdersVo ordersVo){
        PageHelper.startPage(ordersVo.getPage(),ordersVo.getLimit());
        List<Orders> ordersList = ordersService.findOrdersList(ordersVo);
        PageInfo<Orders> pageInfo = new PageInfo<Orders>(ordersList);
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("/confirmOrders")
    public String confirmOrders(Orders orders){
        Map<String,Object> map = new HashMap<String,Object>();
        orders.setStatus(2);
        if(ordersService.updateOrders(orders)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"Confirm success !");
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"Confirm fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/batchConfirm")
    public String batchConfirm(String ids){
        Map<String,Object> map = new HashMap<String,Object>();
        int count = 0;
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            Orders orders = new Orders();
            orders.setStatus(2);
            orders.setId(Integer.valueOf(idsStr[i]));
            count = ordersService.updateOrders(orders);
            if(count>0){
                map.put(SystemConstant.SUCCESS,true);
                map.put(SystemConstant.MESSAGE,"Batch confirm success");
            }
        }

        if(count<=0){
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"Batch confirm fail");
        }

        return JSON.toJSONString(map);
    }

}
