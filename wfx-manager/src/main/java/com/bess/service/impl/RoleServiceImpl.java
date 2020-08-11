package com.bess.service.impl;

import com.bess.beans.Role;
import com.bess.dao.RoleDAO;
import com.bess.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/11 10:18
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleDAO roleDAO;

    public void setRoleDAO(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    @Override
    public int getCount() {
        return roleDAO.getCount();
    }

    @Override
    public List<Role> listRoleByPage(int page, int limit) {
        int start = (page-1)*limit;
        return roleDAO.listRoleByPage(start,limit);
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean deleteRole(String roleCode) {
        int i = roleDAO.deleteRole(roleCode);
        int i1 = roleDAO.deleteByUserRole(roleCode);
        int i2 = roleDAO.deleteByModuleRole(roleCode);
        return i>0 && i2>0 && i1>=0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean updateRole(String roleCode, String roleName, String roleDesc) {
        return roleDAO.updateRole(roleCode,roleName,roleDesc) > 0;
    }
}
