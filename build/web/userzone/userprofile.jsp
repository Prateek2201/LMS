<%-- 
    Document   : userprofile
    Created on : May 7, 2019, 3:10:13 PM
    Author     : Prateek Agrahari
--%>

<%@page import="java.sql.ResultSet"%>
<%
    if(session.getAttribute("userid")==null)
    {
        response.sendRedirect("../login.jsp");
    }
    else
    {
%>
<%@page import="mypackage.ConnectDb"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="userstyle/genstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="outer">
            <%@include file="usermaster/head.jsp" %>
        <div id="content">
            <h1 style="text-align: center;color: darkcyan;">Student Profile</h1>
            <div style="height:0px auto;width:50%;margin: 0px auto;">
            <table class="table">  
            <%
                String sid=(String)session.getAttribute("userid");
                String sql="select * from student where sid='"+sid+"'";
                ConnectDb ob=new ConnectDb();
                ResultSet rs=ob.selectQuery(sql);
                if(rs.next())
                {
            %>
            <tr>
                <th>Registration No.</th>
                <td><%=rs.getString(1)%></td>
                <td rowspan="11" style="width: 300px;"><img style="padding-left: 25px;" src="<%=request.getContextPath()+"/upload/"+rs.getString("pic") %>" height="250" width="250"/></td>
            </tr>
            <tr>
                <th>Email_ID</th>
                <td><%=rs.getString(2)%></td>
            </tr>
            <tr>
                <th>Password</th>
                <td><%=rs.getString(3)%></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><%=rs.getString(4)%></td>
            </tr>
            <tr>
                <th>Father's Name</th>
                <td><%=rs.getString(5)%></td>
            </tr>
            <tr>
                <th>Course</th>
                <td><%=rs.getString(6)%></td>
            </tr>
            <tr>
                <th>Branch</th>
                <td><%=rs.getString(7)%></td>
            </tr>
            <tr>
                <th>Year</th>
                <td><%=rs.getString(8)%></td>
            </tr>
            <tr>
                <th>Semester</th>
                <td><%=rs.getString(9)%></td>
            </tr>
            <tr>
                <th>Contact No.</th>
                <td><%=rs.getString(10)%></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><%=rs.getString(11)%></td>
            </tr>
            <%
            }
            %>
        </table>
        <button style="margin-top: 5px;margin-left: 48%;color: white;background-color: black;" onclick="window.location.href='dashboard.jsp'">Home</button>
        </div>
        </div>
        </div>
        <%@include file="usermaster/foot.jsp" %>
    </body>
</html>
<%}%>