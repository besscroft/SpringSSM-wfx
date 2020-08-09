package com.bess.service;

import com.bess.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 22:50
 */
public interface UserService {
    public User getUser(Map<String,Object> map);    // 登录
    public List<User> listUser();   // 查询所有的用户信息
}
