package com.bess.service;

import com.bess.pojo.Module;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:21
 */
public interface ModuleService {
    public List<Module> getModuleByUserId(String userId);
}
