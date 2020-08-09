package com.bess.controller;

import com.bess.pojo.Module;
import com.bess.pojo.User;
import com.bess.service.ModuleService;
import com.bess.service.UserService;
import com.bess.util.RandomId;
import com.bess.vo.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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
    public ModelAndView login(String account, String password, HttpServletRequest request) {
        Map<String,Object> map = new HashMap<>();
        map.put("account",account);
        map.put("userPwd",password);
        User user = userService.getUser(map);
        List<Module> moduleList = moduleService.getModuleByUserId(user.getUserId());
        System.out.println(user);
        ModelAndView modelAndView = new ModelAndView("/main.jsp");
//        modelAndView.addObject("user",user);
        request.getSession().setAttribute("user",user);
        modelAndView.addObject("moduleList",moduleList);
        return modelAndView;
    }

    @RequestMapping("/listUser")
    public ModelAndView listUser() {
        List<User> userList = userService.listUser();
        ModelAndView modelAndView = new ModelAndView("/user_manager.jsp");
        modelAndView.addObject("userList",userList);
        return modelAndView;
    }

    @RequestMapping("/insertUser")
    public ModelAndView insertUser(String userName,String account,String userPwd,String remark,int userType){
        Map<String,Object> map = new HashMap<>();
//        #{userId},#{userName},#{account},#{userPwd},#{remark},#{userType},#{enabled},#{loginTime},#{roleId},#{self}
        map.put("userId", RandomId.getNum(8));
        map.put("userName",userName);
        map.put("account",account);
        map.put("userPwd",userPwd);
        map.put("remark",remark);
        map.put("userType",userType);
        map.put("enabled",0);
        map.put("loginTime",new Date());
        map.put("roleId",RandomId.getNum(8));
        map.put("self",RandomId.getNum(8));
        boolean b = userService.insertUser(map);
        ModelAndView modelAndView = null;
        if (b) {
            modelAndView = new ModelAndView("/user/listUser");
            return modelAndView;
        } else {
            modelAndView = new ModelAndView("/error.jsp");
            return modelAndView;
        }
    }

    @ResponseBody
    @RequestMapping("/deleteUser")
    public ResultVO deleteUser(String userId) {
        boolean b = userService.deleteUserById(userId);
        ResultVO resultVO = null;
        if (b) {
            resultVO = new ResultVO("200","sussces",null);
        } else {
            resultVO = new ResultVO("300","fail",null);
        }
        return resultVO;
    }

    @RequestMapping("/addModule")
    public ModelAndView addModule(String userId,String[] moduleName) {
        System.out.println(userId);
        String roleId = userService.getRoleIdByUserId(userId);
        for (int i=0; i < moduleName.length; i++) {
            System.out.println(moduleName[i]);
            List<Module> moduleList = moduleService.getModuleByParentModule(moduleName[i]);
            boolean b = userService.insertRoleFun(moduleName[i], roleId, moduleList);
            System.out.println(b);
        }
        return null;
    }
//    @ResponseBody
//    @RequestMapping("/twocheck")
//    public ResultVO twoCheck(HttpServletRequest request) {
//        User user = (User) request.getSession().getAttribute("user");
//        String userId = user.getUserId();
//        List<Module> moduleList = moduleService.getModuleByUserId(userId);
//        System.out.println(moduleList);
//        ResultVO resultVO = null;
//        if (moduleList != null) {
//            resultVO =new ResultVO("200","sussces",moduleList);
//        } else {
//            resultVO = new ResultVO("300","fail",null);
//        }
//        return resultVO;
//    }
}
