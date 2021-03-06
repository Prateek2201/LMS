<%-- 
    Document   : return
    Created on : Mar 18, 2019, 10:19:17 PM
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
<%@page import="java.sql.ResultSet"%>
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
         <style>
             .space{
                 padding-left: 100px;
             }
         </style>
    </head>
    <body>
        <div id="outer">
            <%@include file="usermaster/head.jsp" %>
        <div id="content">
        <h1 style="text-align: center;color: darkcyan;">Return Book</h1>
        <form action="usercode/returncode.jsp" method="post">
            <fieldset style="width: 50%;margin: 0px auto;">
            <table class="table">
                <legend style="font-size: 25px;color: royalblue">Return Book</legend>
                    <%
                        String bid=request.getParameter("bid");
                        String sql="select * from issue where bid='"+bid+"'";
                        ConnectDb ob=new ConnectDb();
                        ResultSet rs=ob.selectQuery(sql);
                        if(rs.next())
                        {
                    %>
                    <tr>
                        <td>Student ID</td>
                        <td><input type="text" name="sid" value="<%=rs.getString(7)%>"/></td>
                        <td>Book ID</td>
                        <td><input type="text" name="bid" value="<%=rs.getString(1)%>"/></td>
                    </tr>
                    <tr>
                        <td>Student Name</td>
                        <td><input type="text" name="sname" value="<%=rs.getString(8)%>" readonly=""/></td>
                        <td>Book Name</td>
                        <td><input type="text" name="bname" value="<%=rs.getString(2)%>" readonly=""/></td>
                    </tr>
                    <tr>
                        <td>Father's Name</td>
                        <td><input type="text" name="fname" value="<%=rs.getString(9)%>" readonly=""/></td>
                        <td>Available</td>
                        <td><input type="text" name="available" value="<%=rs.getString(3)%>" readonly=""/></td>
                    </tr>
                    <tr>
                        <td>Course</td>
                        <td><input type="text" name="course" value="<%=rs.getString(10)%>" readonly=""/></td>
                        <td>Publisher</td>
                        <td><input type="text" name="publisher" value="<%=rs.getString(4)%>" readonly=""/></td>
                    </tr>
                    <tr>
                        <td>Branch</td>
                        <td><input type="text" name="branch" value="<%=rs.getString(11)%>" readonly=""/></td>
                        <td>Price</td>
                        <td><input type="text" name="price" value="<%=rs.getString(5)%>" readonly=""/></td>
                    </tr>
                    <tr>
                    <td>Year</td>
                    <td><input type="text" name="year" value="<%=rs.getString(12)%>" readonly=""/></td>
                    <td>Pages</td>
                    <td><input type="text" name="pages" value="<%=rs.getString(6)%>" readonly=""/></td>
                </tr>
                <tr>
                    <td>Semester</td>
                    <td><input type="text" name="semester" value="<%=rs.getString(13)%>" readonly=""/></td>
                    <td>Date of Issue</td>
                    <td><input type="text" name="doi" value="<%=rs.getString(14)%>" readonly=""/></td>
                </tr>
                <%
                    }
                %>
                <%
                    ConnectDb ob1=new ConnectDb();
                    String dor=ob1.getDate();
                    int diff=Integer.parseInt(request.getParameter("diff"));
                    if(diff>15)
                    {
                        int d=diff-15;
                        if(d<=5){
                        out.print("<script>alert('You have to pay fine worth Rs.5/- for late submittion of book after "+d+" days');</script>");
                        }
                        else{
                            out.print("<script>alert('You have to pay fine worth Rs.10/- for late submittion of book after "+d+" days');</script>");
                        }
                    }
                %>
                <tr>
                    <td>Due Date</td>
                    <td><input type="text" name="dor" value="<%=diff%>" readonly=""/></td>
                    <td>No. Of Copies</td>
                    <%
                        String query="select copies from newbook where bid='"+bid+"'";
                        ConnectDb ob2=new ConnectDb();
                        ResultSet rs2=ob2.selectQuery(query);
                        while(rs2.next())
                        {
                    %>
                    <td><input type="text" name="copies" value="<%=rs2.getString(1)%>" /></td>
                    <%}%>
                </tr>
                <tr>
                    <td></td>  
                    <td style="text-align: center;font-size: 20px;">Date of Return</td>
                    <td><input type="text" name="dor" value="<%=dor%>" readonly=""/></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2"><input style="margin-left: 120px;" type="submit" name="return" value="Return"/>
                        <input type="submit" name="back" value="Back"/></td>
                    <td></td>
                </tr>
            </table>
            </fieldset>
        </form>
        </div>
                <%@include file="usermaster/foot.jsp" %>
    </div>
    </body>
</html>
<%}%>