package com.bess.service;

import com.bess.beans.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/11 17:16
 */
public interface CustomerService {
    public int getCount();  // 查询商户的总数量
    public List<Customer> listCustomer(int page,int limit);   // 查询所有商户信息（分页）
}
