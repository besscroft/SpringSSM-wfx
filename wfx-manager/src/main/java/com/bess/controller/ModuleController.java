package com.bess.controller;

import com.bess.beans.Module;
import com.bess.beans.TreeNode;
import com.bess.service.ModuleService;
import com.bess.util.RandomId;
import com.bess.vo.LayuiVO;
import com.bess.vo.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @ResponseBody
    @RequestMapping("/update")
    public ResultVO updateModule(Module module) {
        boolean b = moduleService.updateModule(module.getModuleCode(),module.getModuleName(),module.getModuleUrl());
        ResultVO vo;
        if (b) {
            vo = new ResultVO(0,"更新成功！",module);
        } else {
            vo = new ResultVO(1,"更新失败！",null);
        }
        return vo;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public ResultVO deleteModule(String moduleCode) {
        boolean b = moduleService.deleteModule(moduleCode);
        ResultVO vo;
        if (b) {
            vo = new ResultVO(0,"删除成功！",null);
        } else {
            vo = new ResultVO(1,"删除失败！",null);
        }
        return vo;
    }

    @ResponseBody
    @RequestMapping("/grant")
    public ResultVO grant(String roleCode,String moduleCode,boolean state){
        int i = 0;
        if(state){
            System.out.println("授权");
            //授权
            i = moduleService.grantPermission(roleCode,moduleCode);
        }else{
            //撤销权限
            System.out.println("撤销权限");
            i = moduleService.revokePermission(roleCode,moduleCode);
        }

        String str = (state?"授权":"撤销权限")+(i>0?"成功":"失败");
        return  new ResultVO(0,str,null);
    }

    @ResponseBody
    @RequestMapping("/listall")
    public ResultVO listAllModules() {
        List<TreeNode> modules = moduleService.listTreeModules();
        System.out.println(modules);
        modules.get(0).setSpread(true);
        return new ResultVO(0,"success",modules);
    }

    @ResponseBody
    @RequestMapping("/add")
    public ResultVO insertModule(@RequestBody Module module) {
        String moduleId = RandomId.getNum(8);
        boolean b = moduleService.insertModule(moduleId,module.getModuleCode(),module.getModuleName(),module.getModuleUrl());
        ResultVO vo;
        if (b) {
            vo = new ResultVO(0,"添加成功！",null);
        } else {
            vo = new ResultVO(1,"添加失败！",null);
        }
        return vo;
    }
}
