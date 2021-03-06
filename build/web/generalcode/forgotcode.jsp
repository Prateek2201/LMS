<%-- 
    Document   : searchcode
    Created on : Mar 16, 2019, 12:17:47 AM
    Author     : Prateek Agrahari
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb" %>
<%
    String sid=request.getParameter("sid");
    String answer=request.getParameter("answer");
    String search=request.getParameter("search");
    String retrieve=request.getParameter("retrieve");
    if(search!=null)
    {
        String query="select sname,question from student where sid='"+sid+"'";
        ConnectDb ob=new ConnectDb();
        ResultSet rs=ob.selectQuery(query);
        if(rs.next()==true)
        {
            String sname=rs.getString(1);
            String question=rs.getString(2);
            session.setAttribute("sid", sid);
            session.setAttribute("sname", sname);
            session.setAttribute("question", question);
            response.sendRedirect("../forget.jsp");
        }
        else
        {
            out.print("<script>alert('Student_ID not matched');window.location.href='../forget.jsp'</script>");
        }
    }
    else if(retrieve!=null)
    {
        String query="select password from student where sid='"+sid+"' and answer='"+answer+"'";
        ConnectDb ob=new ConnectDb();
        ResultSet rs=ob.selectQuery(query);
        if(rs.next()==true)
        {
            String password=rs.getString(1);
            session.setAttribute("sid", sid);
            session.setAttribute("answer", answer);
            session.setAttribute("password", password);
            response.sendRedirect("../forget.jsp");
        }
        else
        {
            out.print("<script>alert('Answer not matched');window.location.href='../forget.jsp'</script>");
        }
    }
    else
    {
        session.removeAttribute("sid");
        session.removeAttribute("answer");
        response.sendRedirect("../login.jsp");
    }
%>
