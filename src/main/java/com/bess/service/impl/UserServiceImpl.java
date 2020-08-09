package com.bess.service.impl;

import com.bess.dao.UserDAO;
import com.bess.pojo.User;
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

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
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
}
