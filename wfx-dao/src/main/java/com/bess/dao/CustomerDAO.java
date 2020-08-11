package com.bess.dao;

import com.bess.beans.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/11 17:03
 */
public interface CustomerDAO {
    public int getCount();  // 查询商户的总数量
    public List<Customer> listCustomer(@Param("start") int start,
                                       @Param("limit") int limit);   // 查询所有商户信息（分页）
}
