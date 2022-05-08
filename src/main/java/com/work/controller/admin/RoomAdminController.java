package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.work.bean.Room;
import com.work.bean.RoomType;
import com.work.service.RoomService;
import com.work.utils.DataGridViewResult;
import com.work.utils.SystemConstant;
import com.work.vo.RoomPage;
import com.work.vo.RoomTypePage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/room")
public class RoomAdminController {
    @Resource
    private RoomService roomService;

    @RequestMapping("/list")
    private DataGridViewResult list(RoomPage roomPage) {
        PageHelper.startPage(roomPage.getPage(), roomPage.getLimit());
        List<Room> roomList = roomService.findRoomListByPage(roomPage);
        PageInfo<Room> pageInfo = new PageInfo<Room>(roomList);
        return new DataGridViewResult(pageInfo.getTotal(), pageInfo.getList());
    }

    @RequestMapping("addRoom")
    public String addRoom(Room room) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roomService.addRoom(room) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("updateRoom")
    public String updateRoom(Room room) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roomService.updateRoom(room) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Update Room Type Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Update Room Type Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/deleteById")
    private String deleteById(Integer id) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roomService.deleteById(id) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Delete Room Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Delete Room Fail !");
        }
        return JSON.toJSONString(map);
    }

}