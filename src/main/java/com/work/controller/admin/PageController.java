package com.work.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class PageController {
    @RequestMapping("/login.html")
    public String login() {
        return "admin/login";
    }

    @RequestMapping("/main.html")
    public String main() {
        return "admin/main";
    }

    @RequestMapping("/home.html")
    public String home() {
        return "admin/home";
    }

    @RequestMapping("/logout.html")
    public String logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "redirect:/admin/login.html";
    }

    @RequestMapping("/gotoDeptManager")
    public String gotoDeptManager() {
        return "admin/dept/deptManager";
    }

    @RequestMapping("/gotoRoleManager")
    public String gotoRoleManager() {
        return "admin/role/roleManager";
    }

    @RequestMapping("/gotoUserManager")
    public String gotoUserManager() {
        return "admin/user/userManager";
    }

    @RequestMapping("/gotoMenuManager")
    public String gotoMenuManager() {
        return "admin/menu/menuManager";
    }

    @RequestMapping("/gotoRoomTypeManager")
    public String gotoRoomTypeManager() {
        return "admin/roomType/roomTypeManager";
    }

    @RequestMapping("/gotoRoomManager")
    public String gotoRoomManager() {
        return "admin/room/roomManager";
    }

    @RequestMapping("/gotoOrdersManager")
    public String gotoOrdersManager() {
        return "admin/orders/ordersManager";
    }

    @RequestMapping("/gotoCheckManager")
    public String gotoCheckManager() {
        return "admin/check/checkManager";
    }
}
