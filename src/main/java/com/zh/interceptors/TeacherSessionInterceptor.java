package com.zh.interceptors;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author abs
 * @Date 2019/3/15 - 19:55
 */
public class TeacherSessionInterceptor implements HandlerInterceptor {
    private static final Logger log = Logger.getLogger(TeacherSessionInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Object o = request.getSession().getAttribute("teacherName");
        if(o == null)
        {
            log.warn("教师没有登陆，请登录");
            response.sendRedirect(request.getContextPath() + "/teacher/toLogin.action");
            return false;
        }else
        {
            return true;
        }

    }
}
