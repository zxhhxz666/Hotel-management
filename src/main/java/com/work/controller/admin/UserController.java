package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.work.bean.Dept;
import com.work.bean.User;
import com.work.service.UserService;
import com.work.utils.DataGridViewResult;
import com.work.utils.SystemConstant;
import com.work.vo.DeptPage;
import com.work.vo.UserPage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public String login(String username, String password, HttpSession httpSession) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = userService.login(username, password);
        if (user != null) {

            httpSession.setAttribute(SystemConstant.LOGIN_USER, user);
            map.put(SystemConstant.SUCCESS, true);
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Username or Password is error!");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/list")
    private DataGridViewResult list(UserPage userPage) {
        PageHelper.startPage(userPage.getPage(), userPage.getLimit());
        List<User> userList = userService.findUserByPage(userPage);
        PageInfo<User> pageInfo = new PageInfo<User>(userList);
        return new DataGridViewResult(pageInfo.getTotal(), pageInfo.getList());
    }

    @RequestMapping("/addUser")
    public String addUser(User user) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (userService.addUser(user) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (userService.updateUser(user) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/deleteById")
    private String deleteById(Integer userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (userService.deleteById(userId) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/resetPwd")
    private String resetPwd(Integer userId) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (userService.resetPwd(userId) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/saveUserRole")
    public String saveEmployeeRole(String roleIds,Integer userId){
        Map<String,Object> map = new HashMap<String,Object>();

        if(userService.saveEmployeeRole(roleIds,userId)){
            map.put(SystemConstant.MESSAGE,"Success");
        }else{
            map.put(SystemConstant.MESSAGE,"Fail");
        }
        return JSON.toJSONString(map);
    }
}
