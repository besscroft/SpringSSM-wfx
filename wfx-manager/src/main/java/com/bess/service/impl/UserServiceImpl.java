package com.bess.service.impl;

import com.bess.dao.RoleDAO;
import com.bess.dao.UserDAO;
import com.bess.beans.Module;
import com.bess.beans.User;
import com.bess.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 22:50
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDAO userDAO;

    @Resource
    private RoleDAO roleDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void setRoleDAO(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.SUPPORTS)
    public User getUser(Map<String, Object> map) {
        User user = userDAO.getUser(map);
        return user;
    }

    @Override
    public List<User> listUser() {
        List<User> userList = userDAO.listUser();
        return userList;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean insertUser(Map<String, Object> map) {
        int i = userDAO.insertUser(map);
        return i>0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean deleteUserById(String userId) {
        int i = userDAO.deleteUserById(userId);
        return i>0;
    }

    @Override
    public String getRoleIdByUserId(String userId) {
        String roleId = userDAO.getRoleIdByUserId(userId);
        return roleId;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean insertRoleFun(String moduleId, String roleId, List<Module> moduleList) {
        int i = roleDAO.insertRoleFun(moduleId, roleId);
        if (i>0) {
            for (Module module: moduleList) {
                int i1 = roleDAO.insertRoleFun(module.getModuleCode(), roleId);
            }
            return true;
        } else {
            return false;
        }
    }


}
