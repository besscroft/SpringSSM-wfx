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
    public User getUser(Map<String,Object> map);    // 登录
    public List<User> listUser();   // 查询所有的用户信息
    public boolean insertUser(Map<String,Object> map);  // 新增用户，往user_info表中插入数据
    public boolean deleteUserById(String userId);   // 删除用户
    public String getRoleIdByUserId(String userId);  // 根据用户id查询role_id
    public boolean insertRoleFun(String moduleId, String roleId, List<Module> moduleList); //新增数据进sys_role_fun表
}
