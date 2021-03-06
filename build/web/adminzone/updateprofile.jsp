<%-- 
    Document   : updateprofile
    Created on : May 7, 2019, 3:55:09 PM
    Author     : Prateek Agrahari
--%>

<%@page import="java.sql.ResultSet"%>
<%
    if(session.getAttribute("aid")==null)
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
        <link href="adminstyle/genstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            input{
                width: 400px;
            }
        </style>
    </head>
    <body>
        <div id="outer">
            <%@include file="adminmaster/head.jsp" %>
        <div id="content">
            <h1 style="text-align: center;color: darkcyan;">Update Profile</h1>
                <form action="admincode/profilecode.jsp" method="post">
                    <div style="height:0px auto;width:50%;margin: 0px auto;">
                    <table class="table">
                <%
                String sid=request.getParameter("sid");
                String sql="select * from student where sid='"+sid+"'";
                ConnectDb ob=new ConnectDb();
                ResultSet rs=ob.selectQuery(sql);
                if(rs.next())
                {
            %>
            <tr>
                <th>Registration No.</th>
                <td><input type="text" name="sid" value="<%=rs.getString(1)%>" readonly="" /></td>
                <td rowspan="11" style="width: 300px;"><img style="padding: 20px;" src="<%=request.getContextPath()+"/upload/"+rs.getString("pic") %>" height="250" width="250"/></td>
            </tr>
            <tr>
                <th>Email_ID</th>
                <td><input type="text" name="email" value="<%=rs.getString(2)%>" /></td>
            </tr>
            <tr>
                <th>Password</th>
                <td><input type="text" name="password" value="<%=rs.getString(3)%>" readonly="" /></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><input type="text" name="sname" value="<%=rs.getString(4)%>" /></td>
            </tr>
            <tr>
                <th>Father's Name</th>
                <td><input type="text" name="fname" value="<%=rs.getString(5)%>" /></td>
            </tr>
            <tr>
                <th>Course</th>
                <td><input type="text" name="course" value="<%=rs.getString(6)%>" /></td>
            </tr>
            <tr>
                <th>Branch</th>
                <td><input type="text" name="branch" value="<%=rs.getString(7)%>" /></td>
            </tr>
            <tr>
                <th>Year</th>
                <td><input type="text" name="year" value="<%=rs.getString(8)%>" /></td>
            </tr>
            <tr>
                <th>Semester</th>
                <td><input type="text" name="semester" value="<%=rs.getString(9)%>" /></td>
            </tr>
            <tr>
                <th>Contact No.</th>
                <td><input type="text" name="mobno" value="<%=rs.getString(10)%>" /></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><input type="text" name="address" value="<%=rs.getString(11)%>" /></td>
            </tr>
            <%
            }
            %>
            </table>
            <input type="submit" value="Update" style="margin-left: 45%;color: white;background-color: black;width: auto;" />
            <input type="button" value="Back" onclick="window.location.href='stdmgmt.jsp'" style="color: white;background-color: black;width: auto;" />
                    </div>
            </form>
        </div>
        <%@include file="adminmaster/foot.jsp" %>
        </div>
    </body>
</html>
<%}%>