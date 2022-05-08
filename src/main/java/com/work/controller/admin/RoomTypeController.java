package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.work.bean.Dept;
import com.work.bean.RoomType;
import com.work.service.RoomTypeService;
import com.work.utils.DataGridViewResult;
import com.work.utils.SystemConstant;
import com.work.utils.UUIDUtils;
import com.work.vo.DeptPage;
import com.work.vo.RoomTypePage;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/roomType")
public class RoomTypeController {
    @Resource
    private RoomTypeService roomTypeService;

    @RequestMapping("/list")
    private DataGridViewResult list(RoomTypePage roomTypePage) {
        PageHelper.startPage(roomTypePage.getPage(), roomTypePage.getLimit());
        List<RoomType> roomTypeList = roomTypeService.findRoomType(roomTypePage);
        PageInfo<RoomType> pageInfo = new PageInfo<RoomType>(roomTypeList);
        return new DataGridViewResult(pageInfo.getTotal(), pageInfo.getList());
    }


    @RequestMapping("addRoomType")
    public String addRoomType(RoomType roomType) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roomTypeService.addRoomType(roomType) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("updateRoomType")
    public String updateRoomType(RoomType roomType) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roomTypeService.updateRoomType(roomType) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Update Room Type Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Update Room Type Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/findAll")
    public String findAll(){
        return JSON.toJSONString(roomTypeService.findRoomType(null));
    }

}
