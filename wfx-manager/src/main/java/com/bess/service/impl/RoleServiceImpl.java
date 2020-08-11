package com.bess.service.impl;

import com.bess.beans.Role;
import com.bess.dao.RoleDAO;
import com.bess.service.RoleService;
import org.springframework.stereotype.Service;

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
}
