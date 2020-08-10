package com.bess.controller;

import com.bess.beans.Module;
import com.bess.service.ModuleService;
import com.bess.vo.LayuiVO;
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
    @RequestMapping("/list")
    public LayuiVO listModules(int page, int limit){

        //List<Module> modules = moduleService.listFirstLevelModules();
        List<Module> modules = moduleService.listAllModules();
        List<Module> pageData = moduleService.listModulesByPage(page, limit);

        LayuiVO vo = new LayuiVO(0, "success", modules.size() , pageData);
        return vo;
    }
}
