<%@page import="mypackage.ConnectDb"%>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    ConnectDb db=new ConnectDb();
    String query="delete from complain where id='"+id+"'";
    if(db.executeNonQuery(query)==true)
    {
        out.print("<script>alert('The complain is deleted');window.location.href='../complainmgmt.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('The complain is not deleted');window.location.href='../complainmgmt.jsp';</script>");
    }
%>