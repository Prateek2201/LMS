<%@page import="mypackage.ConnectDb"%>
<%
    String username=request.getParameter("uname");
    String name=request.getParameter("name");
    String password=request.getParameter("password");
    String question=request.getParameter("question");
    String answer=request.getParameter("answer");
    String query1="insert into account values('"+username+"','"+name+"','"+password+"','"+question+"','"+answer+"')";
    String query2="insert into login values('"+username+"','"+password+"')";
    ConnectDb ob=new ConnectDb();
    if(ob.executeNonQuery(query1)==true)
    {
        if(ob.executeNonQuery(query2)==true)
        {
            out.print("<script>alert('Account has created');window.location.href='../login.jsp';</script>");
        }
        else
        {
            out.print("<script>alert('Account has not created');window.location.href='../login.jsp';</script>");
        }
    }
%>
