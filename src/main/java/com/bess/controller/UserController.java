package com.bess.controller;

import com.bess.pojo.Module;
import com.bess.pojo.User;
import com.bess.service.ModuleService;
import com.bess.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
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

    @Resource
    private ModuleService moduleService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setModuleService(ModuleService moduleService) {
        this.moduleService = moduleService;
    }

    @RequestMapping("/login")
    public ModelAndView login(String account,String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("account",account);
        map.put("userPwd",password);
        User user = userService.getUser(map);
        List<Module> moduleList = moduleService.getModuleByUserId(user.getUserId());
        System.out.println(user);
        ModelAndView modelAndView = new ModelAndView("/main.jsp");
        modelAndView.addObject("user",user);
        modelAndView.addObject("moduleList",moduleList);
        return modelAndView;
    }
}
