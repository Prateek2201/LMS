<%-- 
    Document   : index.jsp
    Created on : Mar 15, 2019, 12:17:57 AM
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
        <script src="js/slider.js"></script>
    </head>
    <body onload="moveSlider()">
        <div id="outer">
            <%@include file="generalmaster/head.jsp" %>
            <div id="content">
                <div id="left">
                    <%@include file="generalmaster/left.jsp" %>
                </div>
                <div id="right">
                    <img id="slide" width="960" height="350"/>
                </div>
            </div>
            <%@include file="generalmaster/foot.jsp" %>
        </div>
    </body>
</html>