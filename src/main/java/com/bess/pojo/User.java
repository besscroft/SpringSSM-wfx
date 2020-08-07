package com.bess.pojo;

import lombok.*;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/7 18:04
 */
@Component
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String userId;
    private String userName;
    private String account;
    private String userPwd;
    private String remark;
    private String userType;
    private String enabled;
    private Date loginTime;
    private String roleId;
    private String self;
}
