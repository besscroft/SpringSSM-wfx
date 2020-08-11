package com.bess.controller;

import com.bess.beans.Role;
import com.bess.service.RoleService;
import com.bess.vo.LayuiVO;
import com.bess.vo.ResultVO;
import org.springframework.stereotype.Controller;
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
    @RequestMapping("/delete")
    public ResultVO deleteRole(String roleCode) {
        boolean b = roleService.deleteRole(roleCode);
        if(b){
            return new ResultVO(0,"删除角色信息成功！",null);
        }else{
            return new ResultVO(1,"删除角色信息失败！",null );
        }
    }

    @ResponseBody
    @RequestMapping("/update")
    public ResultVO updateRole(Role role) {
        boolean b = roleService.updateRole(role.getRoleCode(), role.getRoleName(), role.getRoleDesc());
        if(b){
            return new ResultVO(0,"修改角色信息成功！",role);
        }else{
            return new ResultVO(1,"修改角色信息失败！",null );
        }
    }
}
