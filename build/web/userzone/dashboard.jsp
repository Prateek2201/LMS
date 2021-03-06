<%-- 
    Document   : dashboard
    Created on : Mar 17, 2019, 10:37:50 PM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="userstyle/dashboardstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="outer">
            <%@include file="usermaster/head.jsp" %>
            <div id="content">
                <div id="action">
                    <div id="op1">
                        <div id="op"><button onclick="window.location.href='issue.jsp'"><img src="../images/pexels-photo-261909.jpeg" alt=""/></button></div>
                        <div id="p1">Issue Book</div>
                    </div>
                    <div id="op1">
                        <div><button onclick="window.location.href='issuedetail.jsp'"><img src="../images/pexels-photo-572056.jpeg" alt=""/></button></div>
                        <div id="p1">Return Book</div>
                    </div>
                    <div id="op1">
                        <div><button onclick="window.location.href='bookdetail.jsp'"><img src="../images/pexels-photo-209151.jpeg" alt=""/></button></div>
                        <div id="p1">Book Details</div>
                    </div>
                </div>
            </div>
        </div>
            <%@include file="../generalmaster/foot.jsp" %>
    </body>
</html>
<%}%>