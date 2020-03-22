package com.oracle.bug.controller;

import com.oracle.bug.Dao.BugDao;
import com.oracle.bug.domain.BugBean;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by zgw25 on 2017/1/4.
 */
public class BugList extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int start = 0;
        Integer count = 6;
        /*int newCount = 0;
        if (count != null){
            newCount = count;
        }else {
            newCount = 5;
        }*/
        try {
            count = Integer.parseInt(request.getParameter("count"));
           start = Integer.parseInt(request.getParameter("start"));
        }catch (Exception e){
        }
        request.getSession().setAttribute("count",count);
        int total = new BugDao().getCount();
        int last;
        if (total%count ==0){
            last = total-count;
        }else {
            last = total-total%count;
        }
        int next = start+count;
        int pre = start-count;
        pre = (pre<0)?0:pre;
        next = (next>last)?last:next;
        request.getSession().setAttribute("last",last);
        request.getSession().setAttribute("next",next);
        request.getSession().setAttribute("pre",pre);
        List<BugBean> bugList = null;
        bugList = new BugDao().bugBeanList(start,count);

        request.getSession().setAttribute("bugList",bugList);
       //request.setAttribute("bugList",bugList);
        request.getRequestDispatcher("/bugList.jsp").forward(request,response);
    }
}
