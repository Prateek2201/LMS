<%@page import="mypackage.ConnectDb"%>
<%
    String name=session.getAttribute("name").toString();
    String reviewtext=request.getParameter("reviewtext");
    int rating=Integer.parseInt(request.getParameter("rating"));
    ConnectDb db=new ConnectDb();
    String posteddate=db.getDate();
    String query="insert into review(name,reviewtext,rating,posteddate) values('"+name+"','"+reviewtext+"','"+rating+"','"+posteddate+"')";
    boolean res=db.executeNonQuery(query);
    if(res==true)
    {
        out.print("<script>alert('review is successful');window.location.href='../review.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('review is not successful');window.location.href='../review.jsp';</script>");
    }
%>