<%-- 
    Document   : adminreturncode
    Created on : May 3, 2019, 5:02:33 PM
    Author     : Prateek Agrahari
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>
<%
    String ret=request.getParameter("return");
    String bid=request.getParameter("bid");
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
            String q1="insert into returnbook(sid,sname,fname,course,branch,year,semester,bid,bname,available,publisher,price,pages,issuedate,returndate) values('"+sid+"','"+sname+"','"+fname+"','"+course+"','"+branch+"','"+year+"','"+semester+"','"+bid+"','"+bname+"','Yes','"+publisher+"','"+price+"','"+pages+"','"+issuedate+"','"+returndate+"')";
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
                    out.print("<script>alert('Book Returned successfully');window.location.href='../adminissuedetail.jsp';</script>");
                    }
                    else{
                        System.out.println(available);
                    }
                }
                else
                {
                   out.print("<script>alert('Book not deleted');window.location.href='../adminreturn.jsp';</script>");
                }
            }
            else{
                out.print("<script>alert('Book not inserted');window.location.href='../adminreturn.jsp';</script>");
            }
        }catch(Exception e){
            out.print("<script>alert('Book not inserted..');window.location.href='../adminreturn.jsp';</script>");
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
        response.sendRedirect("../adminissuedetail.jsp");
    }
%>
