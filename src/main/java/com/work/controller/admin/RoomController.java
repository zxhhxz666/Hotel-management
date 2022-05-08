package com.work.controller.admin;

import com.work.bean.Room;
import com.work.bean.RoomType;
import com.work.service.RoomService;
import com.work.service.RoomTypeService;
import com.work.vo.RoomPage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomController {
    @Resource
    private RoomService roomService;

    @Resource
    private RoomTypeService roomTypeService;


    @RequestMapping("/{id}.html")
    public String detail(@PathVariable Integer id, Model model){

        Room room = roomService.findById(id);

        model.addAttribute("room",room);
        return "detail";
    }

    @RequestMapping("/list.html")
    public String list(Model model){

        List<RoomType> roomTypeList = roomTypeService.findRoomType(null);

        RoomPage roomVo = new RoomPage();
        roomVo.setStatus(3);

        List<Room> roomList = roomService.findRoomListByPage(roomVo);

        model.addAttribute("roomTypeList",roomTypeList);
        model.addAttribute("roomList",roomList);
        return "roomlist";
    }

    @RequestMapping("/list/{id}")
    public String list(@PathVariable Integer id,Model model){

        List<RoomType> roomTypeList = roomTypeService.findRoomType(null);

        RoomPage roomVo = new RoomPage();
        roomVo.setRoomTypeId(id);
        roomVo.setStatus(3);

        List<Room> roomList = roomService.findRoomListByPage(roomVo);

        model.addAttribute("roomTypeList",roomTypeList);
        model.addAttribute("roomList",roomList);
        model.addAttribute("typeId",id);
        return "roomlist";
    }
}
