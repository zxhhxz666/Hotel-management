package com.work.dao;

import java.util.List;
import com.work.bean.Menu;
import com.work.vo.MenuPage;

public interface MenuMapper {
    List<Menu> findAllMenus();
    List<Integer> findMenuByRoleId(int roleId);
    List<Menu> findMenuListByPage(MenuPage menuPage);
    List<Menu> findMenuListByUserId(int userId);
}
