package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.work.bean.Orders;
import com.work.service.OrdersService;
import com.work.utils.SystemConstant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Resource
    private OrdersService ordersService;


    @RequestMapping("/addOrders")
    @ResponseBody
    public String addOrders(Orders orders){
        Map<String,Object> map = new HashMap<String,Object>();

        if(ordersService.addOrders(orders)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"Order success !" );
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"Order failed !" );
        }
        return JSON.toJSONString(map);
    }

}
