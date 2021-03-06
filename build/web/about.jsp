<%-- 
    Document   : about
    Created on : May 19, 2019, 10:36:23 PM
    Author     : Prateek Agrahari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/generalstyle.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="outer">
            <%@include file="generalmaster/head.jsp" %>
            <div id="content">
                <div id="left">
                    <%@include file="generalmaster/left.jsp" %>
                </div>
                <div id="right">
                    <h1 style="text-align: center;color: darkcyan;">About Us</h1>
        <div style="height:0px auto;width:90%;margin: 0px auto;text-align: justify;">
            <p style="font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Library Management System project is an initiative software to reduce the valuable time and paper-work in the schools and colleges as well as in professional libraries. In our project, we provide the facility for the administrator to add students, add new books, issue books for the individual students, submit books and manage students' profile too.</p>
            <p style="font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;While the students may login by using his/her registration number provided during the admission and written on the fees card. The students may also issue books, return books, view books' details in addition to admnistration. The students not only view his own profile but also change his password.</p>
            <p style="font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Therefore, this project-cum-software influences transparency among the students and faculty providing the basis for digital library.</p>
        </div>
                </div>
            </div>
            <%@include file="generalmaster/foot.jsp" %>
        </div>
    </body>
</html>