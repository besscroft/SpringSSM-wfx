package com.bess.controller;

import com.bess.beans.Module;
import com.bess.beans.User;
import com.bess.service.ModuleService;
import com.bess.service.UserService;
import com.bess.vo.LayuiVO;
import com.bess.vo.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @ResponseBody
    @RequestMapping("/list")
    public LayuiVO listUser(int page, int limit) {
        List<User> users = userService.listUser();
        List<User> pageData = userService.listUserByPage(page, limit);
        LayuiVO vo = new LayuiVO(0, "success", users.size() , pageData);
        return vo;
    }

    @ResponseBody
    @RequestMapping("/update")
    public ResultVO updateUser(User user) {
        boolean b = userService.updateUser(user.getUserId(),user.getUserName(),user.getUserPwd(),user.getRemark(),user.getEnabled());
        ResultVO vo;
        if (b) {
            vo = new ResultVO(0,"更新成功！",user);
        } else {
            vo = new ResultVO(1,"更新失败！",null);
        }
        return vo;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public ResultVO deleteUser(String userId) {
        boolean b = userService.deleteUser(userId);
        ResultVO vo;
        if (b) {
            vo = new ResultVO(0,"删除成功！",null);
        } else {
            vo = new ResultVO(1,"删除失败！",null);
        }
        return vo;
    }
}
