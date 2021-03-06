<%@page import="mypackage.ConnectDb"%>
<%@page import="java.sql.ResultSet"%>
<%
    String sid=request.getParameter("sid");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String sname=request.getParameter("sname");
    String fname=request.getParameter("fname");
    String course=request.getParameter("course");
    String branch=request.getParameter("branch");
    String year=request.getParameter("year");
    String semester=request.getParameter("semester");
    String mobno=request.getParameter("mobno");
    String address=request.getParameter("address");
    try{
        String sql="update student set email='"+email+"',password='"+password+"',sname='"+sname+"',fname='"+fname+"',course='"+course+"',branch='"+branch+"',year='"+year+"',semester='"+semester+"',mobno='"+mobno+"',address='"+address+"' where sid='"+sid+"'";
        ConnectDb ob=new ConnectDb();
        if(ob.executeNonQuery(sql)){
            out.print("<script>alert('Profile updated successfully');window.location.href='../stdmgmt.jsp';</script>");
        }
        else{
            System.out.println(mobno);
            out.print("<script>alert('Profile not updated');window.location.href='../stdmgmt.jsp';</script>");
        }
    }
    catch(Exception e)
    {
        out.print("<script>alert('Values not updated');window.location.href='../stdmgmt.jsp';</script>");
    }
%>