package com.bess.controller;

import com.bess.beans.Good;
import com.bess.service.GoodService;
import com.bess.vo.LayuiVO;
import com.bess.vo.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 0:16
 */
@Controller
@RequestMapping("/good")
public class GoodController {

    @Resource
    private GoodService goodService;

    @ResponseBody
    @RequestMapping("/list")
    public LayuiVO list(int page, int limit) {
        int count = goodService.getCount();
        List<Good> pageData = goodService.listGood(page, limit);
        LayuiVO vo = new LayuiVO(0, "success", count , pageData);
        return vo;
    }

    @ResponseBody
    @RequestMapping("/updateState")
    public ResultVO updateState(String goodId, String state) {
        boolean b = goodService.updateState(goodId, state);
        if (b) {
            return new ResultVO(0,"success",state);
        } else {
            return new ResultVO(1,"fail",null);
        }
    }

    @ResponseBody
    @RequestMapping("/updateToped")
    public ResultVO updateToped(String goodId, String toped) {
        boolean b = goodService.updateToped(goodId, toped);
        if (b) {
            return new ResultVO(0,"success",toped);
        } else {
            return new ResultVO(1,"fail",null);
        }
    }

    @ResponseBody
    @RequestMapping("/updateRecomed")
    public ResultVO updateRecomed(String goodId, String recomed) {
        boolean b = goodService.updateRecomed(goodId, recomed);
        if (b) {
            return new ResultVO(0,"success",recomed);
        } else {
            return new ResultVO(1,"fail",null);
        }
    }
}
