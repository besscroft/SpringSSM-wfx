package com.bess.service;

import com.bess.beans.Module;
import com.bess.beans.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 22:50
 */
public interface UserService {
    public User checkLogin(String account,String userPwd);  // 登录
    public List<User> listUser();   // 查询所有用户信息
    public List<User> listUserByPage(int page,int limit);   // 分页
}
