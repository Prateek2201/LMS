<%-- 
    Document   : signup
    Created on : Mar 15, 2019, 12:30:27 AM
    Author     : Prateek Agrahari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">New Account</h1>
        <form action="generalcode/signupcode.jsp" method="post">
            <table style="width: 50%;margin: 0 auto;">
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="uname" required=""/></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" required=""/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" required=""/></td>
                </tr>
                <tr>
                    <td>Security Question</td>
                    <td>
                        <select name="question">
                            <option>Select</option>
                            <option>What is your nick name?</option>
                            <option>What is your mother tongue?</option>
                            <option>What is your favourite colour?</option>
                            <option>What is your first school name?</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Answer</td>
                    <td><input type="text" name="answer" required=""/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Create"/></td>
                    <td><button onclick="window.location.href='login.jsp'">Back</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
