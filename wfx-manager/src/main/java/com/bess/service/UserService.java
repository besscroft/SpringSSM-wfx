package com.bess.service;

import com.bess.beans.User;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 22:50
 */
public interface UserService {
    public User checkLogin(String account,String userPwd);  // 登录
    public List<User> listUser();   // 查询所有用户信息
    public List<User> listUserByPage(int page,int limit);   // 分页
    public boolean updateUser(String userId,String userName,String userPwd,String remark,String enabled);    // 更新用户信息
    public boolean deleteUser(String userId);   // 删除用户
    public boolean insertUser(User user);   // 添加用户
    public boolean addUserRole(String userId,String roleId);    // 给用户添加角色
    public boolean updateUserRole(String userId,String roleId);  // 更新角色信息
}
