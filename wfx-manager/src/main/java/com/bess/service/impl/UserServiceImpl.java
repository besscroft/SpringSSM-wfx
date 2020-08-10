package com.bess.service.impl;

import com.bess.dao.UserDAO;
import com.bess.beans.User;
import com.bess.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

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
}
