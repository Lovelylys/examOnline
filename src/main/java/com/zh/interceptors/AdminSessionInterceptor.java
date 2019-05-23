package com.zh.interceptors;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author abs
 * @Date 2019/3/15 - 19:55
 */
public class AdminSessionInterceptor implements HandlerInterceptor {
    private static final Logger log = Logger.getLogger(AdminSessionInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Object o = request.getSession().getAttribute("adminName");
        if(o == null)
        {
            log.warn("您没有登陆，请登录");
            response.sendRedirect(request.getContextPath() + "/admin/toLogin.action");
            return true;
        }else
        {
            return true;
        }

    }
}
