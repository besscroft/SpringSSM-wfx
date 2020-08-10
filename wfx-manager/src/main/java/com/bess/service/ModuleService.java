package com.bess.service;

import com.bess.beans.Module;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:21
 */
public interface ModuleService {
    public List<Module> getModuleByUserId(String userId);   // 根据用户的id查询所有的权限信息
    public List<Module> getModuleByParentModule(String parentModule);   // 根据一级权限的module_code(parent_module)查询二级权限
    public List<Module> listModule();   //获取所有的权限菜单（list）
}
