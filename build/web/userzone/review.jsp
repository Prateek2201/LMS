<%-- 
    Document   : review
    Created on : May 22, 2019, 9:57:02 AM
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
            <h1 style="text-align: center;color: darkcyan;">Give your Review</h1>
            <form action="usercode/reviewcode.jsp" method="post">
            <div style="height:0px auto;width:50%;margin: 0px auto;">
                <table class="table">
                    <tr>
                            <td>Enter your Review</td>
                            <td><textarea name="reviewtext" required=""></textarea></td>
                        </tr>
                        <tr>
                            <td>Select the Rating</td>
                            <td>
                                <input type="radio" name="rating" value="1"/>1<br/>
                                <input type="radio" name="rating" value="2"/>2<br/>
                                <input type="radio" name="rating" value="3"/>3<br/>
                                <input type="radio" name="rating" value="4"/>4<br/>
                                <input type="radio" name="rating" value="5"/>5
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><input type="submit" value="Submit"/></td>
                        </tr>
                </table>
        <button style="margin-top: 5px;margin-left: 48%;color: white;background-color: black;" onclick="window.location.href='dashboard.jsp'">Home</button>
        </div>
        </form>
        </div>
        </div>
        <%@include file="usermaster/foot.jsp" %>
    </body>
</html>
<%}%>