package com.work.service;

import com.work.bean.Menu;
import com.work.dao.MenuMapper;
import com.work.vo.MenuPage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuMapper menuMapper;

    @Override
    public List<Menu> findAllMenus() {
        return menuMapper.findAllMenus();
    }

    @Override
    public List<Integer> findMenuByRoleId(int roleId) {
        return menuMapper.findMenuByRoleId(roleId);
    }

    @Override
    public List<Menu> findMenuListByPage(MenuPage menuPage) {
        return menuMapper.findMenuListByPage(menuPage);
    }

    @Override
    public List<Menu> findMenuListByUserId(int userId) {
        return menuMapper.findMenuListByUserId(userId);
    }
}
