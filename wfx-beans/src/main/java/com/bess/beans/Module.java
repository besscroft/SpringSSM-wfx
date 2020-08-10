package com.bess.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 9:37
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Module {
    private String moduleId;
    private String moduleCode;
    private String moduleName;
    private String linkUrl;
    private int moduleOrder;
    private String parentModule;
    private String moduleDesc;
    private String expanded;
    private String leaf;
}
