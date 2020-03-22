package com.oracle.bug.controller;

import com.oracle.bug.domain.UserBean;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zgw25 on 2017/1/9.
 */
public class LoginFilter implements Filter {
    @Override
    public void destroy() {

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String uri = request.getRequestURI();
        if (uri.endsWith("login.jsp") || uri.endsWith("login") || uri.endsWith("register.jsp") || uri.endsWith("register")) {
            filterChain.doFilter(request, response);
            return;
        } else {
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("/login.jsp");
                return;
            }
        }
        filterChain.doFilter(request,response);
    }
}


