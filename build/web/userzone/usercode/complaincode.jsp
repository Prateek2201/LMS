<%@page import="mypackage.ConnectDb"%>
<%
    String name=session.getAttribute("name").toString();
    String subject=request.getParameter("subject");
    String complaintext=request.getParameter("complaintext");
    ConnectDb db=new ConnectDb();
    String complaindate=db.getDate();
    String query="insert into complain(name,subject,complaintext,complaindate) values('"+name+"','"+subject+"','"+complaintext+"','"+complaindate+"')";
    boolean res=db.executeNonQuery(query);
    if(res==true)
    {
        out.print("<script>alert('Complain is Log');window.location.href='../complain.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('Complain is not Log');window.location.href='../complain.jsp';</script>");
    }
%>