package com.bess.controller;

import com.bess.beans.Role;
import com.bess.service.RoleService;
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
 * @DateTime 2020/8/11 10:21
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleService roleService;

    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }

    @ResponseBody
    @RequestMapping("/list")
    public LayuiVO list(int page,int limit) {
        int count = roleService.getCount();
        List<Role> pageData = roleService.listRoleByPage(page, limit);
        LayuiVO vo = new LayuiVO(0, "success", count , pageData);
        return vo;
    }

    @ResponseBody
    @RequestMapping("/listAll")
    public ResultVO listRole() {
        List<Role> roles = roleService.listRole();
        if(roles != null){
            return new ResultVO(0,"sussces",roles);
        }else{
            return new ResultVO(1,"fail",null );
        }
    }

    @ResponseBody
    @RequestMapping("/delete")
    public ResultVO deleteRole(String roleCode) {
        boolean b = roleService.deleteRole(roleCode);
        System.out.println(b);
        if(b){
            return new ResultVO(0,"删除角色信息成功！",null);
        }else{
            return new ResultVO(1,"删除角色信息失败！",null );
        }
    }

    @ResponseBody
    @RequestMapping("/update")
    public ResultVO updateRole(@RequestBody Role role) {
        boolean b = roleService.updateRole(role.getRoleCode(), role.getRoleName(), role.getRoleDesc());
        if(b){
            return new ResultVO(0,"修改角色信息成功！",role);
        }else{
            return new ResultVO(1,"修改角色信息失败！",null );
        }
    }

    @ResponseBody
    @RequestMapping("/add")
    //如果前端提交的是据是JSON字符串则需要添加@RequestBody进行解析
    public ResultVO add(@RequestBody Role role) {
        boolean b = roleService.insertRole(role);
        if(b){
            return new ResultVO(0,"角色信息添加成功！",role);
        }else{
            return new ResultVO(1,"角色信息添加失败！",null);
        }
    }

    @ResponseBody
    @RequestMapping("/listYes")
    public ResultVO listYes(String roleId) {
        List<String> modules = roleService.listYes(roleId);
        if(modules != null){
            return new ResultVO(0,"查询成功！",modules);
        }else{
            return new ResultVO(1,"查询失败！",null);
        }
    }
}
