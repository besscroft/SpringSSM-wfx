package com.bess.dao;

import com.bess.pojo.Role;
import com.bess.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/9 12:40
 */
public interface RoleDAO {
    public List<User> listRole();   // 角色管理信息list(去重)
    public int insertRoleFun(@Param("moduleId") String moduleId,@Param("roleId") String roleId); //新增数据进sys_role_fun表
}
