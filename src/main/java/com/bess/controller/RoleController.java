package com.bess.controller;

import com.bess.pojo.User;
import com.bess.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/9 12:34
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleService roleService;

    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    @RequestMapping("/listRole")
    public ModelAndView listRole(){
        List<User> userRoleList = roleService.listRole();
        ModelAndView modelAndView = new ModelAndView("/role_manager.jsp");
        modelAndView.addObject("userRoleList",userRoleList);
        return modelAndView;
    }
}
