<%-- 
    Document   : adminissue
    Created on : May 3, 2019, 4:53:05 PM
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
<%@page import="mypackage.ConnectDb"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="adminstyle/genstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="outer">
        <%@include file="adminmaster/head.jsp" %>
        <div id="content">
        <h1 style="text-align: center;color: darkcyan;">Issue Book</h1>
        <form action="admincode/adminissuecode.jsp" method="post">
            <fieldset style="width: 30%;float: left;margin-left: 20%;">
            <table height="300px">
                <legend style="font-size: 25px;color: royalblue">Book Details</legend>
                    <%
                        String bid=(String)session.getAttribute("bid");
                        String bname=(String)session.getAttribute("bname");
                        String available=(String)session.getAttribute("available");
                        String publisher=(String)session.getAttribute("publisher");
                        String price1=(String)session.getAttribute("price");
                        String pages=(String)session.getAttribute("pages");
                        String copies=(String)session.getAttribute("copies");
                        if(bid==null)
                        {
                           bid=""; 
                           bname="";
                           available="";
                           publisher="";
                           price1="";
                           pages="";
                           copies="";
                        }
                        if(bname==null)
                        {
                            bid=""; 
                           bname="";
                           available="";
                           publisher="";
                           price1="";
                           pages="";
                           copies="";
                        }
                        String sid=(String)session.getAttribute("sid");
                        String sname=(String)session.getAttribute("sname");
                        String fname=(String)session.getAttribute("fname");
                        String course=(String)session.getAttribute("course");
                        String branch=(String)session.getAttribute("branch");
                        String year=(String)session.getAttribute("year");
                        String semester=(String)session.getAttribute("semester");
                        if(sid==null)
                        {
                           sid=""; 
                           sname="";
                           fname="";
                           course="";
                           branch="";
                           year="";
                           semester="";
                        }
                        if(sname==null)
                        {
                           sid=""; 
                           sname="";
                           fname="";
                           course="";
                           branch="";
                           year="";
                           semester="";
                        }
                    %>
                    <tr>
                        <td>Book ID</td>
                        <td><input type="text" name="bid" value="<%=bid%>"/></td>
                        <td><input style="margin-left: 50px;" type="submit" name="book" value="Search"/></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" value="<%=bname%>" readonly=""/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Available</td>
                        <td><input type="text" name="available" value="<%=available%>" readonly=""/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Publisher</td>
                        <td><input type="text" name="publisher" value="<%=publisher%>" readonly=""/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" name="price" value="<%=price1%>" readonly=""/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Pages</td>
                        <td><input type="text" name="pages" value="<%=pages%>" readonly=""/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>No. Of Copies</td>
                        <td><input type="text" name="copies" value="<%=copies%>" readonly="" /></td>
                    </tr>
            </table>
            </fieldset>
            <fieldset style="width: 30%;float: left;margin-left: 5%;">
            <table height="300px">
                <legend style="font-size: 25px;color: royalblue">Student Details</legend>
                    <tr>
                        <td>Student ID</td>
                        <td><input type="text" name="sid" value="<%=sid%>"/></td>
                        <td><input style="margin-left: 50px;" type="submit" name="student" value="Search"/></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="sname" value="<%=sname%>" readonly=""/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Father's Name</td>
                        <td><input type="text" name="fname" value="<%=fname%>" readonly=""/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Course</td>
                        <td><input type="text" name="course" value="<%=course%>" readonly=""/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Branch</td>
                        <td><input type="text" name="branch" value="<%=branch%>" readonly=""/></td>
                        <td></td>
                    </tr>
                    <tr>
                    <td>Year</td>
                    <td><input type="text" name="year" value="<%=year%>" readonly=""/></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Semester</td>
                    <td><input type="text" name="semester" value="<%=semester%>" readonly=""/></td>
                    <td></td>
                </tr>
            </table>
            </fieldset>
            <table style="margin: 0 auto;padding-top: 10px;font-size: 20px;width: 25%;">
                <%
                    ConnectDb ob=new ConnectDb();
                    String date=ob.getDate();
                %>
                <tr>
                    <td>Date of Issue</td>
                    <td><input type="text" name="date" value="<%=date%>" readonly=""/></td>
                </tr>
                <tr>
                    <td><input style="margin-left: 50px;" type="submit" name="issue" value="Issue"/></td>
                    <td><input style="margin-left: 50px;" type="submit" name="back" value="Back"/></td>
                </tr>
            </table>
        </form>
        </div>
                <%@include file="adminmaster/foot.jsp" %>
        </div>
    </body>
</html>
<%}%>