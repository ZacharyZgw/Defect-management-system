package com.oracle.bug.controller;

import com.oracle.bug.Dao.UserDao;
import com.oracle.bug.domain.UserBean;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by zgw25 on 2017/1/3.
 */
public class Login extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        System.out.println(username);
        System.out.println(password);
        PrintWriter out = response.getWriter();
        UserBean user = null;
        try {
            user = new UserDao().getUser(username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }
        if (user == null){
            out.print("-1");//用户未找到
        }else if ((username.equals(user.getUsername())&&(!password.equals(user.getPassword())))||((password.equals(user.getPassword())&&(!username.equals(user.getUsername())))) ){
            out.print("-2");
        }else if (user != null){
            out.print("1");
            request.getSession().setAttribute("user",user);
        }else{
            response.sendRedirect("/login.jsp");
        }

    }
}
