package com.bess.service.impl;

import com.bess.beans.Customer;
import com.bess.dao.CustomerDAO;
import com.bess.service.CustomerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/11 17:18
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerDAO customerDAO;

    public void setCustomerDAO(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    @Override
    public int getCount() {
        return customerDAO.getCount();
    }

    @Override
    public List<Customer> listCustomer(int page, int limit) {
        int start = (page-1)*limit;
        return customerDAO.listCustomer(start,limit);
    }
}
