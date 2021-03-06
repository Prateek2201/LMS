<%-- 
    Document   : feedbackmgmt
    Created on : May 22, 2019, 9:46:11 AM
    Author     : Prateek Agrahari
--%>

<%
    if(session.getAttribute("aid")==null)
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
        <link href="adminstyle/genstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            td{
                padding-left: 50px;
            }
        </style>
    </head>
    <body>
        <div id="outer">
            <%@include file="adminmaster/head.jsp" %>
        <div id="content">
        <h1 style="text-align: center;color: darkcyan;">Feedback Management</h1>
        <div style="height:0px auto;width:50%;margin: 0px auto;">
            <table class="table">
                <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>User Id</th>
                            <th>Feedback</th>
                            <th>Posted Date</th>
                            <th>Delete</th>
                        </tr>
                        <%
                            ConnectDb db=new ConnectDb();
                            ResultSet rs=db.selectQuery("select * from feedback");
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
                                <a href="admincode/deletefeedback.jsp?id=<%=rs.getInt(1)%>">delete</a>
                            </td>
                        </tr>
                        <%  }%>
            </table>
        <button style="margin-left: 45%;color: white;background-color: black;" onclick="window.location.href='adminhome.jsp'">Home</button>
        </div>
        </div>
        <%@include file="adminmaster/foot.jsp" %>
    </div>
    </body>
</html>
<%}%>