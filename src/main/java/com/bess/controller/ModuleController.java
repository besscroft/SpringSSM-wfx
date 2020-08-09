package com.bess.controller;

import com.bess.pojo.Module;
import com.bess.service.ModuleService;
import com.bess.vo.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:24
 */
@Controller
@RequestMapping("/module")
public class ModuleController {
    @Resource
    private ModuleService moduleService;

    public void setModuleService(ModuleService moduleService) {
        this.moduleService = moduleService;
    }

    @ResponseBody
    @RequestMapping("/check")
    public ResultVO checkModule(String parentModule){
        System.out.println(parentModule);
        List<Module> moduleList = moduleService.getModuleByParentModule(parentModule);
        System.out.println(moduleList);
        ResultVO resultVO = null;
        if (moduleList != null) {
            resultVO =new ResultVO("200","sussces",moduleList);
        } else {
            resultVO = new ResultVO("300","fail",null);
        }
        return resultVO;
    }

    @RequestMapping("/listModule")
    public ModelAndView listModule(){
        List<Module> moduleList = moduleService.listModule();
        System.out.println(moduleList);
        ModelAndView modelAndView = new ModelAndView("/module_manager.jsp");
        modelAndView.addObject("moduleList",moduleList);
        return modelAndView;
    }
}
