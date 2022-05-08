package com.work.dao;

import com.work.bean.User;
import com.work.vo.UserPage;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface UserMapper {
    User findUserByLoginName(String loginName);
    int getUserNumByDeptId(Integer deptId);
    int getUserNumByRoleId(Integer roleId);
    List<User> findUserByPage(UserPage userPage);
    int addUser(User user);
    int updateUser(User user);
    int deleteById(Integer userId);
    void deleteRoleByUser(Integer userId);

    @Insert("insert into role_user (userId,roleId) values(#{userId},#{roleId})")
    void addUserRole(@Param("roleId") String roleId, @Param("userId") Integer userId);
}
