package com.bess.service.impl;

import com.bess.dao.RoleDAO;
import com.bess.beans.Role;
import com.bess.beans.User;
import com.bess.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/9 13:08
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleDAO roleDAO;

    public void setRoleDAO(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    @Override
    public List<User> listRole() {
        List<User> userRoleList = roleDAO.listRole();
        return userRoleList;
    }
}
