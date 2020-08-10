package com.bess.service.impl;

import com.bess.dao.UserDAO;
import com.bess.beans.User;
import com.bess.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
}
