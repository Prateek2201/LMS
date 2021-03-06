<%-- 
    Document   : bookdetail
    Created on : May 6, 2019, 2:35:48 PM
    Author     : Prateek Agrahari
--%>
<%
    if(session.getAttribute("userid")==null)
    {
        response.sendRedirect("../login.jsp");
    }
    else
    {
%>
<%@page import="mypackage.ConnectDb"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="userstyle/genstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            td{
                padding-left: 50px;
            }
        </style>
    </head>
    <body>
        <div id="outer">
            <%@include file="usermaster/head.jsp" %>
        <div id="content">
        <h1 style="text-align: center;color: darkcyan;">Book Details</h1>
        <form action="search.jsp" method="post">
        <div style="height:0px auto;width:30%;margin: 0px auto;">
            <table class="table">
                <tr>
                    <th>Search By Name</th>
                    <td><input type="text" name="filter" required="" /></td>
                    <th><input type="submit" name="search" value="Search" /></th>
                </tr>
            </table>
            </div>
            </form>
        <div style="height:0px auto;width:80%;margin: 0px auto;">
        <table class="table">
            <tr>
                <th>Book_ID</th>
                <th>Book Name</th>
                <th>Available</th>
                <th>Publisher</th>
                <th>Price</th>
                <th>Pages</th>
                <th>No. Of Copies</th>
            </tr>
            <%
            String sql="select * from newbook";
            ConnectDb ob=new ConnectDb();
            ResultSet rs=ob.selectQuery(sql);
            while(rs.next())
            {
            %>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td style="font-weight: bold;color: red;"><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
            </tr>
            <%
            }
            %>
        </table>
        <button style="margin-left: 45%;color: white;background-color: black;" onclick="window.location.href='dashboard.jsp'">Home</button>
        </div>
        </div>
            <%@include file="usermaster/foot.jsp" %>
    </div>
    </body>
</html>
<%}%>
