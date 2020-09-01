package com.bess.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 0:07
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Good {
    private String goodId;
    private String goodName;
    private String customerId;
    private String goodPic1;
    private String goodPic2;
    private String goodPic3;
    private String promoteDesc;
    private String copyIds;
    private String copyDesc;
    private String forwardLink;
    private int orderNo;
    private GoodType goodType;
    private String tags;
    private int state;
    private Date createTime;
    private int toped;
    private int recomed;
    private Date topedTime;
    private Date recomedTime;
    private String spcId;
    private String zonId;
    private int sellNum;
    private String website;
    private String kfqq;
}