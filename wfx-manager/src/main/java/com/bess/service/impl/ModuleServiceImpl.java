package com.bess.service.impl;

import com.bess.dao.ModuleDAO;
import com.bess.beans.Module;
import com.bess.service.ModuleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:23
 */
@Service
public class ModuleServiceImpl implements ModuleService {
    @Resource
    private ModuleDAO moduleDAO;

    public void setModuleDAO(ModuleDAO moduleDAO) {
        this.moduleDAO = moduleDAO;
    }

    @Override
    public List<Module> listModules() {
        return moduleDAO.listModules();
    }

    @Override
    public List<Module> listModulesByAccount(String account) {
        return moduleDAO.listModulesByAccount(account);
    }

    @Override
    public List<Module> listFirstLevelModules() {
        return moduleDAO.listFirstLevelModules();
    }

    @Override
    public List<Module> listAllModules() {
        return moduleDAO.listAllModules();
    }

    @Override
    public List<Module> listModulesByParent(String parentModuleCode) {
        return moduleDAO.listModulesByParent(parentModuleCode);
    }

    @Override
    public List<Module> listModulesByPage(int page, int limit) {
        int start = (page-1)*limit;
        return moduleDAO.listModulesByPage(start,limit);
    }
}
