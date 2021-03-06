<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    ConnectDb db=new ConnectDb();
    String query="delete from review where id='"+id+"'";
    if(db.executeNonQuery(query)==true)
    {
        out.print("<script>alert('Review is deleted');window.location.href='../reviewmgmt.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('Review is not deleted');window.location.href='../reviewmgmt.jsp';</script>");
    }
%>