package com.bess.dao;

import com.bess.beans.Module;
import com.bess.beans.TreeNode;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:04
 */
public interface ModuleDAO {
    public List<Module> listModules();  // 查询所有权限(所有菜单信息）

    public List<Module> listModulesByAccount(String account);   // 根据账户查询该账户的所有权限

    public List<Module> listFirstLevelModules();    // 查一级菜单
    public List<Module> listAllModules();   // 查询所有权限
    public List<Module> listModulesByParent(String parentModuleCode);   // 根据父菜单查询子菜单
    public List<Module> listModulesByPage(@Param("start") int start,
                                          @Param("limit") int limit);   // 分页
    public int updateModule(@Param("moduleCode") String moduleCode,
                            @Param("moduleName") String moduleName,
                            @Param("moduleUrl") String moduleUrl);  // 修改菜单
    public int deleteModule(@Param("moduleCode") String moduleCode);    // 删除菜单

    public List<TreeNode> listTreeModules();  // 查询所有权限(所有菜单信息）

    public int insertRoleModule(@Param("rcode") String roleCode,
                                @Param("mcode") String moduleCode); // 授权

    public int deleteRoleModule(@Param("rcode") String roleCode,
                                @Param("mcode") String moduleCode);  // 删除权限

    public List<String> listMidByTopId(String topid);   // 查询父权限

    public List<String> listMidBySecondId(String secondId); // 查询子权限
    public int insertModule(@Param("moduleId") String moduleId,
                            @Param("moduleCode") String moduleCode,
                            @Param("moduleName") String moduleName,
                            @Param("moduleUrl") String moduleUrl); // 添加菜单
}
