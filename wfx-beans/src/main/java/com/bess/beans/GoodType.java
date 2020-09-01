package com.bess.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author Bess Croft
 * @DateTime 2020/9/1 0:08
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GoodType {
    private String typeId;
    private String typeName;
    private String parentId;
    private String typeTag;
    private int orderNo;
    private String alisaCode;
}