package com.bess.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 11:03
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ResultVO {
    private int code;
    private String flag;
    private Object data;
}
