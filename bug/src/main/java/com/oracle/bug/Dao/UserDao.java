package com.oracle.bug.Dao;

import com.oracle.bug.domain.UserBean;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zgw25 on 2017/1/3.
 */
public class UserDao extends BaseDao {
    public UserBean getUser(String username,String password) throws SQLException, IOException, ClassNotFoundException, NamingException {
        String sql = "select * from user where username = ? and password = ?";
        PreparedStatement pstat = getPreparedStatement(sql);
        pstat.setString(1,username);
        pstat.setString(2,password);
        /*ResultSet rs = pstat.executeQuery();
        while (rs.next()){
            UserBean user =new UserBean();
            user.setUsername(rs.getString(2));
            user.setPassword(rs.getString(3));
            return user;
        }*/
        try{
            ResultSet rs = pstat.executeQuery();
            while (rs.next()){
                UserBean user =new UserBean();
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                return user;
            }
        }catch (Exception e){
            return null;
        }finally {
            closeConnection();
        }
        return null;
    }
    public void addUser(Object...objects) throws ClassNotFoundException, SQLException, NamingException, IOException {
        String sql = "insert into user(username,password) values(?,?)";
        PreparedStatement pstat = getPreparedStatement(sql);
        for (int i = 0; i <objects.length ; i++) {
            pstat.setObject(i+1,objects[i]);
        }
        pstat.executeUpdate();
        closeConnection();
    }
    public List<UserBean> userList() throws ClassNotFoundException, SQLException, NamingException, IOException {
        List<UserBean> userList = new ArrayList<>();
        String sql = "select * from user";
        PreparedStatement pstat = getPreparedStatement(sql);
        ResultSet rs = pstat.executeQuery();
        while (rs.next()){
            UserBean user = new UserBean();
            user.setUsername(rs.getString(2));
            user.setPassword(rs.getString(3));
            userList.add(user);
        }
        closeConnection();
        return userList;
    }
    public boolean isExist(String username) throws ClassNotFoundException, SQLException, IOException, NamingException {
       List<UserBean> userList = userList();
        for (UserBean user:userList) {
            if (username.equals(user.getUsername())){
                return true;
            }
        }
        return false;
    }
}
