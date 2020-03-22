package com.oracle.bug.controller;

import com.oracle.bug.Dao.BugDao;
import com.oracle.bug.utils.DateUtils;
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
 * Created by zgw25 on 2017/1/5.
 */
public class AddBug extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status");
        String level = request.getParameter("level");
        int workTime = Integer.parseInt(request.getParameter("workTime"));
        String taskName = request.getParameter("taskName");
        String testdate = request.getParameter("testdate");
        java.sql.Timestamp testDate = DateUtils.getSqlDate(request.getParameter("testdate"));
        java.sql.Timestamp deadTime = DateUtils.getSqlDate(request.getParameter("deadtime"));
        /*System.out.println(status);
        System.out.println(level);
        System.out.println(workTime);
        System.out.println(taskName);
        System.out.println(testDate);
        System.out.println(deadTime);*/
        PrintWriter out = response.getWriter();
        if (StringUtils.isNullOrNot(status,level,workTime,taskName,testDate,deadTime)){
            out.print("-1");//数据为空
        }else{
            try {
                new BugDao().addBug(status,level,workTime,taskName,testDate,deadTime);
                out.print("1");//插入成功
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
