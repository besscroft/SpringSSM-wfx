package com.bess.dao;

import com.bess.beans.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/11 10:09
 */
public interface RoleDAO {
    public int getCount();   // 查询角色信息数量
    public List<Role> listRoleByPage(@Param("start") int start,
                                     @Param("limit") int limit);   // 分页
}
