<%-- 
    Document   : reviewmgmt
    Created on : May 22, 2019, 10:06:28 AM
    Author     : Prateek Agrahari
--%>

<%@page import="java.util.Date"%>
<%
    if(session.getAttribute("aid")==null)
    {
        response.sendRedirect("../login.jsp");
    }
    else
    {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="adminstyle/genstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            td{
                padding-left: 10px;
            }
        </style>
    </head>
    <body>
        <div id="outer">
        <%@include file="adminmaster/head.jsp" %>
        <div id="content">
        <h1 style="text-align: center;color: darkcyan;">Review Management</h1>
        <div style="height:0px auto;width:80%;margin: 0px auto;">
        <table class="table">
            <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Review</th>
                            <th>Rating</th>
                            <th>Posted Date</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            ConnectDb db=new ConnectDb();
                            ResultSet rs=db.selectQuery("select * from review");
                            while(rs.next())
                            {
                        %>
                        <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td>
                                <a href="admincode/deletereview.jsp?id=<%=rs.getInt(1)%>">delete</a>
                            </td>
                        </tr>
                        <%}%>
        </table>
        <button style="margin-top: 5px;margin-left: 45%;color: white;background-color: black;" onclick="window.location.href='adminhome.jsp'">Home</button>
        </div>
        </div>
        <%@include file="adminmaster/foot.jsp" %>
        </div>
    </body>
</html>
<%}%>
