<%-- 
    Document   : login
    Created on : Mar 15, 2019, 12:19:46 AM
    Author     : Prateek Agrahari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/generalstyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="outer">
        <form action="generalcode/logincode.jsp" method="post">
            <%@include file="generalmaster/head.jsp" %>
            <div id="center" style="height: 400px;">
                <div id="left">
                    <%@include file="generalmaster/left.jsp" %>
                </div>
                <div id="content">
        <h1 style="text-align: center;color: darkcyan;">Login-Page</h1>
        <div style="height:0px auto;width: 50%;margin: 0px auto;">
        <table class="table">
                        <tr>
                            <td>Enter User_ID</td>
                            <td>
                                <input type="text" name="sid" required=""/>
                            </td>
                        </tr>
                        <tr>
                            <td>Enter Password</td>
                            <td>
                                <input type="password" name="password" required=""/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" value="Login"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="color: red;">Forget Password...!</td>
                            <td>
                                <button onclick="window.location.href='forget.jsp'">Forget Password</button>
                            </td>
                        </tr>
                    </table>
        </div>            
                </div>
        </div>
        </form>
            <%@include file="generalmaster/foot.jsp" %>
        </div>
    </body>
</html>