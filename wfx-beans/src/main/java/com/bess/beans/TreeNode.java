package com.bess.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/12 17:29
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TreeNode {
    private String title;
    private String id;
    private String field;
    private boolean checked;
    private boolean spread;
    private List<TreeNode> children;
}
