<%@page import="mypackage.ConnectDb"%>
<%
    String questiontext=request.getParameter("questiontext");
    String askedby=session.getAttribute("name").toString();
    ConnectDb db=new ConnectDb();
    String posteddate=db.getDate();
    String query="insert into question(questiontext,askedby,posteddate) values('"+questiontext+"','"+askedby+"','"+posteddate+"')";
    boolean res=db.executeNonQuery(query);
    if(res==true)
    {
        out.print("<script>alert('Question is posted');window.location.href='../postquestion.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('Question is not posted');window.location.href='../postquestion.jsp';</script>");
    }
%>