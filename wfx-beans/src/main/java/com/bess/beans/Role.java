package com.bess.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/9 12:31
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Role {
    private String roleCode;
    private String roleName;
    private String roleDesc;
    private int roleOrder;
    private int roleType;
}
