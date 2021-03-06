<%-- 
    Document   : postanswer
    Created on : May 22, 2019, 11:10:41 AM
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
        <h1 style="text-align: center;color: darkcyan;">Post Answer</h1>
        <form action="usercode/postanswercode.jsp" method="post">
        <div style="height:0px auto;width:50%;margin: 0px auto;">
        <table class="table">
            <tr>
                            <td> Enter Answer:</td>
                            <td><textarea name="answertext" required=""></textarea></td>
                        </tr>
                        <tr>
                            <td>
                                <%
                                    int qid=Integer.parseInt(request.getParameter("qid"));
                                %>
                                <input type="hidden" name="qid" value="<%=qid%>"/>
                             </td>
                            <td><input type="submit" value="post answer"></td>
                        </tr>
        </table>
        <button style="margin-left: 45%;color: white;background-color: black;" onclick="window.location.href='postquestion.jsp'">Back</button>
        </div>
        </form>
        </div>
        <%@include file="usermaster/foot.jsp" %>
    </div>
    </body>
</html>
<%}%>
