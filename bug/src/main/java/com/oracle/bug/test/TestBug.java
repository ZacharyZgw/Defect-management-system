package com.oracle.bug.test;

import com.oracle.bug.Dao.BugDao;
import com.oracle.bug.domain.BugBean;
import com.oracle.bug.utils.DateUtils;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by zgw25 on 2017/1/4.
 */
public class TestBug {
    public static void main(String[] args) throws SQLException, IOException, ClassNotFoundException, NamingException {
        System.out.println(DateUtils.getSqlDate("2017-1-2 12:12:12"));

    }
}
