<%-- 
    Document   : addbook
    Created on : March 17, 2019, 12:32:46 PM
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
<%@page import="java.util.Random"%>
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
        <h1 style="text-align: center;color: darkcyan;">New Book</h1>
        <form action="admincodecode/addbookcode.jsp" method="post">
            <div style="height:0px auto;width:30%;margin: 0px auto;">
            <table class="table">
                <%
                    Random rd=new Random();
                    int n=rd.nextInt(1000+1);
                %>
                <tr>
                    <td width="50%">Book ID</td>
                    <td><input type="number" name="bid" value="<%=n%>" required="" readonly=""/></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="bname" required=""/></td>
                </tr>
                <tr>
                    <td>Publisher</td>
                    <td><input type="text" name="publisher" required=""/></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price" required=""/></td>
                </tr>
                <tr>
                    <td>Pages</td>
                    <td><input type="text" name="pages" required=""/></td>
                </tr>
                <tr>
                    <td>No. Of Copies</td>
                    <td><input type="text" name="copies" required=""/></td>
                </tr>
                <tr>
                    <td style="text-align: right;"><input type="submit" value="Add"/></td>
                    <td><input type="button" onclick="window.location.href='adminhome.jsp'" value="Back"/></td>
                </tr>
            </table>
            </div>
        </form>
        <h1 style="text-align: center;color: darkcyan;">Book Details</h1>
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
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
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
