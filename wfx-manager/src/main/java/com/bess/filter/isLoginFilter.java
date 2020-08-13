package com.bess.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author Bess Croft
 * @DateTime 2020/8/13 19:42
 */
@WebFilter("/*")
public class isLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Access-Control-Allow-Origin","*");      //设置允许跨域
        response.setHeader("Access-Control-Allow-Methods","*");     //设置允许多种请求方式
        response.setHeader("Access-Control-Max-Age","3600");        //设置跨域缓存的最大时间
        response.setHeader("Access-Control-Allow-Headers","*");     //设置允许携带header
        response.setHeader("Access-Control-Allow-Credentials","*"); //设置允许携带cookie

        String requestURI = request.getRequestURI();
        if (requestURI.endsWith("/index.jsp") || requestURI.endsWith("/404.jsp")
                || requestURI.indexOf("/img/") != -1 || requestURI.indexOf("/css/") != -1
                || requestURI.indexOf("/fonts/") != -1 || requestURI.indexOf("/js/") != -1
                || requestURI.endsWith("/error.jsp") || requestURI.indexOf("/layui/") != -1
                || requestURI.endsWith("/user/login")
        ) {
            // 放行
        } else {
            Object users = request.getSession().getAttribute("user");
            if (users == null) {
                String uri = request.getRequestURI();
                System.out.println(uri);
                response.sendRedirect("index.jsp");
                return;
            }
        }
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
