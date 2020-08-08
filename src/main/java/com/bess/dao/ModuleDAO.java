package com.bess.dao;

import com.bess.pojo.Module;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:04
 */
public interface ModuleDAO {
    public List<Module> getModuleByUserId(String userId);   // 根据用户的id查询所有的权限信息
    public List<Module> getModuleByParentModule(String parentModule);   // 根据一级权限的module_code(parent_module)查询二级权限
}
