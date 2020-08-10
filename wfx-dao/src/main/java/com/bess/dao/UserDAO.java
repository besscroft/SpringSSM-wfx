package com.bess.dao;

import com.bess.beans.User;

import java.util.List;
import java.util.Map;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 18:05
 */
public interface UserDAO {
    public User getUser(Map<String,Object> map);    // 登录
    public List<User> listUser();   // 查询所有的用户信息
    public int insertUser(Map<String,Object> map);  // 新增用户，往user_info表中插入数据
    public int deleteUserById(String userId);   // 删除用户
    public String getRoleIdByUserId(String userId);  // 根据用户id查询role_id
}
