package com.bess.service;

import com.bess.pojo.Role;
import com.bess.pojo.User;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/9 13:08
 */
public interface RoleService {
    public List<User> listRole();   // 角色管理信息list(去重)
}
