package com.oracle.bug.controller;

import com.oracle.bug.Dao.BugDao;
import com.oracle.bug.Dao.UserDao;
import com.oracle.bug.utils.StringUtils;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by zgw25 on 2017/1/10.
 */
public class Register extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String password2 = request.getParameter("password2").trim();
        String isagree = request.getParameter("isagree").trim();
        PrintWriter out = response.getWriter();
        if (!(password.equals(password2))){
            out.print("-1");
        }
        if (!StringUtils.isNullOrNot(isagree) && !StringUtils.isNullOrNot(username)){
            boolean isExist = false;
            try {
                isExist = new UserDao().isExist(username);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (NamingException e) {
                e.printStackTrace();
            }
            if (isExist == false){
                try {
                    new UserDao().addUser(username,password);
                    out.print("1");
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (NamingException e) {
                    e.printStackTrace();
                }
            }
        }

    }
}
