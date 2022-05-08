package com.work.dao;



import com.work.bean.Role;
import com.work.vo.RolePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
    List<Role> findRoleByPage(RolePage rolePage);
    int addRole(Role role);
    int updateRole(Role role);
    int deleteById(Integer roleId);

    void deleteRoleMenu(Integer roleId);
    void addRoleMenu(@Param("roleId") Integer roleId, @Param("menuId") Integer menuId);
    List<Map<String,Object>> findRoleListByMap();
    List<Integer> findRoleByUserId(Integer employeeId);
}
