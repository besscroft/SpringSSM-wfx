package com.bess.controller;

import com.bess.pojo.User;
import com.bess.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 22:51
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/login")
    public ModelAndView login(String account,String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("account",account);
        map.put("userPwd",password);
        User user = userService.getUser(map);
        System.out.println(user);
        ModelAndView modelAndView = new ModelAndView("/main.jsp");
        modelAndView.addObject("user",user);
        return modelAndView;
    }
}
