package com.bess.controller;

import com.bess.beans.Customer;
import com.bess.service.CustomerService;
import com.bess.util.RandomId;
import com.bess.vo.LayuiVO;
import com.bess.vo.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/13 14:15
 */
@Controller
@RequestMapping("/merchant")
public class MerchantController {
    @Resource
    private CustomerService customerService;

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    @ResponseBody
    @RequestMapping("/list")
    public LayuiVO list(int page, int limit) {
        System.out.println(page);
        System.out.println(limit);
        int count = customerService.getCount();
        List<Customer> pageData = customerService.listCustomer(page, limit);
        LayuiVO vo = new LayuiVO(0, "success", count , pageData);
        return vo;
    }

    @ResponseBody
    @RequestMapping("/update")
    public ResultVO updateCustomer(@RequestBody Customer customer) {
        boolean b = customerService.updateCustomer(customer);
        ResultVO vo;
        if (b) {
            vo = new ResultVO(0,"更新成功！",customer);
        } else {
            vo = new ResultVO(1,"更新失败！",null);
        }
        return vo;
    }

    @ResponseBody
    @RequestMapping("/add")
    public ResultVO insertCustomer(@RequestBody Customer customer) {
        customer.setCustomerId(RandomId.getNum(8));
        customer.setLoginPwd("666666");
        customer.setCreateTime(new Date());
        customer.setState(0);
        customer.setLevel(0);
        customer.setAccBalance(0);
        customer.setUpdateTime(new Date());
        customer.setWebsite("baidu.com");
        boolean b = customerService.insertCustomer(customer);
        ResultVO vo;
        if (b) {
            vo = new ResultVO(0,"添加成功！",customer);
        } else {
            vo = new ResultVO(1,"添加失败！",null);
        }
        return vo;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public ResultVO deleteCustomer(String customerId) {
        boolean b = customerService.deleteCustomer(customerId);
        ResultVO vo;
        if (b) {
            vo = new ResultVO(0,"删除成功！",null);
        } else {
            vo = new ResultVO(1,"删除失败！",null);
        }
        return vo;
    }
}
