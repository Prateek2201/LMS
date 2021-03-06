<%-- 
    Document   : returncode
    Created on : Mar 18, 2019, 10:56:43 PM
    Author     : Prateek Agrahari
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>
<%
    String ret=request.getParameter("return");
    String bid=request.getParameter("bid");
    /*
    if(retrieve!=null)
    {
        String query="select * from issue where sid='"+sid+"'";
        ConnectDb ob=new ConnectDb();
        ResultSet rs=ob.selectQuery(query);
        if(rs.next()==true)
        {
            session.setAttribute("sid", rs.getString(7));
            session.setAttribute("sname", rs.getString(8));
            session.setAttribute("fname", rs.getString(9));
            session.setAttribute("course", rs.getString(10));
            session.setAttribute("branch", rs.getString(11));
            session.setAttribute("year", rs.getString(12));
            session.setAttribute("semester", rs.getString(13));            
            session.setAttribute("date", rs.getString(14));
            session.setAttribute("bid", rs.getString(1));
            session.setAttribute("bname", rs.getString(2));
            session.setAttribute("available", rs.getString(3));
            session.setAttribute("publisher", rs.getString(4));
            session.setAttribute("price", rs.getString(5));
            session.setAttribute("pages", rs.getString(6));
            response.sendRedirect("../return.jsp");
        }
        else
        {
            out.print("<script>alert('No Book issued by this Student ID');window.location.href='../return.jsp';</script>");
        }
    }*/
    if(ret!=null)
    {
        try{
                String sid=request.getParameter("sid");
                String sname=request.getParameter("sname");
                String fname=request.getParameter("fname");
                String course=request.getParameter("course");
                String branch=request.getParameter("branch");
                String year=request.getParameter("year");
                String semester=request.getParameter("semester");
                String bname=request.getParameter("bname");
                String available=request.getParameter("available");
                String publisher=request.getParameter("publisher");
                String price=request.getParameter("price");
                String pages=request.getParameter("pages");
                int copies=Integer.parseInt(request.getParameter("copies"));
                String issuedate=request.getParameter("doi");
                String returndate=request.getParameter("dor");
            String q1="insert into returnbook(sid,sname,fname,course,branch,year,semester,bid,bname,available,publisher,price,pages,issuedate,returndate) values('"+sid+"','"+sname+"','"+fname+"','"+course+"','"+branch+"','"+year+"','"+semester+"','"+bid+"','"+bname+"','"+available+"','"+publisher+"','"+price+"','"+pages+"','"+issuedate+"','"+returndate+"')";
            ConnectDb ob1=new ConnectDb();
            if(ob1.executeNonQuery(q1)==true)
            {
                String q2="delete from issue where bid='"+bid+"'";
                ConnectDb ob2=new ConnectDb();
                if(ob2.executeNonQuery(q2)==true)
                {
                    copies=copies+1;
                    String sql="update newbook set available='Yes',copies='"+copies+"' where bid='"+bid+"'";
                    ConnectDb ob3=new ConnectDb();
                    if(ob3.executeNonQuery(sql))
                    {
                    out.print("<script>alert('Book Returned successfully');window.location.href='../issuedetail.jsp';</script>");
                    }
                    else{
                        System.out.println(available);
                    }
                }
                else
                {
                   out.print("<script>alert('Book not deleted');window.location.href='../return.jsp';</script>");
                }
            }
            else{
                out.print("<script>alert('Book not inserted');window.location.href='../return.jsp';</script>");
            }
        }catch(Exception e){
            out.print("<script>alert('Book not inserted..');window.location.href='../return.jsp';</script>");
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
        session.removeAttribute("sid");
        session.removeAttribute("sname");
        session.removeAttribute("fname");
        session.removeAttribute("course");
        session.removeAttribute("branch");
        session.removeAttribute("year");
        session.removeAttribute("semester");
        session.removeAttribute("date");
        response.sendRedirect("../issuedetail.jsp");
    }
%>
