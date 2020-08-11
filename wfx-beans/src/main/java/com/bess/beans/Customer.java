package com.bess.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/11 16:55
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Customer {
    private String customerId;
    private String customerName;
    private String qq;
    private String wxh;
    private String phone;
    private Date createTime;
    private String loginName;
    private String loginPwd;
    private int state;
    private int level;
    private double accBalance;
    private Date updateTime;
    private String website;
}
