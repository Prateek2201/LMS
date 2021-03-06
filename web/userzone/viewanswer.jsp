<%-- 
    Document   : viewanswer
    Created on : May 22, 2019, 11:17:35 AM
    Author     : Prateek Agrahari
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>
<%
    if(session.getAttribute("userid")==null)
    {
        response.sendRedirect("../login.jsp");
    }
    else
    {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <h1 style="text-align: center;color: darkcyan;">View Answer</h1>
        <div style="height:0px auto;width:50%;margin: 0px auto;">
        <table class="table">
            <tr>
                            <th>Answer id</th>
                            <th>Answer</th>
                            <th>Answer By</th>
                            <th>Posted Date</th>
                            <th>Question Id</th>
                        </tr>
                            <%
                                int qid=Integer.parseInt(request.getParameter("qid"));
                                ConnectDb db=new ConnectDb();
                                ResultSet rs=db.selectQuery("select * from answer where qid='"+qid+"'");
                                while(rs.next())
                                {
                            %>
                            <tr>
                                <td><%=rs.getInt(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getInt(5)%></td>
                            </tr>
                            <%}%>
        </table>
        <button style="margin-left: 45%;color: white;background-color: black;" onclick="window.location.href='postquestion.jsp'">Back</button>
        </div>
        </div>
        <%@include file="usermaster/foot.jsp" %>
    </div>
    </body>
</html>
<%}%>
