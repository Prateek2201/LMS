<%-- 
    Document   : statistics
    Created on : May 7, 2019, 11:29:09 AM
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
    </head>
    <body>
        <div id="outer">
        <%@include file="adminmaster/head.jsp" %>
        <div id="content">
        <h1 style="text-align: center;color: darkcyan;">Issued Book Details</h1>
        <div style="height:0px auto;width:80%;margin: 0px auto;">
        <table class="table">
            <tr>
                <th>Student_ID</th>
                <th>Student Name</th>
                <th>Course</th>
                <th>Year</th>
                <th>Book_ID</th>
                <th>Book Name</th>
                <th>Available</th>
                <th>Publisher</th>
                <th>Issue_Date</th>
            </tr>
            <%
            String sql="select sid,sname,course,year,bid,bname,available,publisher,issuedate from issue";
            ConnectDb ob=new ConnectDb();
            ResultSet rs=ob.selectQuery(sql);
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
                <td><%=rs.getString(8)%></td>
                <td><%=rs.getString(9)%></td>
            </tr>
            <%
            }
            %>
        </table>
        </div>
        <h1 style="text-align: center;color: darkcyan;">Returned Book Details</h1>
        <div style="height:0px auto;width:80%;margin: 0px auto;">
        <table class="table">
            <tr>
                <th>Student_ID</th>
                <th>Student Name</th>
                <th>Course</th>
                <th>Year</th>
                <th>Book_ID</th>
                <th>Book Name</th>
                <th>Available</th>
                <th>Publisher</th>
                <th>Issue_Date</th>
                <th>Return_Date</th>
            </tr>
            <%
            String sql1="select sid,sname,course,year,bid,bname,available,publisher,issuedate,returndate from returnbook";
            ConnectDb ob1=new ConnectDb();
            ResultSet rs1=ob1.selectQuery(sql1);
            while(rs1.next())
            {
            %>
            <tr>
                <td><%=rs1.getString(1)%></td>
                <td><%=rs1.getString(2)%></td>
                <td><%=rs1.getString(3)%></td>
                <td><%=rs1.getString(4)%></td>
                <td><%=rs1.getString(5)%></td>
                <td><%=rs1.getString(6)%></td>
                <td><%=rs1.getString(7)%></td>
                <td><%=rs1.getString(8)%></td>
                <td><%=rs1.getString(9)%></td>
                <td><%=rs1.getString(10)%></td>
            </tr>
            <%
            }
            %>
        </table>
        </div>
        <button style="margin-top: 5px;margin-left: 48%;color: white;background-color: black;" onclick="window.location.href='adminhome.jsp'">Home</button>
        </div>
        <%@include file="adminmaster/foot.jsp" %>
        </div>
    </body>
</html>
<%}%>