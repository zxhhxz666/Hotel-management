package com.work.service;

import com.work.bean.Menu;
import com.work.vo.MenuPage;

import java.util.List;

public interface MenuService {
    List<Menu> findAllMenus();
    List<Integer> findMenuByRoleId(int roleId);
    List<Menu> findMenuListByPage(MenuPage menuPage);
    List<Menu> findMenuListByUserId(int userId);
}
