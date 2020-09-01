package com.bess.controller;

import com.bess.beans.GoodType;
import com.bess.service.GoodTypeService;
import com.bess.util.RandomId;
import com.bess.vo.LayuiVO;
import com.bess.vo.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 11:09
 */
@Controller
@RequestMapping("/goodtype")
public class GoodTypeController {

    @Resource
    private GoodTypeService goodTypeService;

    @ResponseBody
    @RequestMapping("/list")
    public LayuiVO listGoodType(int page, int limit) {
        int count = goodTypeService.getCount();
        List<GoodType> pageData = goodTypeService.listGoodType(page, limit);
        LayuiVO vo = new LayuiVO(0, "success", count , pageData);
        return vo;
    }

    @ResponseBody
    @RequestMapping("/update")
    public ResultVO updateGoodType(String typeId,String typeName) {
        boolean b = goodTypeService.updateGoodType(new GoodType(typeId, typeName, "", "", 0, ""));
        if (b) {
            GoodType goodType = goodTypeService.getGoodType(typeId);
            return new ResultVO(0,"修改成功",goodType);
        } else {
            return new ResultVO(1,"修改失败",null);
        }
    }

    @ResponseBody
    @RequestMapping("/add")
    public ResultVO insertGoodType(String typeName) {
        boolean b = goodTypeService.insertGoodType(new GoodType(RandomId.getNum(3), typeName, "", "", 0, ""));
        if (b) {
            return new ResultVO(0,"添加成功",null);
        } else {
            return new ResultVO(1,"添加失败",null);
        }
    }

    @ResponseBody
    @RequestMapping("/delete")
    public ResultVO deleteGoodType(String typeId) {
        boolean b = goodTypeService.deleteGoodType(typeId);
        if (b) {
            return new ResultVO(0,"删除成功",null);
        } else {
            return new ResultVO(1,"删除失败",null);
        }
    }
}
