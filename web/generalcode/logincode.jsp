<%-- 
    Document   : logincode
    Created on : Mar 15, 2019, 8:13:40 PM
    Author     : Prateek Agrahari
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>
<%
    String sid=request.getParameter("sid");
    String password=request.getParameter("password");
    String query="select usertype from login where sid='"+sid+"' and password='"+password+"'";
    ConnectDb ob=new ConnectDb();
    ResultSet rs=ob.selectQuery(query);
    if(rs.next()==true)
    {
        String usertype=rs.getString(1);
        if(usertype.equals("user"))
        {
            String sql="select sname from student where sid='"+sid+"'";
            rs=ob.selectQuery(sql);
            rs.next();
            String name=rs.getString(1);
            session.setAttribute("userid", sid);
            session.setAttribute("name", name);
            response.sendRedirect("../loading.jsp");
        }
        else if(usertype.equals("admin"))
        {
            session.setAttribute("aid", sid);
            response.sendRedirect("../load.jsp");
        }
        else
        {
            out.print("<script>alert('Password not matched');window.location.href='../login.jsp'</script>");
        }
    }
    else
    {
        out.print("<script>alert('User_ID not matched');window.location.href='../login.jsp'</script>");
    }
%>