package com.oracle.bug.Dao;

import com.oracle.bug.domain.BugBean;
import com.oracle.bug.utils.DateUtils;

import javax.naming.NamingException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zgw25 on 2017/1/4.
 */
public class BugDao extends BaseDao {
    public List<BugBean> bugList() throws SQLException, IOException, ClassNotFoundException, NamingException {
        List<BugBean> bugList = new ArrayList<>();
        String sql = "select * from bug";
        PreparedStatement pstat = getPreparedStatement(sql);
        ResultSet rs = pstat.executeQuery();
        while(rs.next()){
            BugBean bugBean = new BugBean();
            bugBean.setId(rs.getInt(1));
            bugBean.setStatus(rs.getString(2));
            bugBean.setLevel(rs.getString(3));
            bugBean.setWorktime(rs.getInt(4));
            bugBean.setTaskName(rs.getString(5));
            bugBean.setTestDate(DateUtils.getFormatTime(rs.getTimestamp(6)));
            bugBean.setDeadDate(DateUtils.getFormatTime(rs.getTimestamp(7)));
            bugList.add(bugBean);
        }
        this.closeConnection();
        return bugList;
    }
    public void deleteById(int id) throws SQLException {
        String sql = "delete from bug where id = ?";
        try {
            PreparedStatement pstat = getPreparedStatement(sql);
            pstat.setInt(1,id);
            pstat.execute();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }finally {
            closeConnection();
        }

    }
    public void addBug(Object...object) throws ClassNotFoundException, SQLException, NamingException, IOException {
        String sql = "insert into bug(status,level,worktime,taskName,testDate,deadDate) values(?,?,?,?,?,?)";
        PreparedStatement pstat = getPreparedStatement(sql);
        for (int i = 0; i <object.length ; i++) {
            pstat.setObject(i+1,object[i]);
        }
        pstat.executeUpdate();
        closeConnection();
    }
    /*public void addBug(BugBean bugBean) throws SQLException {
        String sql = "insert into bug values(?,?,?,?,?,?)";
        try {
            PreparedStatement pstat = getPreparedStatement(sql);
            pstat.setString(1,bugBean.getStatus());
            pstat.setString(2,bugBean.getLevel());
            pstat.setInt(3,bugBean.getWorktime());
            pstat.setString(4,bugBean.getTaskName());
            pstat.setString(5,bugBean.getTestDate());
            pstat.setString(6,bugBean.getDeadDate());
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }finally {
            closeConnection();
        }
    }*/
    public BugBean getBugById(int id) throws ClassNotFoundException, SQLException, NamingException, IOException {
        List<BugBean> bugList = bugList();
        for (BugBean bug: bugList ) {
            if (bug.getId() == id){
                return bug;
            }
        }
        return null;
    }
    public void updateById(String sql,Object...objects) throws ClassNotFoundException, SQLException, NamingException, IOException {
        PreparedStatement pstat = getPreparedStatement(sql);
        for (int i = 0; i <objects.length ; i++) {
            pstat.setObject(i+1,objects[i]);
        }
        pstat.executeUpdate();
        closeConnection();
    }
    public void UpdateBugByBean(BugBean bugBean){
        String sql = "update bug set status = ?,level = ?,worktime = ?,taskName = ?,testDate = ?,deadDate = ?where id = ?";
        try {
            PreparedStatement pstat = getPreparedStatement(sql);
            pstat.setString(1,bugBean.getStatus());
            pstat.setString(2,bugBean.getLevel());
            pstat.setInt(3,bugBean.getWorktime());
            pstat.setString(4,bugBean.getTaskName());
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }

    }
    public int getCount(){
        int count = 0;
        String sql = "select count(*) from bug";
        try {
            PreparedStatement pstat = getPreparedStatement(sql);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }finally {
            try {
                closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println(count);
        return count;

    }
    public List<BugBean> bugBeanList(int start,int count){
        List<BugBean> bugBeanList = new ArrayList<>();
        String sql = "select * from bug order by id asc limit ?,?";
        try {
            PreparedStatement pstat = getPreparedStatement(sql);
            pstat.setInt(1,start);
            pstat.setInt(2,count);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()){
                BugBean bug = new BugBean();
                bug.setId(rs.getInt(1));
                bug.setStatus(rs.getString(2));
                bug.setLevel(rs.getString(3));
                bug.setWorktime(rs.getInt(4));
                bug.setTaskName(rs.getString(5));
                bug.setTestDate(DateUtils.getFormatTime(rs.getTimestamp(6)));
                bug.setDeadDate(DateUtils.getFormatTime(rs.getTimestamp(7)));
                bugBeanList.add(bug);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        }finally {
            try {
                closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bugBeanList;
    }
}
