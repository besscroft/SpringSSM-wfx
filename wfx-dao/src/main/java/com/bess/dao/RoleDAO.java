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
    public List<Role> listRole();   // 不分页，直接查询所有的角色信息
    public List<Role> listRoleByPage(@Param("start") int start,
                                     @Param("limit") int limit);   // 分页
    public int deleteRole(@Param("roleCode") String code); // 1.删除角色表中的角色
    public int deleteByUserRole(@Param("roleCode") String code);   // 2.删除角色和用户关系表中的对应关系记录
    public int deleteByModuleRole(@Param("roleCode") String code); // 3.删除角色和菜单关系表中的对应关系记录
    public int updateRole(@Param("roleCode") String roleCode,
                          @Param("roleName")String roleName,
                          @Param("roleDesc")String roleDesc);   // 修改角色字段
    public int insertRole(Role role);   // 新增角色
}
