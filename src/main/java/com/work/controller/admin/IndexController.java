package com.work.controller.admin;

import com.work.bean.Room;
import com.work.bean.RoomType;
import com.work.service.RoomService;
import com.work.service.RoomTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class IndexController {
    @Resource
    private RoomTypeService roomTypeService;

    @Resource
    private RoomService roomService;

    @RequestMapping("/index.html")
    public String index(Model model){
        List<RoomType> roomTypeList = roomTypeService.findRoomType(null);


        List<Room> roomList = roomService.findRoomListByPage(null);

        model.addAttribute("roomTypeList",roomTypeList);
        model.addAttribute("roomList",roomList);
        return "forward:/home.jsp";
    }

}
