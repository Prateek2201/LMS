<%-- 
    Document   : statistics
    Created on : May 1, 2019, 1:41:07 PM
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="userstyle/genstyle.css" rel="stylesheet" type="text/css"/>
         <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            td{
                padding-left: 10px;
            }
        </style>
    </head>
    <body>
        <div id="outer">
            <%@include file="usermaster/head.jsp" %>
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
                <th>Due Date</th>
            </tr>
            <%
                String sid=(String)session.getAttribute("userid");
                System.out.println(sid);
                try
                {
            String sql="select sid,sname,course,year,bid,bname,available,publisher,issuedate from issue where sid='"+sid+"'";
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
                <%
                    ConnectDb ob1=new ConnectDb();
                    long diff=ob1.getDueDate(rs.getString(9));
                %>
                
                <td><%=diff%></td>
                <td><a href="return.jsp?bid=<%=rs.getString(5)%>&diff=<%=diff%>">return</a></td>
            </tr>
            <%
            }
            }
            catch(Exception e)
            {
                System.out.println(sid);
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