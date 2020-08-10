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
    public User checkLogin(@Param("account") String account,
                           @Param("password") String userPwd);  // 登录
}
