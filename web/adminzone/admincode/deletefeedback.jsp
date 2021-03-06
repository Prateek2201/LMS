<%@page import="mypackage.ConnectDb"%>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    ConnectDb db=new ConnectDb();
    String query="delete from feedback where id='"+id+"'";
    if(db.executeNonQuery(query)==true)
    {
        out.print("<script>alert('Feedback is deleted');window.location.href='../feedbackmgmt.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('Feedback is not deleted');window.location.href='../feedbackmgmt.jsp';</script>");
    }
%>