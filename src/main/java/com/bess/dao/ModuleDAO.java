package com.bess.dao;

import com.bess.pojo.Module;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:04
 */
public interface ModuleDAO {
    public List<Module> getModuleByUserId(String userId);
}
