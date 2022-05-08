package com.work.service;

import com.work.bean.User;
import com.work.vo.UserPage;

import java.util.List;

public interface UserService {
    User login(String userName, String password);
    int getUserNumByDeptId(Integer deptId);
    int getUserNumByRoleId(Integer roleId);
    List<User> findUserByPage(UserPage userPage);
    int addUser(User user);
    int updateUser(User user);
    int deleteById(Integer userId);
    int resetPwd(Integer userId);
    boolean saveEmployeeRole(String roleIds, Integer userId);
}
