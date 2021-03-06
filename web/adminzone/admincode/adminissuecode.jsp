<%-- 
    Document   : adminissuecode
    Created on : May 3, 2019, 5:00:41 PM
    Author     : Prateek Agrahari
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>
<%
    String book=request.getParameter("book");
    String student=request.getParameter("student");
    String issue=request.getParameter("issue");
    String bid=request.getParameter("bid");
    String sid=request.getParameter("sid");
    if(book!=null)
    {
        String query="select * from newbook where bid='"+bid+"'";
        ConnectDb ob=new ConnectDb();
        ResultSet rs=ob.selectQuery(query);
        if(rs.next()==true)
        {
            session.setAttribute("bid", bid);
            session.setAttribute("bname", rs.getString(2));
            session.setAttribute("available", rs.getString(3));
            session.setAttribute("publisher", rs.getString(4));
            session.setAttribute("price", rs.getString(5));
            session.setAttribute("pages", rs.getString(6));
            session.setAttribute("copies", rs.getString(7));
            response.sendRedirect("../adminissue.jsp");
        }
        else
        {
            out.print("<script>alert('Book ID not found');window.location.href='../adminissue.jsp';</script>");
        }
    }
    else if(student!=null) 
    {
        String query="select * from student where sid='"+sid+"'";
        ConnectDb ob=new ConnectDb();
        ResultSet rs=ob.selectQuery(query);
        if(rs.next()==true)
        {
            session.setAttribute("sid", sid);
            session.setAttribute("sname", rs.getString(4));
            session.setAttribute("fname", rs.getString(5));
            session.setAttribute("course", rs.getString(6));
            session.setAttribute("branch", rs.getString(7));
            session.setAttribute("year", rs.getString(8));
            session.setAttribute("semester", rs.getString(9));            
            response.sendRedirect("../adminissue.jsp");
        }
        else
        {
            out.print("<script>alert('Student ID not found');window.location.href='../adminissue.jsp';</script>");
        }
    }
    else if(issue!=null)
    {
        String bname=request.getParameter("name");
        String available=request.getParameter("available");
        String publisher=request.getParameter("publisher");
        String price=request.getParameter("price");
        String pages=request.getParameter("pages");
        int copies=Integer.parseInt(request.getParameter("copies"));
        String sname=request.getParameter("sname");
        String fname=request.getParameter("fname");
        String course=request.getParameter("course");
        String branch=request.getParameter("branch");
        String year=request.getParameter("year");
        String semester=request.getParameter("semester");
        String issuedate=request.getParameter("date");
        String query="insert into issue(bid,bname,publisher,price,pages,sid,sname,fname,course,branch,year,semester,issuedate) values('"+bid+"','"+bname+"','"+publisher+"','"+price+"','"+pages+"','"+sid+"','"+sname+"','"+fname+"','"+course+"','"+branch+"','"+year+"','"+semester+"','"+issuedate+"')";
        ConnectDb ob=new ConnectDb();
        if(ob.executeNonQuery(query)==true)
        {
            copies=copies-1;
            String sql="";
            if(copies==0){
                sql="update newbook set available='No',copies='"+copies+"' where bid='"+bid+"'";
            }
            else if(copies<0){
                out.print("<script>alert('Book with Book_ID="+bid+" is not available');window.location.href='../issue.jsp';</script>");
            }
            else{
            sql="update newbook set copies='"+copies+"' where bid='"+bid+"'";
            }
            ConnectDb ob1=new ConnectDb();
            if(ob1.executeNonQuery(sql))
            {
               String sql1="delete from returnbook where bid='"+bid+"'";
               ConnectDb ob2=new ConnectDb();
               ob2.executeNonQuery(sql1);
            out.print("<script>alert('Book Issued successfully');window.location.href='../adminissue.jsp';</script>");
            }
            else{
                System.out.println(available);
            }
        }
        else
        {
            out.print("<script>alert('Book with Book_ID="+bid+" is not available');window.location.href='../adminissue.jsp';</script>");
        }
    }
    else
    {
        session.removeAttribute("bid");
        session.removeAttribute("bname");
        session.removeAttribute("edition");
        session.removeAttribute("publisher");
        session.removeAttribute("price");
        session.removeAttribute("pages");
        session.removeAttribute("copies");
        session.removeAttribute("sid");
        session.removeAttribute("sname");
        session.removeAttribute("fname");
        session.removeAttribute("course");
        session.removeAttribute("branch");
        session.removeAttribute("year");
        session.removeAttribute("semester");
        response.sendRedirect("../adminhome.jsp");
    }
%>
