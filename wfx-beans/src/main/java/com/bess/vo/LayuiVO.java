package com.bess.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/10 19:50
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class LayuiVO {
    private int code;
    private String msg;
    private int count;
    private List data;
}
