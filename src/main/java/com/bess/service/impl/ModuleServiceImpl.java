package com.bess.service.impl;

import com.bess.dao.ModuleDAO;
import com.bess.pojo.Module;
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
    public List<Module> getModuleByUserId(String userId) {
        List<Module> moduleList = moduleDAO.getModuleByUserId(userId);
        return moduleList;
    }
}
