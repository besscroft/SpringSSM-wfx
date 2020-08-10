package com.bess.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 9:37
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Module {
    private String moduleCode;
    private String moduleName;
    private String moduleUrl;
    private List<Module> moduleList;
}
