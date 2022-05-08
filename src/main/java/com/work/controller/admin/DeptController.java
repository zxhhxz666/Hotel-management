package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.work.bean.Dept;
import com.work.bean.User;
import com.work.service.DeptService;
import com.work.service.UserService;
import com.work.utils.DataGridViewResult;
import com.work.utils.SystemConstant;
import com.work.vo.DeptPage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/dept")
public class DeptController {
    @Resource
    private DeptService deptService;

    @Resource
    private UserService userService;

    @RequestMapping("/list")
    private DataGridViewResult list(DeptPage deptPage) {
        PageHelper.startPage(deptPage.getPage(), deptPage.getLimit());
        List<Dept> deptList = deptService.findDeptByPage(deptPage);
        PageInfo<Dept> pageInfo = new PageInfo<Dept>(deptList);
        return new DataGridViewResult(pageInfo.getTotal(), pageInfo.getList());
    }

    @RequestMapping("/addDept")
    private String addDept(Dept dept) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (deptService.addDept(dept) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/updateDept")
    private String updateDept(Dept dept) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (deptService.updateDept(dept) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/checkDeptHasUsers")
    private String checkDeptHasUsers(Integer deptId) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (userService.getUserNumByDeptId(deptId) > 0) {
            map.put(SystemConstant.EXIST, true);
            map.put(SystemConstant.MESSAGE, "Error ! This department has users!");
        } else {
            map.put(SystemConstant.EXIST, false);
            map.put(SystemConstant.MESSAGE, "This department is empty!");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/deleteById")
    private String deleteById(Integer deptId) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (deptService.deleteById(deptId) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/deptList")
    private String deptList() {
        return JSON.toJSONString(deptService.findDeptList());
    }


}
