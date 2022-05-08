package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.work.bean.Dept;
import com.work.bean.Menu;
import com.work.bean.Role;
import com.work.service.MenuService;
import com.work.service.RoleService;
import com.work.service.UserService;
import com.work.utils.DataGridViewResult;
import com.work.utils.SystemConstant;
import com.work.utils.TreeNode;
import com.work.vo.DeptPage;
import com.work.vo.RolePage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/role")
public class RoleController {
    @Resource
    private RoleService roleService;

    @Resource
    private UserService userService;

    @Resource
    private MenuService menuService;

    @RequestMapping("/list")
    private DataGridViewResult list(RolePage rolePage) {
        PageHelper.startPage(rolePage.getPage(), rolePage.getLimit());
        List<Role> roleList = roleService.findRoleByPage(rolePage);
        PageInfo<Role> pageInfo = new PageInfo<Role>(roleList);
        return new DataGridViewResult(pageInfo.getTotal(), pageInfo.getList());
    }

    @RequestMapping("/addRole")
    private String addRole(Role role) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roleService.addRole(role) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/updateRole")
    private String updateRole(Role role) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roleService.updateRole(role) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/checkRoleHasUsers")
    private String checkRoleHasUsers(Integer roleId) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (userService.getUserNumByRoleId(roleId) > 0) {
            map.put(SystemConstant.EXIST, true);
            map.put(SystemConstant.MESSAGE, "Error ! This role has users!");
        } else {
            map.put(SystemConstant.EXIST, false);
            map.put(SystemConstant.MESSAGE, "This role is empty!");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/deleteById")
    private String deleteById(Integer roleId) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roleService.deleteById(roleId) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/initMenu")
    private DataGridViewResult initMenu(Integer roleId) {
        List<Menu> menuList = menuService.findAllMenus();
        List<Integer> subMenus = menuService.findMenuByRoleId(roleId);
        List<TreeNode> treeNodes = new ArrayList<TreeNode>();
        for (Menu menu : menuList) {
            String checkAttr = "0";
            for (Integer i : subMenus) {
                if (menu.getId().equals(i)) {
                    checkAttr = "1";
                    break;
                }
            }
            Boolean spread = menu.getSpread() == null || menu.getSpread() == 1;
            treeNodes.add(new TreeNode(menu.getId(),menu.getPid(),menu.getTitle(),spread, checkAttr));
        }
        return new DataGridViewResult(treeNodes);
    }

    @RequestMapping("/saveRoleMenu")
    public String saveRoleMenu(String ids, Integer roleId) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (roleService.saveRoleMenu(ids, roleId) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "Success !");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "Fail !");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/initRoleListByUserId")
    public DataGridViewResult initRoleListByUserId(int id){

        List<Map<String, Object>> roleList = roleService.findRoleListByMap();

        List<Integer> roleIds = roleService.findRoleByUserId(id);

        for (Map<String, Object> map : roleList) {

            boolean flag = false;

            Integer rid = (Integer) map.get("id");

            for (Integer roleId : roleIds) {

                if(rid ==  roleId){
                    flag = true;
                    break;
                }
            }

            map.put("LAY_CHECKED",flag);
        }
        return new DataGridViewResult(Long.valueOf(roleList.size()),roleList);
    }



}
