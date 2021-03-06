<%-- 
    Document   : postquestion
    Created on : May 22, 2019, 10:29:49 AM
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
        <h1 style="text-align: center;color: darkcyan;">Discussion Forum</h1>
        <form action="usercode/postquestioncode.jsp" method="post">
        <div style="height:0px auto;width:80%;margin: 0px auto;">
        <table class="table">
                        <tr>
                            <td>Enter your question</td>
                            <td><textarea name="questiontext" required=""></textarea></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><input type="submit" value="Post Question"/></td>
                        </tr>
                    </table><br/><br/>
                    <table class="table">
                        <tr>
                            <th>Question Id</th>
                            <th>Question</th>
                            <th>Asked By</th>
                            <th>Posted Date</th>
                            <th>Post Answer</th>
                            <th>View Answer</th>
                        </tr>
                        <%
                            ConnectDb db=new ConnectDb();
                            ResultSet rs=db.selectQuery("select * from question");
                            while(rs.next())
                            {
                        %>
                        <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td> 
                            <td><%=rs.getString(4)%></td> 
                            <td>
                                <a href="postanswer.jsp?qid=<%=rs.getInt(1)%>">Post</a>
                            </td>
                            <td>
                                <a href="viewanswer.jsp?qid=<%=rs.getInt(1)%>">View</a>
                            </td>
                        </tr>
                        <%}%>
        </table>
        <button style="margin-left: 45%;color: white;background-color: black;" onclick="window.location.href='dashboard.jsp'">Home</button>
        </div>
        </form>
        </div>
        <%@include file="usermaster/foot.jsp" %>
    </div>
    </body>
</html>
<%}%>