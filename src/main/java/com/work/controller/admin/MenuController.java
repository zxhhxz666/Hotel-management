package com.work.controller.admin;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.work.bean.Menu;
import com.work.bean.Role;
import com.work.bean.User;
import com.work.utils.*;
import com.work.service.MenuService;
import com.work.vo.MenuPage;
import com.work.vo.RolePage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/menu")
public class MenuController {
    @Resource
    private MenuService menuService;

    @RequestMapping("/loadMenus")
    public String loadMenus(HttpSession httpSession) {
        User user = (User) httpSession.getAttribute(SystemConstant.LOGIN_USER);
        List<Menu> menus = menuService.findMenuListByUserId(user.getId());
        List<MenuNode> menuNodes = new ArrayList<>();
        for (Menu menu : menus) {
            MenuNode menuNode = new MenuNode();
            menuNode.setHref(menu.getHref());
            menuNode.setIcon(menu.getIcon());
            menuNode.setId(menu.getId());
            menuNode.setPid(menu.getPid());
            menuNode.setSpread(menu.getSpread());
            menuNode.setTitle(menu.getTitle());
            menuNodes.add(menuNode);
        }
        Map<String, Object> results = new LinkedHashMap<String, Object>();
        results.put("menuInfo", TreeUtil.toTree(menuNodes, 0));
        Map<String, Object> homeInfo = new LinkedHashMap<String, Object>();
        homeInfo.put("title", "Main Page");
        homeInfo.put("href", "/admin/main.html");
        results.put("homeInfo", homeInfo);
        Map<String, Object> logoInfo = new LinkedHashMap<String, Object>();
        logoInfo.put("title", "Hotel");
        logoInfo.put("image", "/statics/images/logo.png");
        logoInfo.put("href", "/admin/home.html");
        results.put("logoInfo", logoInfo);
        return JSON.toJSONString(results);
    }
    @RequestMapping("/loadMenuTree")
    public DataGridViewResult loadMenuTree() {
        List<Menu> menuList = menuService.findAllMenus();
        List<TreeNode> treeNodes = new ArrayList<TreeNode>();
        for (Menu menu : menuList) {
            Boolean spread = menu.getSpread() == null || menu.getSpread() == 1;
            treeNodes.add(new TreeNode(menu.getId(),menu.getPid(),menu.getTitle(),spread));
        }
        return new DataGridViewResult(treeNodes);
    }

    @RequestMapping("/list")
    private DataGridViewResult list(MenuPage menuPage) {
        PageHelper.startPage(menuPage.getPage(), menuPage.getLimit());
        List<Menu> menuList = menuService.findMenuListByPage(menuPage);
        PageInfo<Menu> pageInfo = new PageInfo<Menu>(menuList);
        return new DataGridViewResult(pageInfo.getTotal(), pageInfo.getList());
    }
}
