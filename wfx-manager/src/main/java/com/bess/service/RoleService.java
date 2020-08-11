package com.bess.service;

import com.bess.beans.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/11 10:17
 */
public interface RoleService {
    public int getCount();   // 查询角色信息数量
    public List<Role> listRoleByPage(int page,int limit);   // 分页
}
