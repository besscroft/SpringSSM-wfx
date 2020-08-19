package com.bess.service.impl;

import com.bess.beans.TreeNode;
import com.bess.dao.ModuleDAO;
import com.bess.beans.Module;
import com.bess.service.ModuleService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:23
 */
@Service
public class ModuleServiceImpl implements ModuleService {
    @Resource
    private ModuleDAO moduleDAO;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    private ObjectMapper mapper = new ObjectMapper();

    public void setModuleDAO(ModuleDAO moduleDAO) {
        this.moduleDAO = moduleDAO;
    }

    @Override
    public List<Module> listModules() {
        return moduleDAO.listModules();
    }

    @Override
    public List<Module> listModulesByAccount(String account) {
        return moduleDAO.listModulesByAccount(account);
    }

    @Override
    public List<Module> listFirstLevelModules() {
        return moduleDAO.listFirstLevelModules();
    }

    @Override
    public List<Module> listAllModules() {
        return moduleDAO.listAllModules();
    }

    @Override
    public List<Module> listModulesByParent(String parentModuleCode) {
        return moduleDAO.listModulesByParent(parentModuleCode);
    }

    @Override
    public List<Module> listModulesByPage(int page, int limit) {
        List<Module> modules = null;
        try {
            // 先从redis中查询
            String s = (String) stringRedisTemplate.boundHashOps("modules").get("page-" + page);
            System.out.println(s);
            if (s == null) {
                // 如果redis中没有数据，则查询数据库
                int start = (page-1)*limit;
                modules = moduleDAO.listModulesByPage(start, limit);
                // 将List集合转成字符串
                String jsonStr = mapper.writeValueAsString(modules);
                stringRedisTemplate.boundHashOps("modules").put("page-" + page,jsonStr);
            } else {
                // 如果redis中查出数据了，将json字符串转换成List集合
                modules = mapper.readValue(s, new TypeReference<List<Module>>() {});
            }
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return modules;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean updateModule(String moduleCode, String moduleName, String moduleUrl) {
        return moduleDAO.updateModule(moduleCode,moduleName,moduleUrl) > 0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean deleteModule(String moduleCode) {
        return moduleDAO.deleteModule(moduleCode) > 0;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public int grantPermission(String roleCode, String moduleCode) {
        int i = 0;
        // 根据当前权限id查询子权限id
        List<TreeNode> treeNodes = moduleDAO.listTreeModules();
        for (TreeNode n: treeNodes) {
            if(moduleCode.equals(n.getId())){
                //一级菜单
                i = topLevel(roleCode,moduleCode);
                System.out.println("授予一级权限");
                break;
            }
            for (TreeNode n2: n.getChildren()) {
                if(moduleCode.equals(n2.getId())){
                    //二级菜单
                    i = secondLevel(roleCode,moduleCode);
                    System.out.println("授予二级权限");
                    break;
                }
                for (TreeNode n3:n2.getChildren()){
                    if(moduleCode.equals(n3.getId())){
                        //三级菜单
                        i = moduleDAO.insertRoleModule(roleCode, moduleCode);
                        System.out.println("授予三级权限");
                    }
                }
            }
        }
        return i;
    }

    //一级权限授权
    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public int topLevel(String roleCode, String moduleCode){
        //查询当前一级权限下所有的二级权限，以及所有二级权限下所有的三级权限
        List<String> mids = moduleDAO.listMidByTopId(moduleCode);
        int i = 0;
        for (String mid: mids) {
            i+=moduleDAO.insertRoleModule(roleCode, mid);
        }
        return i;
    }

    //二级权限授权
    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public int secondLevel(String roleCode, String moduleCode){
        //查询当前二级权限下所有的三级权限
        List<String> mids = moduleDAO.listMidBySecondId(moduleCode);
        int i = 0;
        for (String mid: mids) {
            i+=moduleDAO.insertRoleModule(roleCode, mid);
        }
        return i;
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public int revokePermission(String roleCode, String moduleCode) {
        return moduleDAO.deleteRoleModule(roleCode, moduleCode);
    }

    @Override
    public List<TreeNode> listTreeModules() {
        return moduleDAO.listTreeModules();
    }

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED)
    public boolean insertModule(String moduleId,String moduleCode,String moduleName,String moduleUrl) {
        return moduleDAO.insertModule(moduleId,moduleCode,moduleName,moduleUrl) > 0;
    }
}
