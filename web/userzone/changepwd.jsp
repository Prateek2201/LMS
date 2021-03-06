<%-- 
    Document   : changepwd
    Created on : May 12, 2019, 3:36:14 PM
    Author     : Prateek Agrahari
--%>

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
        <form action="usercode/changepwdcode.jsp" method="post">
        <div id="outer">
            <%@include file="usermaster/head.jsp" %>
        <div id="content" style="height: 335px;">
        <h1 style="text-align: center;color: darkcyan;">Change Password</h1>
        <div style="height:0px auto;width:50%;margin: 0px auto;">
        <table class="table">
            <tr>
                            <td>Enter old Password:</td>
                            <td><input type="password" name="oldpassword" placeholder="Enter old Password" required=""/></td>
                        </tr>
                        <tr>
                            <td>Enter New Password:</td>
                            <td><input type="password" name="newpassword" placeholder="Enter new password" required=""/></td>
                        </tr>
                        <tr>
                            <td>Enter Confirm Password:</td>
                            <td><input type="password" name="confirmpassword" placeholder="Enter confirm password" required=""/></td>
                        </tr>
                </table>
            <button style="margin-top: 40px;margin-left: 40%;color: white;background-color: black;" type="submit">Change</button>
            <button style="margin-top: 40px;color: white;background-color: black;" onclick="window.location.href='dashboard.jsp'">Home</button>
        </div>
        </div>
    </div>    
    </form>
            <%@include file="usermaster/foot.jsp" %>
    </body>
</html>
