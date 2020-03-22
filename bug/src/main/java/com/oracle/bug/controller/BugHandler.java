package com.oracle.bug.controller;

import com.oracle.bug.Dao.BugDao;
import com.oracle.bug.domain.BugBean;
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
 * Created by zgw25 on 2017/1/6.
 */
public class BugHandler extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("bugid"));
        String method = request.getParameter("method");
        PrintWriter out = response.getWriter();
        System.out.println(id+" "+method);
        if (!StringUtils.isNullOrNot(method)){
            if ("delete".equals(method)){
                try {
                    new BugDao().deleteById(id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                response.sendRedirect("/bugList");
            }
            if ("modify".equals(method)){
                try {
                    BugBean bug = new BugDao().getBugById(id);
                    request.setAttribute("modifyBug",bug);
                    request.getRequestDispatcher("/modifyBug.jsp").forward(request,response);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (NamingException e) {
                    e.printStackTrace();
                }
            }
            if ("update".equals(method)){
                try {
                    String status = request.getParameter("status");
                    String level = request.getParameter("level");
                    int worktime = Integer.parseInt(request.getParameter("workTime"));
                    String taskName = request.getParameter("taskName");
                    System.out.println(request.getParameter("testdate")+" "+request.getParameter("deadtime"));
                    java.sql.Timestamp testDate = DateUtils.getSqlDate(request.getParameter("testdate"));
                    java.sql.Timestamp deadDate = DateUtils.getSqlDate(request.getParameter("deadtime"));
                    System.out.println(status+" "+level+" "+worktime+" "+taskName+" "+testDate+" "+deadDate+" "+id);
                    if (StringUtils.isNullOrNot(status,level,worktime,taskName,testDate,deadDate)){
                        out.print("-1");
                    }else {
                        new BugDao().updateById("update bug set status=?,level=?,worktime=?,taskName=?,testDate=?,deadDate=? where id=?", status, level, worktime, taskName, testDate, deadDate, id);
                        out.print("1");
                        request.getRequestDispatcher("/bugList").forward(request,response);
                    }

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
