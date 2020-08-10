package com.bess.controller;

import com.bess.beans.Module;
import com.bess.beans.User;
import com.bess.service.ModuleService;
import com.bess.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 22:51
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @Resource
    private ModuleService moduleService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setModuleService(ModuleService moduleService) {
        this.moduleService = moduleService;
    }

    @RequestMapping("/login")
    public ModelAndView login(String account, String password, HttpSession session) {
        User user = userService.checkLogin(account,password);
        ModelAndView modelAndView;
        if (user != null) {
            session.setAttribute("user",user);
            List<Module> modules = moduleService.listModulesByAccount(user.getAccount());
            modelAndView = new ModelAndView("/main.jsp");
            modelAndView.addObject("modules",modules);
        } else {
            modelAndView = new ModelAndView("/index.jsp");
            modelAndView.addObject("tips","<label color='red'>帐号或密码错误！</label>");
        }
        return modelAndView;
    }
}
