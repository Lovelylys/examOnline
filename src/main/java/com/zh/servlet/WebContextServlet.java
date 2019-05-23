package com.zh.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author abs
 * @Date 2019/3/14 - 16:42
 */
@WebServlet(urlPatterns = {},loadOnStartup = 1)
public class WebContextServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        String path = config.getServletContext().getContextPath();
        config.getServletContext().setAttribute("ctx",path);
        super.init(config);
    }
}
