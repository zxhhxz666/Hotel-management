package com.work.service;

import com.work.bean.Role;
import com.work.vo.RolePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoleService {
    List<Role> findRoleByPage(RolePage rolePage);
    int addRole(Role role);
    int updateRole(Role role);
    int deleteById(Integer roleId);
    int saveRoleMenu(String ids, Integer roleId);
    void deleteRoleMenu(Integer roleId);
    void addRoleMenu(Integer roleId, Integer menuId);
    List<Map<String,Object>> findRoleListByMap();
    List<Integer> findRoleByUserId(Integer userId);
}
