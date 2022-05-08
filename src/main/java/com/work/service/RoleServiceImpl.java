package com.work.service;

import com.work.bean.Role;
import com.work.dao.RoleMapper;
import com.work.vo.RolePage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;


    @Override
    public List<Role> findRoleByPage(RolePage rolePage) {
        return roleMapper.findRoleByPage(rolePage);
    }

    @Override
    public int addRole(Role role) {
        return roleMapper.addRole(role);
    }

    @Override
    public int updateRole(Role role) {
        return roleMapper.updateRole(role);
    }

    @Override
    public int deleteById(Integer roleId) {
        return roleMapper.deleteById(roleId);
    }

    @Override
    public int saveRoleMenu(String ids, Integer roleId) {
        // delete all menus belong to this role
        roleMapper.deleteRoleMenu(roleId);
        String[] idList = ids.split(",");
        for (String id : idList) {
            Integer menuId = Integer.parseInt(id);
            roleMapper.addRoleMenu(roleId, menuId);
        }
        return 1;
    }

    @Override
    public void deleteRoleMenu(Integer roleId) {
        roleMapper.deleteRoleMenu(roleId);
    }

    @Override
    public void addRoleMenu(Integer roleId, Integer menuId) {
        roleMapper.addRoleMenu(roleId, menuId);
    }

    @Override
    public List<Map<String, Object>> findRoleListByMap() {
        return roleMapper.findRoleListByMap();
    }

    @Override
    public List<Integer> findRoleByUserId(Integer userId) {
        return roleMapper.findRoleByUserId(userId);
    }
}
