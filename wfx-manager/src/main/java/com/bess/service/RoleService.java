package com.bess.service;

import com.bess.beans.Role;
import com.bess.beans.User;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/9 13:08
 */
public interface RoleService {
    public List<User> listRole();   // 角色管理信息list(去重)
}
