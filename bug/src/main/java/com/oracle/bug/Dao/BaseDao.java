package com.oracle.bug.Dao;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;

/**
 * Created by zgw25 on 2017/1/3.
 */
public class BaseDao {
    /*static String url = "jdbc:mysql://localhost:3306/cms?useUnicode=true&characterEncoding=utf-8";
    static String user = "root";
    static String password = "";*/
    private String jndiName = "java:comp/env/jdbc/mysql";
    private Connection conn;
    public Statement stat;
    public PreparedStatement pstat;
    public ResultSet rs ;

    public void getConnection() throws NamingException, SQLException {
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource) context.lookup(jndiName);
        conn = ds.getConnection();
    }

    public Statement getStatement() throws SQLException, ClassNotFoundException, IOException, NamingException {
        if (stat == null){
            if (conn == null){
                getConnection();
            }
            stat = conn.createStatement();
        }
        return stat;

    }
    public PreparedStatement getPreparedStatement(String sql) throws IOException, SQLException, ClassNotFoundException, NamingException {
        if (pstat == null){
            if (conn == null){
                getConnection();
            }
        }
        else {
            pstat.close();

        }
        pstat = conn.prepareStatement(sql);
        return pstat;


    }
    public void closeConnection()throws SQLException{
        if (rs != null) rs.close();
        if (stat != null) stat.close();
        if (pstat != null) pstat.close();
        if (conn != null) conn.close();
    }
}
