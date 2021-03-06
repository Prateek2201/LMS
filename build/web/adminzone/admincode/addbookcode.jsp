<%-- 
    Document   : addbookcode
    Created on : Mar 17, 2019, 1:52:14 PM
    Author     : Prateek Agrahari
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb" %>
<%
    String bid=request.getParameter("bid");
    String name=request.getParameter("bname");
    String publisher=request.getParameter("publisher");
    String price=request.getParameter("price");
    String pages=request.getParameter("pages");
    String query="insert into newbook(bid,name,available,publisher,price,pages) values('"+bid+"','"+name+"','Yes','"+publisher+"','"+price+"','"+pages+"')";
    ConnectDb ob=new ConnectDb();
    if(ob.executeNonQuery(query)==true)
    {
        out.print("<script>alert('New Book added');window.location.href='../addbook.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('Book not added');window.location.href='../addbook.jsp';</script>");
    }
%>