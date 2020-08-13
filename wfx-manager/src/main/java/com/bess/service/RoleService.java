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
    public List<Role> listRole();   // 不分页，直接查询所有的角色信息
    public List<Role> listRoleByPage(int page,int limit);   // 分页
    public boolean deleteRole(String roleCode); // 删除角色
    public boolean updateRole(String roleCode,String roleName,String roleDesc);   // 修改角色字段
    public boolean insertRole(Role role);   // 新增角色
}
