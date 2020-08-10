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
}
