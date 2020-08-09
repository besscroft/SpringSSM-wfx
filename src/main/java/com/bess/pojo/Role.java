package com.bess.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.stereotype.Component;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/9 12:31
 */
@Component
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
