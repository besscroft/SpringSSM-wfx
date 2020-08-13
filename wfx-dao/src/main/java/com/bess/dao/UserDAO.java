package com.bess.dao;

import com.bess.beans.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 18:05
 */
public interface UserDAO {
    public User checkLogin(@Param("account") String account,
                           @Param("userPwd") String userPwd);  // 登录
    public List<User> listUser();   // 查询所有用户信息
    public List<User> listUserByPage(@Param("start") int start,
                               @Param("limit") int limit);   // 分页
    public int updateUser(@Param("userId") String userId,
                          @Param("userName") String userName,
                          @Param("userPwd") String userPwd,
                          @Param("remark") String remark,
                          @Param("enabled") String enabled);    // 更新用户信息
    public int deleteUser(@Param("userId") String userId);    // 1.先根据用户id删除用户
    public int deleteUserRole(@Param("userId") String userId);  // 2.再根据用户id删除用户角色关系表的数据
    public int insertUser(User user);   // 添加用户
    public int addUserRole(@Param("userId") String userId,
                           @Param("roleId") String roleId);    // 给用户添加角色
}
