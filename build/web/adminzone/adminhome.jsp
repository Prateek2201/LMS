<%-- 
    Document   : adminhome
    Created on : May 2, 2019, 10:26:06 PM
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="adminstyle/homestyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="outer">
            <%@include file="adminmaster/head.jsp" %>
            <div id="content">
                <div id="operation">
                    <div id="op1"><button onclick="window.location.href='addbook.jsp'"><img src="../images/pexels-photo-261909.jpeg" alt=""/></button></div>
                    <div id="op2"><button onclick="window.location.href='statistics.jsp'"><img src="../images/pexels-photo-572056.jpeg" alt=""/></button></div>
                    <div id="op3"><button onclick="window.location.href='addstudent.jsp'"><img src="../images/pexels-photo-209151.jpeg" alt=""/></button></div>
                </div>
                <div id="point">
                    <div id="p1">Add Book</div>
                    <div id="p2">Statistics</div>
                    <div id="p3">New Student</div>
                </div>
                <div id="action">
                    <div id="op1"><button onclick="window.location.href='adminissue.jsp'"><img src="../images/7.jpg" alt=""/></button></div>
                    <div id="op2"><button onclick="window.location.href='adminissuedetail.jsp'"><img src="../images/6.jpg" alt=""/></button></div>
                    <div id="op3"><button onclick="window.location.href='bookdetails.jsp'"><img src="../images/8.jpg" alt=""/></button></div>
                </div>
                <div id="point">
                    <div id="p1">Issue Book</div>
                    <div id="p2">Return Book</div>
                    <div id="p3">Book Details</div>
                </div>
            </div>
            <%@include file="adminmaster/foot.jsp" %>
        </div>
    </body>
</html>
<%}%>