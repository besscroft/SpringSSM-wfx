package com.bess.util;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/8 10:50
 */
@ControllerAdvice
public class MyExceptionHandler {
    //@ExceptionHandler  将此方法定义为一个异常处理的方法
    // 可以处理某个具体的异常，也可以统一处理所有异常
    @ExceptionHandler(Exception.class)
    public String handleEx1(Exception e){
        e.printStackTrace();
        return "/error.jsp";
    }
}
