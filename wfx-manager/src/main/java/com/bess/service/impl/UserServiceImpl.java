package com.bess.service.impl;

import com.bess.dao.UserDAO;
import com.bess.beans.User;
import com.bess.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 22:50
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public User checkLogin(String account, String userPwd) {
        return userDAO.checkLogin(account,userPwd);
    }

    @Override
    public List<User> listUser() {
        return userDAO.listUser();
    }

    @Override
    public List<User> listUserByPage(int page,int limit) {
        int start = (page-1)*limit;
        return userDAO.listUserByPage(start,limit);
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean updateUser(String userId, String userName, String userPwd, String remark, String enabled) {
        int i = userDAO.updateUser(userId, userName, userPwd, remark, enabled);
        return i>0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean deleteUser(String userId) {
        int i = userDAO.deleteUser(userId);
        int i1 = userDAO.deleteUserRole(userId);
        return i>0 && i1>=0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean insertUser(User user) {
        return userDAO.insertUser(user) > 0;
    }

    @Override
    public boolean addUserRole(String userId, String roleId) {
        return userDAO.addUserRole(userId,roleId) > 0;
    }

    @Override
    public boolean updateUserRole(String userId, String roleId) {
        return userDAO.updateUserRole(userId,roleId) > 0;
    }
}
