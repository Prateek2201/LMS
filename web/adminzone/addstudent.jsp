<%-- 
    Document   : student
    Created on : Mar 17, 2019, 7:02:53 PM
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
<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="adminstyle/genstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            td{
                padding-left: 10px;
            }
        </style>
    </head>
    <body>
        <div id="outer">
        <%@include file="adminmaster/head.jsp" %>
        <div id="content">
        <h1 style="text-align: center;color: darkcyan;">Student Signup</h1>
        <form action="../uploadcode" method="post" enctype="multipart/form-data">
            <div style="height:0px auto;width:60%;margin: 0px auto;">
            <table class="table">
                <tr>
                    <td>Registration No.</td>
                    <td><input type="number" name="sid" required=""/></td>
                    <td>Year</td>
                    <td>
                        <select name="year" required="" style="width: 172.5px;">
                            <option>Select</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Email_ID</td>
                    <td><input type="email" name="email" required="" /></td>
                    <td>Semester</td>
                    <td>
                        <select name="semester" required="" style="width: 172.5px;">
                    <option>Select</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="password" style="width: 168px;" required=""/></td>
                    <td>Contact No.</td>
                    <td><input type="number" min="1000000000" max="9999999999" name="mobno" required="" style="width: 172.5px;"/></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="sname" required=""/></td>
                    <td>Address</td>
                    <td>
                        <textarea name="address" required="" style="width: 172.5px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Father's Name</td>
                    <td><input type="text" name="fname" required=""/></td>
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
                    <td>Course</td>
                    <td>
                        <select name="course" required="" style="width: 172.5px;">
                            <option>Select Course</option>
                            <option>B Tech</option>
                            <option>Diploma</option>
                            <option>B E</option>
                            <option>M Sc</option>
                            <option>B Sc</option>
                            <option>M Com</option>
                            <option>B Com</option>
                        </select>
                    </td>
                    <td>Answer</td>
                    <td><input type="text" name="answer" required=""/></td>
                </tr>
                <tr>
                    <td>Branch</td>
                    <td><input type="text" name="branch" required=""/></td>
                    <td>Upload Product Pic:</td>
                    <td>
                        <input type="file" name="pic" required=""/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: right;"><input type="submit" value="Register"/></td>
                    <td><input type="button" onclick="window.location.href='adminhome.jsp'" value="Back"/></td>
                    <td></td>
                </tr>
            </table>
            </div>
        </form>
        
        <h1 style="text-align: center;color: darkcyan;">Student Details</h1>
        <div style="height:0px auto;width:80%;margin: 0px auto;">
        <table class="table">
            <tr>
                <th>Registration No.</th>
                <th>Email_ID</th>
                <th>Password</th>
                <th>Name</th>
                <th>Father's Name</th>
                <th>Course</th>
                <th>Branch</th>
                <th>Year</th>
                <th>Semester</th>
                <th>Contact No.</th>
                <th>Address</th>
                <th>Pic</th>
            </tr>
            <%
            String sql="select * from student";
            ConnectDb ob=new ConnectDb();
            ResultSet rs=ob.selectQuery(sql);
            while(rs.next())
            {
            %>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(8)%></td>
                <td><%=rs.getString(9)%></td>
                <td><%=rs.getString(10)%></td>
                <td><%=rs.getString(11)%></td>
                <td><img src="<%=request.getContextPath()+"/upload/"+rs.getString(14) %>" height="50" width="50"/></td>
            </tr>
            <%
            }
            %>
        </table>
        </div>
        </div>
        <%@include file="adminmaster/foot.jsp" %>
        </div>
    </body>
</html>
<%}%>