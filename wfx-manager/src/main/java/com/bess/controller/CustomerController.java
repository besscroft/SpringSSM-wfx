package com.bess.controller;

import com.bess.beans.Customer;
import com.bess.service.CustomerService;
import com.bess.vo.LayuiVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/11 17:20
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Resource
    private CustomerService customerService;

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    @ResponseBody
    @RequestMapping("/list")
    public LayuiVO list(int page,int limit) {
        System.out.println(page);
        System.out.println(limit);
        int count = customerService.getCount();
        List<Customer> pageData = customerService.listCustomer(page, limit);
        LayuiVO vo = new LayuiVO(0, "success", count , pageData);
        return vo;
    }
}
