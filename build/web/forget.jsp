<%--    
    Document   : forget
    Created on : Mar 15, 2019, 12:46:24 AM
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
        <div id="outer" style="height: 0px auto;">
        <form action="generalcode/forgotcode.jsp" method="post">
            <%@include file="generalmaster/head.jsp" %>
            <div id="content" style="height: 380px;">
        <h1 style="text-align: center;color: darkcyan;">Forget Password</h1>
        <div style="height:0px auto;width:50%;margin: 0px auto;">
        <table class="table">
                <%
                    String sid=(String)session.getAttribute("sid");
                    String name=(String)session.getAttribute("sname");
                    String question=(String)session.getAttribute("question");
                    String answer=(String)session.getAttribute("answer");
                    String password=(String)session.getAttribute("password");
                    if(sid==null)
                    {
                       sid="";
                       name="";
                       question="";
                       answer="";
                       password="";
                    }
                    if(answer==null)
                    {
                       answer="";
                       password="";
                    }
                %>
                <tr>
                    <td>Student_ID</td>
                    <td><input type="text" name="sid" id="uname" value="<%=sid%>"/></td>
                    <td><input type="submit" name="search" value="Search"/></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="sname" value="<%=name%>" readonly=""/></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Your Security Question</td>
                    <td><input type="text" name="qustion" value="<%=question%>" readonly=""/></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Answer</td>
                    <td><input type="text" name="answer" value="<%=answer%>"/></td>
                    <td><input type="submit" name="retrieve" value="Retrieve"/></td>
                </tr>
                <tr>
                    <td>Your Password</td>
                    <td><input type="text" name="password" value="<%=password%>" readonly=""/></td>
                    <td></td>
                </tr>
            </table>
            <button style="margin-top: 5px;margin-left: 48%;color: white;background-color: black;" type="submit" name="back">Back</button>        
            </div>
        </div>
        </form>
        <%@include file="../generalmaster/foot.jsp" %>
        </div>
    </body>
</html>
