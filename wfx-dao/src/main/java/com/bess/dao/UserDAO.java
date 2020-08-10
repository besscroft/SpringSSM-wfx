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
}
