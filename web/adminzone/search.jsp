<%-- 
    Document   : search
    Created on : May 21, 2019, 3:42:26 PM
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
        <h1 style="text-align: center;color: darkcyan;">Book Details</h1>
            <%
                    String search=request.getParameter("search");
                    String filter=request.getParameter("filter");
                    if(search!=null)
                    {
                        String query="select * from newbook where name='"+filter+"'";
                        ConnectDb ob=new ConnectDb();
                        ResultSet rs=ob.selectQuery(query);
            %>
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
                        while(rs.next())
                        {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                </tr>
                <%      }
                    }
                    else{
                        System.out.println(search);
                    }
                %>
        </table>
            </div>
        <button style="margin-left: 45%;color: white;background-color: black;" onclick="window.location.href='bookdetails.jsp'">Back</button>
        </div>
        <%@include file="adminmaster/foot.jsp" %>
    </div>
    </body>
</html>
<%}%>
