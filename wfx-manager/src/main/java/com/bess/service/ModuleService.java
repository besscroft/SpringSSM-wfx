package com.bess.service;

import com.bess.beans.Module;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:21
 */
public interface ModuleService {
    public List<Module> listModules();  // 查询所有权限(所有菜单信息）

    public List<Module> listModulesByAccount(String account);   // 根据账户查询该账户的所有权限

    public List<Module> listFirstLevelModules();    // 查一级菜单
    public List<Module> listAllModules();   // 查询所有权限
    public List<Module> listModulesByParent(String parentModuleCode);   // 根据父菜单查询子菜单
    public List<Module> listModulesByPage(int page,int limit);   // 分页
    public boolean updateModule(String moduleCode,String moduleName,String moduleUrl);    // 更新菜单信息
    public boolean deleteModule(String moduleCode);    // 删除菜单

    public int topLevel(String roleCode, String moduleCode);    //一级权限授权
    public int secondLevel(String roleCode, String moduleCode); //二级权限授权
    public int grantPermission(String roleCode,String moduleCode);  // 授权
    public int revokePermission(String roleCode,String moduleCode); // 删除权限
}
