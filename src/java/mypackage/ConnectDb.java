/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import static java.util.Date.parse;
import java.util.concurrent.TimeUnit;
/**
 *
 * @author Prateek Agrahari
 */
public class ConnectDb {
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    //Constructor
    public ConnectDb()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(ClassNotFoundException ex)
        {
           ex.printStackTrace(); 
        }
    }
    public Connection getCon()
    {
        try
        {
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lmsdb", "root", "");
        }
        catch(SQLException ex)
        {
            con=null;
        }
        return con;
    }
    public boolean executeNonQuery(String query)
    {
        try
        {
            ps=getCon().prepareStatement(query);
            ps.executeUpdate();
            return true;
        }
        catch(SQLException ex)
        {
            return false;
        }
    }
    public ResultSet selectQuery(String query)
    {
        try
        {
            ps=getCon().prepareStatement(query);
            rs=ps.executeQuery();
        }
        catch(SQLException ex)
        {
            rs=null;
        }
        return rs;
    }
    public String getDate()
    {
        java.util.Date d=new java.util.Date();
        String date= d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900);
        //SimpleDateFormat df=new SimpleDateFormat("dd/MM/yyyy");
        //String dt=String.format(df.format(new Date()), "dd-MM-yyyy");
        
        String dt=date;
        return dt;
    }
    public long getDueDate(String date) throws ParseException
    {
        java.util.Date d= new java.util.Date();
        java.util.Date issuedate= new SimpleDateFormat("dd/MM/yyyy").parse(date);
        long diffInMillies;
        diffInMillies = Math.abs(d.getTime()-issuedate.getTime());
        long diff;
        diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
        return diff;
    }
    public String getAlert(String msg,String pagename)
    {
        String str="<script>alert('"+msg+"');window.location.href='"+pagename+"';</script>";
        return str;
    }
}