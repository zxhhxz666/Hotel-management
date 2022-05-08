package com.work.service;

import com.work.bean.User;
import com.work.dao.UserMapper;

import com.work.utils.PasswordUtil;
import com.work.utils.SystemConstant;
import com.work.utils.UUIDUtils;
import com.work.vo.UserPage;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;


    @Override
    public User login(String userName, String password) {
        User user = userMapper.findUserByLoginName(userName);
        if (user != null) {
            String newPassword = PasswordUtil.md5(password, user.getSalt(), SystemConstant.PASSWORD_COUNT);
            if (newPassword.equals(user.getLoginPwd())) {
                return user;
            }
        }
        return null;
    }

    @Override
    public int getUserNumByDeptId(Integer deptId) {
        return userMapper.getUserNumByDeptId(deptId);
    }

    @Override
    public int getUserNumByRoleId(Integer roleId) {
        return userMapper.getUserNumByRoleId(roleId);
    }

    @Override
    public List<User> findUserByPage(UserPage userPage) {
        return userMapper.findUserByPage(userPage);
    }

    @Override
    public int addUser(User user) {
        user.setSalt(UUIDUtils.randomUUID());
        user.setLoginPwd(PasswordUtil.md5(SystemConstant.DEFAULT_PWD, user.getSalt(), SystemConstant.PASSWORD_COUNT));
        return userMapper.addUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int deleteById(Integer userId) {
        // delete the relationship between user and role
        userMapper.deleteRoleByUser(userId);
        return userMapper.deleteById(userId);
    }

    @Override
    public int resetPwd(Integer userId) {
        User user = new User();
        user.setSalt(UUIDUtils.randomUUID());
        user.setLoginPwd(PasswordUtil.md5(SystemConstant.DEFAULT_PWD, user.getSalt(), SystemConstant.PASSWORD_COUNT));
        user.setId(userId);
        return userMapper.updateUser(user);
    }

    @Override
    public boolean saveEmployeeRole(String roleIds, Integer userId) {
        userMapper.deleteRoleByUser(userId);

        String [] idStr = roleIds.split(",");
        for (int i = 0; i < idStr.length; i++) {
            userMapper.addUserRole(idStr[i],userId);
        }
        return true;
    }
}
