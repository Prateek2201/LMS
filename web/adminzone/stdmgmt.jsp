<%-- 
    Document   : stdmgmt
    Created on : May 9, 2019, 10:36:48 PM
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
<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>
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
                padding-left: 10px;
            }
        </style>
    </head>
    <body>
        <div id="outer">
        <%@include file="adminmaster/head.jsp" %>
        <div id="content">
        <h1 style="text-align: center;color: darkcyan;">Student Details</h1>
        <form action="searchstd.jsp" method="post">
        <div style="height:0px auto;width:60%;margin: 0px auto;">
            <table class="table">
                <tr>
                    <th>Search By Class</th>
                    <th>Branch</th>
                    <th><input type="text" name="branch" required="" /></th>
                    <th>Year</th>
                    <th><input type="text" name="year" required="" /></th>
                    <th><input type="submit" name="Search" value="Search" /></th>
                </tr>
            </table>
        </div>
        </form>
        <div style="height:0px auto;width:80%;margin: 0px auto;">
        <table class="table">
            <tr>
                <th>Registration No.</th>
                <th>Email_ID</th>
                <th>Password</th>
                <th>Name</th>
                <th>Father's Name</th>
                <th>Course</th>
                <th>Branch</th>
                <th>Year</th>
                <th>Semester</th>
                <th>Contact No.</th>
                <th>Address</th>
                <th>Pic</th>
            </tr>
            <%
            String sql="select * from student";
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
                <td><%=rs.getString(10)%></td>
                <td><%=rs.getString(11)%></td>
                <td><img src="<%=request.getContextPath()+"/upload/"+rs.getString(14) %>" height="50" width="50"/></td>
                <td><a href="updateprofile.jsp?sid=<%=rs.getString(1)%>">edit</a></td>
<!--                <td><a href="admincode/deleteprofile.jsp?sid=<%=rs.getString(1)%>">delete</a></td>-->
            </tr>
            <%
            }
            %>
        </table>
        </div>
        </div>
        <%@include file="adminmaster/foot.jsp" %>
        </div>
    </body>
</html>
<%}%>